﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;
using UnityEngine.SceneManagement;

public class GameManager : MonoBehaviour {

    public static GameManager instance;
    public LevelManager levelManager;
    public UIManager uiManager;
    public PlayerController player;

    public bool loaded;
    public bool gamestarted;
    public bool hasGameLaunched;
    public float chunkSize;
    public int score;

    //Data to save
    public int highScore;
    public int playerXP;
    public int playerLvl;


    void Awake()
    {
        if (instance == null)
        {
            instance = this;
        }
        else {
            instance.loaded = true;
            Destroy(gameObject);
        }

        levelManager = GetComponent<LevelManager>();
        uiManager = GetComponent<UIManager>();
        Screen.orientation = ScreenOrientation.Portrait;
        player = GameObject.Find("Player").GetComponent<PlayerController>();

        //Camera Initialization
        Camera.main.orthographicSize = ((Screen.height * (chunkSize + (0.5f * Screen.height / Screen.width))) / Screen.width) / 2;

        InitGame();
    }

    public void InitGame()
    {
        gamestarted = false;
        hasGameLaunched = false;
        GetSave();
        //highScore = score;
        score = 0;
    }

    //When player tap for first time to launch a game
    public void LaunchGame()
    {
        gamestarted = true;
        player.gameObject.transform.DOMoveY(player.targetPosition.y, 1.75f).SetEase(Ease.InOutBack).OnComplete(GameLaunched);
        levelManager.InstantiateChunks();
        CameraPos(uiManager.isRight);

        //Initialize Player UI
        uiManager.M_ammoCount.SetFloat("_AmmoMax", player.maxBullet);
        uiManager.M_ammoCount.SetFloat("_AmmoCurrent", player.maxBullet);
        uiManager.M_ammoCount.SetVector("_ColorFull", Color.yellow);
        uiManager.M_ammoCount.SetVector("_ColorEmpty", Color.red);

    }

    //When player character is at target position (after introduction animation)
    public void GameLaunched()
    {
        hasGameLaunched = true;
        uiManager.Score.gameObject.SetActive(true);

        uiManager.playerInterface.transform.parent.GetComponent<RectTransform>().DOScale(1, 0.5f).SetEase(Ease.OutBack);

        if(uiManager.isRight)
            uiManager.playerInterface.GetComponent<RectTransform>().DOAnchorPosX(0.75f, 0.5f).SetEase(Ease.OutBack);
        else
            uiManager.playerInterface.GetComponent<RectTransform>().DOAnchorPosX(-0.75f, 0.5f).SetEase(Ease.OutBack);
    }

    public void CameraPos(bool right)
    {
        
        //For a right-handed player: UI is on the left
        if (right)
        {
            Camera.main.transform.DOMoveX(-Camera.main.orthographicSize * 0.035f, 2f);
            uiManager.Score.transform.localPosition = new Vector3(chunkSize, uiManager.Score.transform.localPosition.y, 0);

            RectTransform rectTransform = uiManager.playerInterface.GetComponent<RectTransform>();
            rectTransform.anchorMin = new Vector2(0, 0.5f);
            rectTransform.anchorMax = new Vector2(0, 0.5f);
            rectTransform.pivot = new Vector2(0, 0.5f);
            rectTransform.anchoredPosition = new Vector3(-50, 0, 0);

            uiManager.isRight = true;
        }
        else
        {
            Camera.main.transform.DOMoveX(Camera.main.orthographicSize * 0.035f, 2f);
            uiManager.Score.transform.localPosition = new Vector3(-chunkSize, uiManager.Score.transform.localPosition.y, 0);

            RectTransform rectTransform = uiManager.playerInterface.GetComponent<RectTransform>();
            rectTransform.anchorMin = new Vector2(1, 0.5f);
            rectTransform.anchorMax = new Vector2(1, 0.5f);
            rectTransform.pivot = new Vector2(1, 0.5f);
            rectTransform.anchoredPosition = new Vector3(50, 0, 0);

            //uiManager.ammoCount.transform.DOScaleX(-uiManager.ammoCount.transform.localScale.x,0.1f);
            uiManager.isRight = false;
        }
        
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

    public void PlayerDeath()
    {
        Debug.Log("HighScore Before: " + highScore);
        if (score > highScore)
            highScore = score;
        Debug.Log("HighScore After: " + highScore);
        score = 0;
        SetSave();
        SceneManager.LoadScene(0);
    }

    public void SetSave()
    {
        //Player Stats
        PlayerPrefs.SetInt("Highscore", highScore);
        PlayerPrefs.SetInt("Experience", playerXP);
        PlayerPrefs.SetInt("PlayerLevel", playerLvl);

        //Player Settings
        PlayerPrefs.SetString("isSound", uiManager.isSound.ToString());
        PlayerPrefs.SetString("isRight", uiManager.isRight.ToString());
        PlayerPrefs.SetString("isNormal", uiManager.isSound.ToString());

        PlayerPrefs.Save();
    }

    public void GetSave()
    {
        highScore = PlayerPrefs.GetInt("Highscore");

        if (PlayerPrefs.GetString("isSound") == "True")
            uiManager.isSound = true;
        else
            uiManager.isSound = false;

        if (PlayerPrefs.GetString("isRight") == "True")
            uiManager.isRight = true;
        else
            uiManager.isRight = false;

        if (PlayerPrefs.GetString("isNormal") == "True")
            uiManager.isNormal = true;
        else
            uiManager.isNormal = false;
    }

    public void ResetSave()
    {
        //Player Stats
        PlayerPrefs.DeleteKey("Highscore");
        PlayerPrefs.DeleteKey("Experience");
        PlayerPrefs.DeleteKey("PlayerLevel");
    }

    public void ResetSettings()
    {
        PlayerPrefs.DeleteKey("isSound");
        PlayerPrefs.DeleteKey("isRight");
        PlayerPrefs.DeleteKey("isNormal");
    }

    public void OnApplicationQuit()
    {
       SetSave();
    }
}
