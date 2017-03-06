using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class LevelManager : MonoBehaviour {

    public List<GameObject> chunks = new List<GameObject>();
    public List<GameObject> backgrounds = new List<GameObject>();
    public List<GameObject> chunksPoint = new List<GameObject>();
    public List<GameObject> currentChunk = new List<GameObject>(2);
    public List<GameObject> currentBackground = new List<GameObject>(2);
    public GameObject bulletDestroyer;
    public int currentbgIndex;
    public GameObject DoorHolder;

    [Header("GAMEPLAY")]
    public int chunkPassed;
    public int maxChunk;
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

    void Awake()
    {
        gm = GameManager.instance;

        InstantiateBackground();
        bulletDestroyer.transform.position = new Vector3(0, -(Camera.main.orthographicSize + 5), 0);

        playerController = gm.player.GetComponent<PlayerController>();
        maxOffsetY = playerController.maxOffsetY;

        InitLevel();
    }

    public void InitLevel()
    {
        currentChunk.Clear();
    }

    void Update()
    {
        playerOffsetY = playerController.distanceOffsetY;

        // Scrolling
        if (playerOffsetY > 0f)
            speedModifier = Mathf.Lerp(0, -1, playerOffsetY / maxOffsetY);
        else
            speedModifier = Mathf.Lerp(0, 1, playerOffsetY / maxOffsetY);

        MoveBackground();
        if (gm.gamestarted)
        {
            MoveChunks();
            ChunkPassed();
        }
    }

    void InstantiateBackground()
    {
        GameObject firstBackground = (GameObject)Instantiate(backgrounds[currentbgIndex], new Vector3(0, 0, 1), new Quaternion(0, 0, 0, 0));
        currentBackground.Add(firstBackground);
        GameObject secondBackground = (GameObject)Instantiate(backgrounds[currentbgIndex], new Vector3(0, -46, 1), new Quaternion(0, 0, 0, 0));
        currentBackground.Add(secondBackground);
    }

    void MoveBackground()
    {
        foreach (GameObject background in currentBackground)
            background.transform.position = (background.transform.position + (Vector3.up * (scrollSpeed + speedModifier * scrollSpeedRange * bgSpeedRatio / 100f) * Time.deltaTime));

        if (currentBackground[1].transform.position.y >= 0f)
        {
            GameObject oldBackground = currentBackground[0];
            currentBackground.Remove(currentBackground[0]);
            GameObject secondBackground = oldBackground;
            oldBackground.transform.position = new Vector3(0, currentBackground[0].transform.position.y - 46f, 1);
            currentBackground.Add(secondBackground);
        }
    }

    public void InstantiateChunks()
    {
        GameObject firstChunk = (GameObject)Instantiate(chunks[(int)Random.Range(0, chunks.Count - 1)], new Vector3(0, -46, 1), new Quaternion(0, 0, 0, 0));
        currentChunk.Add(firstChunk);
        DoorHolder.transform.SetParent(firstChunk.transform);
        GameObject secondChunk = (GameObject)Instantiate(chunks[(int)Random.Range(0, chunks.Count - 1)], new Vector3(0, -92, 1), new Quaternion(0, 0, 0, 0));
        currentChunk.Add(secondChunk);
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

            if (chunkPassed != maxChunk-1)
            {
                GameObject secondChunk = (GameObject)Instantiate(chunks[(int)Random.Range(0, chunks.Count - 1)], new Vector3(0, currentChunk[0].transform.position.y - 46f, 1), new Quaternion(0, 0, 0, 0));
                currentChunk.Add(secondChunk);
            }
            else
            {
                GameObject secondChunk = (GameObject)Instantiate(chunksPoint[(int)Random.Range(0, chunksPoint.Count - 1)], new Vector3(0, currentChunk[0].transform.position.y - 46f, 1), new Quaternion(0, 0, 0, 0));
                currentChunk.Add(secondChunk);
            }
            hasPassedChunk = false;
        }
    }

    void ChunkPassed()
    {
        if (currentChunk[0].transform.position.y >= 46 - (gm.player.targetPosition.y*2) && !hasPassedChunk)
        {
            if (currentChunk[0].tag != "Chunkpoint")
                chunkPassed++;
            else
                chunkPassed = 0;
            hasPassedChunk = true;
        }
    }
}
