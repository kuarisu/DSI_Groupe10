using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;
using UnityEngine.SceneManagement;

public class GameManager : MonoBehaviour {

    public static GameManager instance;
    public LevelManager levelManager;
    public UIManager uiManager;
    public PlayerController player;
    public GameObject PlayerVisual;
    public ParticleSystem PlayerDestruction;
    public GameObject bulletReturn;

    [HideInInspector]
    public int scoreToDraw;
    public bool isUiInPos;
    public bool isPlayerDead;
    public bool hasGameLaunched;
    public bool loaded;
    public bool gamestarted;
    public int experience;

    [Header("GAMEPLAY")]
    public int scorePerSecond;
    public float chunkSize;
    public int distanceScore;
    public int enemyScore;
    public int bonusScore;
    public int totalScore;
    public float xpMultiplier;
    public float TimeBeforeRespawn;
    public float TimeForEffect;
    public List<int> toNextLevel = new List<int>();
    //Data to save
    public int highScore;
    public int playerXP;
    public int playerLvl;
    public bool firstTime;
    public string gameversion;
    public bool reseted;


    [Header("ANALYTICS")]
    public GameObject currentChunk;
    public int currentChunk_ID;
    public GameObject enemyKiller;
    public int enemyKiller_ID;
    public int enemyChunkPassed;
    public int bonusChunkPassed;
    public int totalChunkPassed;
    public int tapShots;
    public int sprayShots;


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

        Amplitude amplitude = Amplitude.Instance;
        amplitude.logging = true;
        amplitude.init("7cc53a06785cde378112e5cd205bae7d");

        levelManager = GetComponent<LevelManager>();
        uiManager = GetComponent<UIManager>();
        player = GameObject.Find("Player").GetComponent<PlayerController>();

        //Camera Initialization
        Screen.orientation = ScreenOrientation.Portrait;
        Camera.main.orthographicSize = ((Screen.height * (chunkSize + (0.5f * Screen.height / Screen.width))) / Screen.width) / 2;

        InitGame();

