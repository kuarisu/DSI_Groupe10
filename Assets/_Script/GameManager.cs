using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class GameManager : MonoBehaviour {

    public static GameManager instance;
    public LevelManager levelManager;
    public UIManager uiManager;
    public bool loaded;
    public bool gamestarted;
    public bool hasGameLaunched;
    public float chunkSize;
    public int score;

    PlayerController playerController;

    void Awake()
    {
        if (instance == null)
        {
            //DontDestroyOnLoad(gameObject);
            instance = this;
        }
        else {
            instance.loaded = true;
            Destroy(gameObject);
        }

        gamestarted = false;
        hasGameLaunched = false;
        levelManager = GetComponent<LevelManager>();
        uiManager = GetComponent<UIManager>();

        Screen.orientation = ScreenOrientation.Portrait;
        playerController = GameObject.Find("Player").GetComponent<PlayerController>();

        //Camera Initialization
        CameraPos(true);
        Camera.main.orthographicSize = ((Screen.height * chunkSize) / Screen.width) / 2;
    }

    public void LaunchGame()
    {
        gamestarted = true;
        playerController.gameObject.transform.DOMoveY(playerController.targetPosition.y, 1.75f).SetEase(Ease.InOutBack).OnComplete(GameLaunched);
        levelManager.InstantiateChunks();

        //Initialize ammo bar UI
        uiManager.M_ammoCount.SetFloat("_AmmoMax", playerController.maxBullet);
        uiManager.M_ammoCount.SetFloat("_AmmoCurrent", playerController.maxBullet);
        uiManager.M_ammoCount.SetVector("_ColorFull", Color.yellow);
        uiManager.M_ammoCount.SetVector("_ColorEmpty", Color.red);

    }

    public void GameLaunched()
    {
        hasGameLaunched = true;
        uiManager.playerUI.gameObject.SetActive(true);
    }

    public void CameraPos(bool right)
    {
        if (right)
            Camera.main.transform.position = new Vector3(-0.25f, 0, -10);
        else
            Camera.main.transform.position = new Vector3(0.25f, 0, -10);
    }

    public void Scoring(int add)
    {
        score += add;
        uiManager.Score.text = score.ToString();
        DOTween.Restart("ShakeScale");
        DOTween.Kill("ShakeScale");
        uiManager.Score.transform.DOShakeScale(1, 1, 20, 90, true).SetEase(Ease.InQuad).SetId("ShakeScale");
        uiManager.Score.transform.DOShakePosition(1, Vector3.up * 10, 20, 0, false, true).SetEase(Ease.InQuad).SetId("ShakeScale");
        uiManager.Score.transform.DOShakeRotation(0.8f, 5, 20, 90, true).SetEase(Ease.InQuad).SetId("ShakeScale");
    }
}
