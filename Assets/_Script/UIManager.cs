using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Rendering;
using DG.Tweening;
using UnityEngine.SceneManagement;

public class UIManager : MonoBehaviour {

    [Header("MAIN MENU")]
    public Canvas mainMenuCanvas;
    public GameObject title;
    public GameObject startText;
    public GameObject achievements;
    public GameObject settings;
    public GameObject leaderboards;
    public GameObject start;
    public GameObject highscore;
    public GameObject play;
    public GameObject earlyAccess;

    [Header("SETTINGS")]
    public Canvas settingsCanvas;
    public GameObject On;
    public GameObject Off;
    public GameObject Normal;
    public GameObject High;
    public GameObject Right;
    public GameObject Left;
    public GameObject Yes;
    public GameObject No;
    public GameObject Reset;
    public Color unselected;

    [Header("PLAYERUI")]
    public Canvas playerUI;
    public GameObject playerProgress;
    public GameObject bulletIndicator;
    public GameObject playerInterface;
    public Text score;
    public int scoreToDraw;
    public Image ammoCount;
    public Material M_ammoCount;
    public GameObject leftRight;

    public bool isSound;
    public bool isNormal;
    public bool isRight;
    public bool isRate;
    public bool factorySettings;
    public Slider slider;

    GameManager gm;
    bool menuIsHidden;
    bool clikedButton;
    Text highScoreText;
    bool scoreUpdated;
    float timePassed;

    // Use this for initialization
    void Awake () {
        gm = GameManager.instance;
        TitleFeedback();
        StartFeedback();
        highScoreText = highscore.GetComponent<Text>();
        menuIsHidden = false;
        M_ammoCount = ammoCount.material;

        InitSettings();

        SetHighScore();

        slider = playerProgress.GetComponent<Slider>();
        slider.value = 0;
        slider.maxValue = gm.levelManager.maxChunk;
        if (gm.firstTime == false)
            earlyAccess.SetActive(false);
    }

    // Update is called once per frame
    void Update()
    {
        if (gm.gamestarted && !menuIsHidden)
        {
            LeaveUp();
            LeaveDown();
            menuIsHidden = true;
        }

        if (gm.hasGameLaunched && !scoreUpdated)
        {
            scoreUpdated = true;
            StartCoroutine("ScoreOverDistance");
        }

        ScoreUpdate();

        //The end value needs to be more precise!
        //if (gm.hasGameLaunched && gm.player.isInChunkPoint == false)
            //slider.value += (slider.maxValue*Time.deltaTime/26f);
    }

    IEnumerator ScoreOverDistance()
    {
        gm.score += gm.scorePerSecond;
        yield return new WaitForSeconds(0.1f);
        scoreUpdated = false;
    }

    public void ScoreUpdate()
    {
        if(scoreToDraw <= gm.score) {
            score.text = scoreToDraw.ToString();
            scoreToDraw += (int)(scoreToDraw*Time.deltaTime);
        }      
    }

    public void GameStart()
    {
        if (!SplashScreen.isFinished) return;
        start.SetActive(false);
        gm.LaunchGame();
        highscore.transform.DOScale(3, 1f);
        highScoreText.DOFade(0, 1f);
        achievements.SetActive(false);
        settings.SetActive(false);
        leaderboards.SetActive(false);
    }

    public void InitSettings()
    {
        if (PlayerPrefs.HasKey("isSound"))
            gm.GetSave();
        else
        {
            isSound = true;
            isNormal = true;
            isRight = true;
            isRate = false;
        }
    }

    public void CheckSettings()
    {
        //Sound On or Off?
        if (isSound)
        {
            On.GetComponent<Text>().color = Color.white;
            Off.GetComponent<Text>().color = unselected;
        }
        else if(!isSound)
        {
            On.GetComponent<Text>().color = unselected;
            Off.GetComponent<Text>().color = Color.white;
        }

        //Normal or Fantastic?
        if (isNormal)
        {
            Normal.GetComponent<Text>().color = Color.white;
            High.GetComponent<Text>().color = unselected;
        }
        else if (!isNormal)
        {
            High.GetComponent<Text>().color = unselected;
            Normal.GetComponent<Text>().color = Color.white;
        }

        //Is Right or Left-Handed?
        if (isRight)
        {
            Right.GetComponent<Text>().color = Color.white;
            Left.GetComponent<Text>().color = unselected;
        }
        else if (!isRight)
        {
            Right.GetComponent<Text>().color = unselected;
            Left.GetComponent<Text>().color = Color.white;
        }
    }

