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

    public GameObject bulletReturn;

    public int scorePerSecond;
    public bool loaded;
    public bool gamestarted;
    public bool hasGameLaunched;
    public float chunkSize;
    public int score;
    public int scoreToDraw;
    public bool isUiInPos;
    public bool isPlayerDead;

    //Data to save
    public int highScore;
    public int playerXP;
    public int playerLvl;
    public bool firstTime;

    public float TimeBeforeRespawn;
    public float TimeForEffect;
    public GameObject PlayerVisual;
    public ParticleSystem PlayerDestruction;


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

        if (Debug.isDebugBuild)
        {
            QualitySettings.vSyncCount = 0;
            Application.targetFrameRate = 60;
        }
            InitGame();
    }

    public void InitGame()
    {
        gamestarted = false;
        hasGameLaunched = false;
        isUiInPos = false;
        isPlayerDead = false;
        firstTime = true;
        score = 0;
        GetSave();
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

    public void Scoring(int add)
    {
        uiManager.UIlocalScore += add/2;
        DOTween.Restart("ShakeScale");
        DOTween.Kill("ShakeScale");
        uiManager.score.transform.DOShakeScale(1, 1, 20, 90, true).SetEase(Ease.InQuad).SetId("ShakeScale");
        uiManager.score.transform.DOShakePosition(1, Vector3.up * 10, 20, 0, false, true).SetEase(Ease.InQuad).SetId("ShakeScale");
        uiManager.score.transform.DOShakeRotation(0.8f, 5, 20, 90, true).SetEase(Ease.InQuad).SetId("ShakeScale");
    }

    public void PlayerDeath()
    {
        isPlayerDead = true;

        if (score > highScore)
            highScore = score;

        score = 0;
        SetSave();
        StartCoroutine(DestroyedCoroutine());
        StartCoroutine(DeathEffect());
        PlayerDestruction.Play();

        PlayerVisual.GetComponent<Collider2D>().enabled = false;
    }

    Dictionary<string, object> DeathDictionary = new Dictionary <string, object>();

    IEnumerator DestroyedCoroutine()
    {
        DeathDictionary.Add("score", (int) uiManager.UIlocalScore);
        yield return new WaitForSeconds(TimeBeforeRespawn);
        Amplitude.Instance.logEvent("Death", DeathDictionary);
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

        if (PlayerPrefs.HasKey("firstTime"))
        {
            if (PlayerPrefs.GetString("firstTime") == "False")
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
