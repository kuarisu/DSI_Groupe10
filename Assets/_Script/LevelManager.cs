using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class LevelManager : MonoBehaviour {

    public float scrollSpeed;
    public float scrollSpeedRange;
    public float tileSizeZ;
    public List<GameObject> chunks = new List<GameObject>();

    private float speedModifier;

    PlayerController playerController;
    Transform player;
    Vector2 playerStartPos;
    float playerOffsetY;
    float maxOffsetY;
    List<GameObject> currentChunk = new List<GameObject>(2);

    void Start()
    {
        GameObject firstChunk = (GameObject)Instantiate(chunks[(int)Random.Range(0, chunks.Count - 1)],new Vector3(0, 0, 1), new Quaternion(0,0,0,0));
        currentChunk.Add(firstChunk);
        GameObject secondChunk = (GameObject)Instantiate(chunks[(int)Random.Range(0, chunks.Count - 1)], new Vector3(0, -40, 1), new Quaternion(0, 0, 0, 0));
        currentChunk.Add(secondChunk);

        playerController = GameObject.Find("Player").GetComponent<PlayerController>();
        player = playerController.GetComponent<Transform>();
        playerStartPos = playerController.targetPosition;
        maxOffsetY = playerController.maxOffsetY;
    }

    void ShootFeedback()
    {

    }

    void Update()
    {
        playerOffsetY = playerController.distanceOffsetY;
        // Scrolling
        if (playerOffsetY > 0f)
            speedModifier = Mathf.Lerp(0, -1, playerOffsetY / maxOffsetY);
        else
            speedModifier = Mathf.Lerp(0, 1, playerOffsetY / maxOffsetY);

        Debug.Log(speedModifier);

        foreach(GameObject chunk in currentChunk)
            chunk.transform.position = chunk.transform.position + Vector3.up * (scrollSpeed + speedModifier * scrollSpeedRange)/100;  

        if(currentChunk[1].transform.position.y >= 0f)
        {
            GameObject oldChunk = currentChunk[0];
            currentChunk.Remove(currentChunk[0]);
            Destroy(oldChunk);
            GameObject secondChunk = (GameObject)Instantiate(chunks[(int)Random.Range(0, chunks.Count - 1)], new Vector3(0, currentChunk[0].transform.position.y - 40f, 1), new Quaternion(0, 0, 0, 0));
            currentChunk.Add(secondChunk);
        }
    }
}