    public void SetHighScore()
    {
        highScoreText.text = "" + gm.highScore;
    }

    public void ShowAchievements()
    {
        if (!SplashScreen.isFinished) return;
        settingsCanvas.gameObject.SetActive(true);
        achievements.transform.DOPunchScale(new Vector3(0.2f, 0.2f, 1), 1f, 4, 1);
    }

    public void ShowSettings()
    {
        if (!SplashScreen.isFinished) return;
        settingsCanvas.gameObject.SetActive(true);
        settings.transform.DOPunchScale(new Vector3(0.2f, 0.2f, 1), 1f, 4, 1);

        CheckSettings();
    }

    public void ShowLeaderboards()
    {
        if (!SplashScreen.isFinished) return;
        settingsCanvas.gameObject.SetActive(true);
        leaderboards.transform.DOPunchScale(new Vector3(0.2f, 0.2f, 1), 1f, 4, 1);
    }

    public void HideSettings()
    {
        settingsCanvas.gameObject.SetActive(false);
    }

    public void ToggleSound(bool isOn)
    {
        if (isSound && !isOn)
        {
            isSound = false;
            On.GetComponent<Text>().color = unselected;
            Off.transform.DOScale(0.8f, 0.1f).SetEase(Ease.Linear).SetLoops(2, LoopType.Yoyo);
            Off.GetComponent<Text>().color = Color.white;
            AudioListener.volume = 0;
        }else if(!isSound && isOn)
        {
            isSound = true;
            On.GetComponent<Text>().color = Color.white;
            On.transform.DOScale(0.8f, 0.1f).SetEase(Ease.Linear).SetLoops(2, LoopType.Yoyo);
            Off.GetComponent<Text>().color = unselected;
            AudioListener.volume = 1;
        }
    }

    public void ToggleQuality(bool isGood)
    {
        if (isNormal && !isGood)
        {
            isNormal = false;
            Normal.GetComponent<Text>().color = unselected;
            High.transform.DOScale(0.8f, 0.1f).SetEase(Ease.Linear).SetLoops(2, LoopType.Yoyo);
            High.GetComponent<Text>().color = Color.white;
            QualitySettings.SetQualityLevel(5);
        }
        else if (!isNormal && isGood)
        {
            isNormal = true;
            Normal.GetComponent<Text>().color = Color.white;
            Normal.transform.DOScale(0.8f, 0.1f).SetEase(Ease.Linear).SetLoops(2, LoopType.Yoyo);
            High.GetComponent<Text>().color = unselected;
            QualitySettings.SetQualityLevel(2);
        }
    }

    public void ToggleHand(bool isRightHanded)
    {
        if (isRight && !isRightHanded)
        {
            isRight = false;
            Right.GetComponent<Text>().color = unselected;
            Left.transform.DOScale(0.8f, 0.1f).SetEase(Ease.Linear).SetLoops(2, LoopType.Yoyo);
            Left.GetComponent<Text>().color = Color.white;
        }
        else if (!isRight && isRightHanded)
        {
            isRight = true;
            Right.GetComponent<Text>().color = Color.white;
            Right.transform.DOScale(0.8f, 0.1f).SetEase(Ease.Linear).SetLoops(2, LoopType.Yoyo);
            Left.GetComponent<Text>().color = unselected;
        }

    }

    public void ToggleEA()
    {
        earlyAccess.SetActive(false);
        gm.firstTime = false;
    }

    public void ResetSave()
    {
        gm.ResetSave();
        gm.ResetSettings();
        Reset.transform.DOScale(0.8f, 0.1f).SetEase(Ease.Linear).SetLoops(2, LoopType.Yoyo);
        SceneManager.LoadScene(0);
    }

    // Visual Feedbacks
    void TitleFeedback()
    {
        title.transform.DORotate(new Vector3(0, 0, -2f), 1.5f).SetEase(Ease.Linear).SetLoops(-1, LoopType.Yoyo);
    }

    void StartFeedback()
    {
        startText.transform.DOScale(0.4f, 0.2f).SetEase(Ease.Linear).SetLoops(-1,LoopType.Yoyo);
    }

    void LeaveUp()
    {
        title.transform.DOMoveY(Screen.height + 150, 1f).SetEase(Ease.InBack);
    }

    void LeaveDown()
    {
        startText.transform.DOMoveY(0 - 150, 1f).SetEase(Ease.InBack);
    }

}