        if (PlayerPrefs.HasKey("GameVersion") == false || PlayerPrefs.GetString("GameVersion") != gameversion)
        {
            ResetSave();
            PlayerPrefs.SetString("GameVersion", Application.version);
        }
    }

    public void InitGame()
    {
        gamestarted = false;
        hasGameLaunched = false;
        isUiInPos = false;
        isPlayerDead = false;
        firstTime = true;
        enemyScore = 0;
        distanceScore = 0;
        totalScore = 0;
        GetSave();

        if(uiManager.isSound != false)
            AudioListener.volume = 1;
        else
            AudioListener.volume = 0;

        PlayerExperience();
    }

    public void ReinitializeGame()
    {
        InitGame();
        levelManager.InitLevel();
        uiManager.InitUI();
        player.InitPlayer();
    }

    //When player tap for first time to launch a game
    public void LaunchGame()
    {
        gamestarted = true;
        player.gameObject.transform.DOMoveY(player.targetPosition.y, 1.75f).SetEase(Ease.InOutBack).OnComplete(GameLaunched);
        levelManager.InstantiateChunks();
        CameraPos(uiManager.isRight);
        levelManager.M_background.DOFloat(-50, "_Speed", 2f);

        SoundManager.Instance.StartCoroutine("PlayMainTheme");

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
        uiManager.score.gameObject.SetActive(true);

        uiManager.playerInterface.transform.parent.GetComponent<RectTransform>().DOScale(1, 0.5f).SetEase(Ease.OutBack);

        if(uiManager.isRight)
            uiManager.playerInterface.GetComponent<RectTransform>().DOAnchorPosX(0.75f, 0.5f).SetEase(Ease.OutBack);
        else
            uiManager.playerInterface.GetComponent<RectTransform>().DOAnchorPosX(-0.75f, 0.5f).SetEase(Ease.OutBack);
    }

    public void CameraPos(bool right)
    {
        RectTransform rectTransform = uiManager.playerInterface.GetComponent<RectTransform>();

        //For a right-handed player: UI is on the left
        if (right)
        {
            Camera.main.transform.DOMoveX(-Camera.main.orthographicSize * 0.035f, 2f).OnComplete(UiInPos);
            uiManager.score.transform.localPosition = new Vector3(chunkSize, uiManager.score.transform.localPosition.y, 0);


            rectTransform.anchorMin = new Vector2(0, 0.5f);
            rectTransform.anchorMax = new Vector2(0, 0.5f);
            rectTransform.pivot = new Vector2(0, 0.5f);
            rectTransform.anchoredPosition = new Vector3(-50, 0, 0);

            uiManager.isRight = true;
        }
        else
        {
            Camera.main.transform.DOMoveX(Camera.main.orthographicSize * 0.035f, 2f).OnComplete(UiInPos);
            uiManager.score.transform.localPosition = new Vector3(-chunkSize, uiManager.score.transform.localPosition.y, 0);

            rectTransform.anchorMin = new Vector2(1, 0.5f);
            rectTransform.anchorMax = new Vector2(1, 0.5f);
            rectTransform.pivot = new Vector2(1, 0.5f);
            rectTransform.anchoredPosition = new Vector3(50, 0, 0);

            uiManager.isRight = false;
        }
        
    }

    public void Scoring(int add,string tag)
    {
        switch (tag)
        {
            case "enemy":
                enemyScore += add;
                break;
            case "bonuses":
                bonusScore += add;
                break;
        }
        DOTween.Restart("ShakeScale");
        DOTween.Kill("ShakeScale");
        uiManager.score.transform.DOShakeScale(1, 1, 20, 90, true).SetEase(Ease.InQuad).SetId("ShakeScale");
        uiManager.score.transform.DOShakePosition(1, Vector3.up * 10, 20, 0, false, true).SetEase(Ease.InQuad).SetId("ShakeScale");
        uiManager.score.transform.DOShakeRotation(0.8f, 5, 20, 90, true).SetEase(Ease.InQuad).SetId("ShakeScale");
    }

    public void PlayerDeath()
    {
        isPlayerDead = true;
        SoundManager.Instance.PlayerDeath.Play();  
        if (totalScore > highScore)
            highScore = totalScore;
        PlayerExperience();
        AnalyticsManager.instance.DeathAnalyticsRegistration();
        totalScore = 0;
        SetSave();
        StartCoroutine(DestroyedCoroutine());
        StartCoroutine(DeathEffect());
        PlayerDestruction.Play();

        PlayerVisual.GetComponent<Collider2D>().enabled = false;
        SoundManager.Instance.PLayerTrailSound.Stop();
    }

    public void PlayerExperience()
    {
       /* experience = 0;
        playerXP += Mathf.RoundToInt(totalScore * xpMultiplier);

        for (int i = 0; i < playerLvl+1; i++)
        {
            experience += toNextLevel[i];
            if (playerXP >= experience)
            {
                playerLvl++;
            }
        }
        uiManager.playerExp.maxValue = experience;*/
    }

    IEnumerator DestroyedCoroutine()
    {
        yield return new WaitForSeconds(TimeBeforeRespawn);
        SceneManager.LoadScene(0);
    }

    IEnumerator DeathEffect()
    {
        levelManager.scrollSpeed = 0;
        float _Value = 0;
        float _CurrentTime = 0;
        while (_CurrentTime <= TimeForEffect)
        {
            _Value = Mathf.Lerp(0, 1, _CurrentTime);
            PlayerVisual.GetComponent<SpriteRenderer>().material.SetFloat("_Destroy", _Value);
            player.transform.FindChild("FX_AvatarTrail").gameObject.SetActive(false);
            _CurrentTime += Time.deltaTime;
            yield return new WaitForEndOfFrame();
        }

        yield break;

    }

    public void SetSave()
    {
        PlayerPrefs.SetString("firstTime", firstTime.ToString());
        PlayerPrefs.SetString("GameVersion", Application.version);

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
        gameversion = PlayerPrefs.GetString("GameVersion");
        highScore = PlayerPrefs.GetInt("Highscore");
        playerXP = PlayerPrefs.GetInt("Experience");
        playerLvl = PlayerPrefs.GetInt("Level");

        if (PlayerPrefs.GetString("isSound") != "False")
            uiManager.isSound = true;
        else
            uiManager.isSound = false;

        if (PlayerPrefs.GetString("isRight") != "False")
            uiManager.isRight = true;
        else
            uiManager.isRight = false;

        if (PlayerPrefs.GetString("isNormal") != "False")
            uiManager.isNormal = true;
        else
            uiManager.isNormal = false;

        if (PlayerPrefs.HasKey("firstTime"))
        {
            if (PlayerPrefs.GetString("firstTime") != "False")
                firstTime = false;
        }
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
        PlayerPrefs.DeleteKey("firstTime");
        InitGame();
    }

    public void OnApplicationQuit()
    {
       SetSave();
    }

    void UiInPos()
    {
        isUiInPos = true;
    }
}
