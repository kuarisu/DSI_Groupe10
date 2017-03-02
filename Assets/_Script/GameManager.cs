using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class GameManager : MonoBehaviour {

    public static GameManager instance;
    public bool loaded;
    public bool gamestarted;
    public bool hasGameLaunched;
    public float chunkSize;

    PlayerController playerController;

    void Awake()
    {
        if (instance == null)
        {
            DontDestroyOnLoad(gameObject);
            instance = this;
        }
        else {
            instance.loaded = true;
            Destroy(gameObject);
        }

        gamestarted = false;
        hasGameLaunched = false;

        Screen.orientation = ScreenOrientation.Portrait;
        playerController = GameObject.Find("Player").GetComponent<PlayerController>();

        //Set camera size depending on aspect ratio
        Camera.main.orthographicSize = ((Screen.height * chunkSize) / Screen.width) / 2;

    }

    // Update is called once per frame
    void Update () {

    }

    public void LaunchGame()
    {
        gamestarted = true;
        playerController.gameObject.transform.DOMoveY(playerController.targetPosition.y, 1.75f).SetEase(Ease.InOutBack).OnComplete(GameLaunched);
    }

    public void GameLaunched()
    {
        hasGameLaunched = true;
    }
}
