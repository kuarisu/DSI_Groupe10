using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class LevelManager : MonoBehaviour {

    public List<GameObject> currentChunk = new List<GameObject>(2);
    public GameObject background;
    public Material M_background;
    public GameObject bulletDestroyer;
    public int currentbgIndex;
    public GameObject DoorHolder;
    public GameObject scoreFeedback;

    [Header("LEVEL DESIGN")]
    public List<GameObject> easyChunks = new List<GameObject>();
    public List<GameObject> normalChunks = new List<GameObject>();
    public List<GameObject> hardChunks = new List<GameObject>();
    public List<GameObject> chunksPoint = new List<GameObject>();
    [Tooltip("Score needed to increase the difficulty")]
    public List<int> difficultyLevels = new List<int>();

    [Header("GAMEPLAY")]
    public int chunkPassed;
    [Tooltip("Number of max chunk according to the difficulty")]
    public List<int> maxChunk;
    public int currentMaxChunk;
    public float scrollSpeed;
    public float scrollSpeedRange;
    public float tileSizeZ;
    public float speedModifier;
    public float bgSpeedRatio;

    PlayerController playerController;
    float playerOffsetY;
    float maxOffsetY;
    GameManager gm;
    bool startTimer;
    float timeT;
    bool hasPassedChunk;
    GameObject firstChunk;
    GameObject secondChunk;

    void Awake()
    {
        gm = GameManager.instance;
        //M_background = background.GetComponent<Material>();

        bulletDestroyer.transform.position = new Vector3(0, -(Camera.main.orthographicSize + 5), 0);

        playerController = gm.player.GetComponent<PlayerController>();
        maxOffsetY = playerController.maxOffsetY;

        InitLevel();
    }

    public void InitLevel()
    {
        currentChunk.Clear();
        currentMaxChunk = maxChunk[0];
        M_background.SetFloat("_Speed",-100f);
    }

    void Update()
    {
        playerOffsetY = playerController.distanceOffsetY;

        // Scrolling
        if (playerOffsetY > 0f)
            speedModifier = Mathf.Lerp(0, -1, playerOffsetY / maxOffsetY);
        else
            speedModifier = Mathf.Lerp(0, 1, playerOffsetY / maxOffsetY);

        if (gm.gamestarted)
        {
            MoveChunks();
            ChunkPassed();
        }
    }

    public void InstantiateChunks()
    {
        firstChunk = (GameObject)Instantiate(easyChunks[(int)Random.Range(0, easyChunks.Count - 1)], new Vector3(0, -46, 1), new Quaternion(0, 0, 0, 0));
        currentChunk.Add(firstChunk);
        DoorHolder.transform.SetParent(firstChunk.transform);
        secondChunk = (GameObject)Instantiate(easyChunks[(int)Random.Range(0, easyChunks.Count - 1)], new Vector3(0, -92, 1), new Quaternion(0, 0, 0, 0));
        currentChunk.Add(secondChunk);
        gm.currentChunk = firstChunk;
        gm.currentChunk_ID = firstChunk.GetComponent<ElementID>().e_ID;
    }

    void MoveChunks()
    {
        foreach(GameObject chunk in currentChunk)
            chunk.transform.position = (chunk.transform.position + (Vector3.up * (scrollSpeed + speedModifier * scrollSpeedRange /100f) * Time.deltaTime));

        NewChunk();  
    }

    void NewChunk()
    {
        if (currentChunk[1].transform.position.y >= 0)
        {
            GameObject oldChunk = currentChunk[0];
            currentChunk.Remove(currentChunk[0]);
            Destroy(oldChunk);

            if (chunkPassed != currentMaxChunk - 1)
            {
                if (gm.totalScore < difficultyLevels[0])
                {
                     secondChunk = (GameObject)Instantiate(easyChunks[(int)Random.Range(0, easyChunks.Count - 1)], new Vector3(0, currentChunk[0].transform.position.y - 46f, 1), new Quaternion(0, 0, 0, 0));
                }
                else if(gm.totalScore > difficultyLevels[0] && gm.totalScore < difficultyLevels[1])
                {
                    currentMaxChunk = maxChunk[1];
                    int random = Mathf.RoundToInt(Random.Range(0.0f, 1.0f));
                    switch (random)
                    {
                        case 0:
                            secondChunk = (GameObject)Instantiate(easyChunks[(int)Random.Range(0, easyChunks.Count - 1)], new Vector3(0, currentChunk[0].transform.position.y -46f, 1), new Quaternion(0, 0, 0, 0));
                            break;
                        case 1:
                            secondChunk = (GameObject)Instantiate(normalChunks[(int)Random.Range(0, normalChunks.Count - 1)], new Vector3(0, currentChunk[0].transform.position.y - 46f, 1), new Quaternion(0, 0, 0, 0));
                            break;
                    }
                }
                else if(gm.totalScore > difficultyLevels[1] && gm.totalScore < difficultyLevels[2])
                {
                    currentMaxChunk = maxChunk[2];
                    secondChunk = (GameObject)Instantiate(normalChunks[(int)Random.Range(0, normalChunks.Count - 1)], new Vector3(0, currentChunk[0].transform.position.y - 46f, 1), new Quaternion(0, 0, 0, 0));
                }
                else if (gm.totalScore > difficultyLevels[2] && gm.totalScore < difficultyLevels[3])
                {
                    currentMaxChunk = maxChunk[3];
                    int random = Mathf.RoundToInt(Random.Range(0.0f, 1.0f));
                    switch (random)
                    {
                        case 0:
                            secondChunk = (GameObject)Instantiate(normalChunks[(int)Random.Range(0, normalChunks.Count - 1)], new Vector3(0, currentChunk[0].transform.position.y - 46f, 1), new Quaternion(0, 0, 0, 0));
                            break;
                        case 1:
                            secondChunk = (GameObject)Instantiate(hardChunks[(int)Random.Range(0, hardChunks.Count - 1)], new Vector3(0, currentChunk[0].transform.position.y - 46f, 1), new Quaternion(0, 0, 0, 0));
                            break;
                    }
                }else if(gm.totalScore > difficultyLevels[3])
                {
                    currentMaxChunk = maxChunk[4];
                    secondChunk = (GameObject)Instantiate(hardChunks[(int)Random.Range(0, hardChunks.Count - 1)], new Vector3(0, currentChunk[0].transform.position.y - 46f, 1), new Quaternion(0, 0, 0, 0));
                }
               currentChunk.Add(secondChunk);
            }
            else
            {
                secondChunk = (GameObject)Instantiate(chunksPoint[(int)Random.Range(0, chunksPoint.Count - 1)], new Vector3(0, currentChunk[0].transform.position.y - 46f, 1), new Quaternion(0, 0, 0, 0));
                currentChunk.Add(secondChunk);
            }
            gm.uiManager.SetSlider();
            hasPassedChunk = false;
        }
    }

    void ChunkPassed()
    {
        if (currentChunk[0].transform.position.y >= 46f - (23-gm.player.targetPosition.y) && !hasPassedChunk)
        {
            if (currentChunk[0].tag != "Chunkpoint")
            {
                chunkPassed++;
                gm.enemyChunkPassed++;
            }
            else
            {
                chunkPassed = 0;
                gm.bonusChunkPassed++;
            }
            hasPassedChunk = true;
            gm.currentChunk = secondChunk;
            gm.currentChunk_ID = secondChunk.GetComponent<ElementID>().e_ID;
            gm.totalChunkPassed = gm.enemyChunkPassed + gm.bonusChunkPassed;
        }
    }
}
