using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class LevelManager : MonoBehaviour {

    public float scrollSpeed;
    public float scrollSpeedRange;
    public float tileSizeZ;
    public List<GameObject> chunks = new List<GameObject>();
    public List<GameObject> backgrounds = new List<GameObject>();
    public int currentbgIndex;
    public float bgSpeedRatio;

    private float speedModifier;

    PlayerController playerController;
    Transform player;
    Vector2 playerStartPos;
    float playerOffsetY;
    float maxOffsetY;
    List<GameObject> currentChunk = new List<GameObject>(2);
    List<GameObject> currentBackground = new List<GameObject>(2);

    void Start()
    {
        InstantiateBackground();
        InstantiateChunks();

        playerController = GameObject.Find("Player").GetComponent<PlayerController>();
        player = playerController.GetComponent<Transform>();
        playerStartPos = playerController.targetPosition;
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
        MoveChunks();
    }

    void InstantiateChunks()
    {
        GameObject firstChunk = (GameObject)Instantiate(chunks[(int)Random.Range(0, chunks.Count - 1)], new Vector3(0, 0, 1), new Quaternion(0, 0, 0, 0));
        currentChunk.Add(firstChunk);
        GameObject secondChunk = (GameObject)Instantiate(chunks[(int)Random.Range(0, chunks.Count - 1)], new Vector3(0, -46, 1), new Quaternion(0, 0, 0, 0));
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
            chunk.transform.position = chunk.transform.position + Vector3.up * (scrollSpeed + speedModifier * scrollSpeedRange)/100;  

        if(currentChunk[1].transform.position.y >= 0f)
        {
            GameObject oldChunk = currentChunk[0];
            currentChunk.Remove(currentChunk[0]);
            Destroy(oldChunk);
            GameObject secondChunk = (GameObject)Instantiate(chunks[(int)Random.Range(0, chunks.Count - 1)], new Vector3(0, currentChunk[0].transform.position.y - 46f, 1), new Quaternion(0, 0, 0, 0));
            currentChunk.Add(secondChunk);
        }
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
}
