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
    public float bgSpeedRatio;
    public GameObject DoorHolder;

    [Header("GAMEPLAY")]
    public int chunkPassed;
    public int maxChunk;
    public float scrollSpeed;
    public float scrollSpeedRange;
    public float tileSizeZ;

    float speedModifier;
    PlayerController playerController;
    float playerOffsetY;
    float maxOffsetY;
    GameManager gm;
    bool startTimer;
    float timeT;
    bool sliderHasChanged;

    void Start()
    {
        gm = GameManager.instance;
        currentChunk.Clear();

        InstantiateBackground();
        bulletDestroyer.transform.position = new Vector3(0, -(Camera.main.orthographicSize + 5), 0);

        playerController = GameObject.Find("Player").GetComponent<PlayerController>();
        maxOffsetY = playerController.maxOffsetY;
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
            MoveChunks();
    }

    public void InstantiateChunks()
    {
        GameObject firstChunk = (GameObject)Instantiate(chunks[(int)Random.Range(0, chunks.Count - 1)], new Vector3(0, -46, 1), new Quaternion(0, 0, 0, 0));
        currentChunk.Add(firstChunk);
        DoorHolder.transform.SetParent(firstChunk.transform);
        GameObject secondChunk = (GameObject)Instantiate(chunks[(int)Random.Range(0, chunks.Count - 1)], new Vector3(0, -92, 1), new Quaternion(0, 0, 0, 0));
        currentChunk.Add(secondChunk);
    }

    void InstantiateBackground()
    {
        GameObject firstBackground = (GameObject)Instantiate(backgrounds[currentbgIndex], new Vector3(0, 0, 1), new Quaternion(0, 0, 0, 0));
        currentBackground.Add(firstBackground);
        GameObject secondBackground = (GameObject)Instantiate(backgrounds[currentbgIndex], new Vector3(0, -46, 1), new Quaternion(0, 0, 0, 0));
        currentBackground.Add(secondBackground);
    }

    void MoveChunks()
    {
        foreach(GameObject chunk in currentChunk)
            chunk.transform.position = (chunk.transform.position + Vector3.up * (scrollSpeed + speedModifier * scrollSpeedRange)/100);

        NewChunk();
        SliderChange();    
    }

    void MoveBackground()
    {
        foreach (GameObject background in currentBackground)
            background.transform.position = (background.transform.position + Vector3.up * (scrollSpeed + speedModifier * scrollSpeedRange) * bgSpeedRatio / 100) ;

        if (currentBackground[1].transform.position.y >= 0f)
        {
            GameObject oldBackground = currentBackground[0];
            currentBackground.Remove(currentBackground[0]);
            GameObject secondBackground = oldBackground;
            oldBackground.transform.position = new Vector3(0, currentBackground[0].transform.position.y - 46f, 1);
            currentBackground.Add(secondBackground);
        }
    }

    void NewChunk()
    {

        if (currentChunk[1].transform.position.y >= 0f)
        {
            GameObject oldChunk = currentChunk[0];
            currentChunk.Remove(currentChunk[0]);
            Destroy(oldChunk);

            if (chunkPassed < maxChunk - 2)
            {
                GameObject secondChunk = (GameObject)Instantiate(chunks[(int)Random.Range(0, chunks.Count - 1)], new Vector3(0, currentChunk[0].transform.position.y - 46f, 1), new Quaternion(0, 0, 0, 0));
                currentChunk.Add(secondChunk);
                if (gm.player.isInChunkPoint == false)
                    chunkPassed++;
                else
                    chunkPassed--;
            }
            else
            {
                GameObject secondChunk = (GameObject)Instantiate(chunksPoint[(int)Random.Range(0, chunksPoint.Count - 1)], new Vector3(0, currentChunk[0].transform.position.y - 46f, 1), new Quaternion(0, 0, 0, 0));
                currentChunk.Add(secondChunk);
                chunkPassed = 0;
            }
            sliderHasChanged = false;
        }
    }

    void SliderChange()
    {
        if (currentChunk[1].transform.position.y >= -23f + gm.player.targetPosition.y && !sliderHasChanged)
        {
            if (chunkPassed < maxChunk)
                gm.uiManager.slider.value += 1;
            else
                gm.uiManager.slider.value = 0;

            sliderHasChanged = true;
        }
    }
}
