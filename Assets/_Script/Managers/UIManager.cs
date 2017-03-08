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
    public GameObject quit;
    public GameObject leaderboards;
    public GameObject start;
    public GameObject highscore;
    public GameObject play;
    public GameObject earlyAccess;
    public Text playerLvl;
    public Slider playerExp;
    public Text toNextLvl;
    public List<Sprite> playerSkinks = new List<Sprite>();

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
    public Image ammoCount;
    public Material M_ammoCount;
    public GameObject leftRight;
    public Slider slider;
    public Gradient grd;

    [Header("SKINKS")]
    public GameObject SkinSelector;
    public GameObject Middle;
    public GameObject SkinPlus1;
    public GameObject SkinPlus2;
    public GameObject SkinMoins1;
    public GameObject SkinMoins2;

    [HideInInspector]
    public bool isSound;
    public bool isNormal;
    public bool isRight;
    public bool isRate;
    public bool factorySettings;
    public int scoreToDraw;
    public int actualSkin;
    public bool isOnStartButton;

    GameManager gm;
    bool menuIsHidden;
    bool clikedButton;
    Text highScoreText;
    bool scoreUpdated;
    float timePassed;
    bool isSwiping;

    // Use this for initialization
    void Awake () {

        gm = GameManager.instance;
        highScoreText = highscore.GetComponent<Text>();

        M_ammoCount = ammoCount.material;
        menuIsHidden = false;
        isSwiping = false;
        isOnStartButton = false;

        InitSettings();
        SetHighScore();
        TitleFeedback();
        StartFeedback();
  
        if (gm.firstTime == false)
            earlyAccess.SetActive(false);

        InitUI();
    }

    public void InitUI()
    {
        slider = playerProgress.GetComponent<Slider>();
        slider.value = 0;
        M_ammoCount.SetFloat("_AmmoCurrent", gm.player.currentBullet);
        slider.maxValue = ((gm.levelManager.currentMaxChunk) * 46f) + 23;
        SetExperience();
        SetSkins();
    }

    // Update is called once per frame
    void Update()
    {
        if (gm.gamestarted == false)
        {
#if UNITY_EDITOR || UNITY_STANDALONE
            SwipeMouse();
#endif

#if UNITY_ANDROID
            SwipeTouch();
#endif
        }

        if (gm.gamestarted && !menuIsHidden)
        {
            LeaveUp();
            LeaveDown();
            menuIsHidden = true;
        }

        if (gm.hasGameLaunched && gm.isPlayerDead == false)
        {
            ScoreUpdate();
            SliderUpdate();
        }
    }

    public float UIlocalScore;

    public void ScoreUpdate()
    {
        UIlocalScore += Time.deltaTime * gm.scorePerSecond;
        gm.distanceScore = (int)UIlocalScore;
        gm.totalScore = gm.distanceScore + gm.enemyScore + gm.bonusScore; 
        score.text = gm.totalScore.ToString();
    }

    public void SliderUpdate()
    {
        if (gm.player.isInChunkPoint == false)
            slider.value += (gm.levelManager.scrollSpeed + gm.levelManager.speedModifier * gm.levelManager.scrollSpeedRange / 100f) * Time.deltaTime;
        else
            slider.value -= (gm.levelManager.scrollSpeed + gm.levelManager.speedModifier * gm.levelManager.scrollSpeedRange / 100f) * Time.deltaTime;
    }

    public void SetExperience()
    {
        playerExp.value = gm.playerXP;
        playerLvl.text = gm.playerLvl.ToString();
        if (gm.playerLvl < gm.toNextLevel.Count)
            toNextLvl.text = "" + gm.playerXP + "/" + gm.toNextLevel[gm.playerLvl];
        else
            toNextLvl.text = "LEVEL MAX";
    }

    public void SetSlider()
    {
        if (gm.player.isInChunkPoint == false)
        {
            if (gm.player.passedFirstChunkpoint == false)
                slider.maxValue = ((gm.levelManager.currentMaxChunk) * 46f) + 23;
            else
                slider.maxValue = ((gm.levelManager.currentMaxChunk) * 46f) + (23 - (gm.player.targetPosition.y * 2));
        }
    }

    public void GameStart()
    {
        if (!SplashScreen.isFinished) return;

        //Hide menu
        start.SetActive(false);
        achievements.SetActive(false);
        settings.SetActive(false);
        leaderboards.SetActive(false);
        quit.SetActive(false);
        playerExp.gameObject.SetActive(false);
        playerLvl.gameObject.SetActive(false);
        SkinSelector.SetActive(false);
        DOTween.Kill("MoveToRight");
        DOTween.Kill("MoveToLeft");
        PlayerPrefs.SetInt("actualSkin", actualSkin);
        gm.SetSave();

        gm.player.GetComponent<SpriteRenderer>().enabled = true;

        //Highscore Feedback
        highscore.transform.DOScale(3, 1f);
        highScoreText.DOFade(0, 1f);

        gm.LaunchGame();
    }

    public void InitSettings()
    {
        if (gm.firstTime == false)
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
        isOnStartButton = false;
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
        isOnStartButton = false;
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
        isOnStartButton = false;
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

    public void QuitGame()
    {
        gm.SetSave();
        Application.Quit();
    }

    // Visual Feedbacks
    void TitleFeedback()
    {
        title.transform.DORotate(new Vector3(0, 0, -2f), 1.5f).SetEase(Ease.InOutQuad).SetLoops(-1, LoopType.Yoyo);
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

    Vector2 firstPressPos;
    Vector2 secondPressPos;
    Vector2 currentSwipe;
    public float swipeLength;

    public void SwipeTouch()
    {
        if (Input.touches.Length > 0)
        {
            Touch t = Input.GetTouch(0);
            if (t.phase == TouchPhase.Began)
            {
                //save began touch 2d point
                firstPressPos = new Vector2(t.position.x, t.position.y);
            }
            if (t.phase == TouchPhase.Ended)
            {
                //save ended touch 2d point
                secondPressPos = new Vector2(Input.mousePosition.x, Input.mousePosition.y);

                //create vector from the two points
                currentSwipe = new Vector2(secondPressPos.x - firstPressPos.x, secondPressPos.y - firstPressPos.y);

                //normalize the 2d vector
                currentSwipe.Normalize();

                Debug.Log(currentSwipe.x);

                //swipe left
                if (currentSwipe.x < -swipeLength)
                {
                    if (actualSkin != playerSkinks.Count-1)
                        actualSkin++;
                    else
                        actualSkin = 0;

                    Middle.GetComponent<SpriteRenderer>().sprite = playerSkinks[actualSkin];

                    if (actualSkin != playerSkinks.Count - 1)
                        SkinPlus1.GetComponent<SpriteRenderer>().sprite = playerSkinks[actualSkin + 1];
                    else
                        SkinPlus1.GetComponent<SpriteRenderer>().sprite = playerSkinks[0];

                    if (actualSkin != 0)
                        SkinMoins1.GetComponent<SpriteRenderer>().sprite = playerSkinks[actualSkin - 1];
                    else
                        SkinMoins1.GetComponent<SpriteRenderer>().sprite = playerSkinks[playerSkinks.Count - 1];

                    gm.player.GetComponent<SpriteRenderer>().sprite = playerSkinks[actualSkin];

                    /*gm.player.transform.DOMoveX(-0.5f, 0.5f).SetEase(Ease.InOutBack).SetLoops(2, LoopType.Yoyo);
                    Middle.transform.DOMoveX(-0.5f, 0.5f).SetEase(Ease.InOutBack).SetLoops(2, LoopType.Yoyo);
                    SkinPlus1.transform.DOMoveX(4f, 0.5f).SetEase(Ease.InOutBack).SetLoops(2, LoopType.Yoyo);
                    SkinMoins1.transform.DOMoveX(-5f, 0.5f).SetEase(Ease.InOutBack).SetLoops(2, LoopType.Yoyo);*/
                }
                else if (currentSwipe.x > swipeLength)
                {
                    if (actualSkin != 0)
                        actualSkin--;
                    else
                        actualSkin = playerSkinks.Count - 1;

                    Middle.GetComponent<SpriteRenderer>().sprite = playerSkinks[actualSkin];

                    if (actualSkin != playerSkinks.Count - 1)
                        SkinPlus1.GetComponent<SpriteRenderer>().sprite = playerSkinks[actualSkin + 1];
                    else
                        SkinPlus1.GetComponent<SpriteRenderer>().sprite = playerSkinks[0];

                    if (actualSkin != 0)
                        SkinMoins1.GetComponent<SpriteRenderer>().sprite = playerSkinks[actualSkin - 1];
                    else
                        SkinMoins1.GetComponent<SpriteRenderer>().sprite = playerSkinks[playerSkinks.Count - 1];

                    gm.player.GetComponent<SpriteRenderer>().sprite = playerSkinks[actualSkin];

                    /*gm.player.transform.DOMoveX(0.5f, 0.5f).SetEase(Ease.InOutBack).SetLoops(2, LoopType.Yoyo);
                    Middle.transform.DOMoveX(0.5f, 0.5f).SetEase(Ease.InOutBack).SetLoops(2, LoopType.Yoyo);
                    SkinPlus1.transform.DOMoveX(5f, 0.5f).SetEase(Ease.InOutBack).SetLoops(2, LoopType.Yoyo);
                    SkinMoins1.transform.DOMoveX(-4f, 0.5f).SetEase(Ease.InOutBack).SetLoops(2, LoopType.Yoyo);*/

                }
                else
                {
                    if (isOnStartButton)
                        GameStart();
                }

                firstPressPos = Vector2.zero;
                secondPressPos = Vector2.zero;
            }
        }
    }

    public void SwipeMouse()
    {
        if (Input.GetMouseButtonDown(0))
        {
            //save began touch 2d point
            firstPressPos = new Vector2(Input.mousePosition.x, Input.mousePosition.y);
        }

        if (Input.GetMouseButtonUp(0))
        {
            //save ended touch 2d point
            secondPressPos = new Vector2(Input.mousePosition.x, Input.mousePosition.y);

            //create vector from the two points
            currentSwipe = new Vector2(secondPressPos.x - firstPressPos.x, secondPressPos.y - firstPressPos.y);

            //normalize the 2d vector
            currentSwipe.Normalize();

           // Debug.Log(currentSwipe.x);

            //swipe left
            if (currentSwipe.x < -swipeLength)
            {
                if (actualSkin != playerSkinks.Count - 1)
                    actualSkin++;
                else
                    actualSkin = 0;

                Middle.GetComponent<SpriteRenderer>().sprite = playerSkinks[actualSkin];

                if(actualSkin != playerSkinks.Count - 1)
                    SkinPlus1.GetComponent<SpriteRenderer>().sprite = playerSkinks[actualSkin+1];
                else
                    SkinPlus1.GetComponent<SpriteRenderer>().sprite = playerSkinks[0];

                if(actualSkin != 0)
                    SkinMoins1.GetComponent<SpriteRenderer>().sprite = playerSkinks[actualSkin - 1];
                else
                    SkinMoins1.GetComponent<SpriteRenderer>().sprite = playerSkinks[playerSkinks.Count - 1];

                gm.player.GetComponent<SpriteRenderer>().sprite = playerSkinks[actualSkin];

                /*gm.player.transform.DOMoveX(-0.5f, 0.5f).SetEase(Ease.InOutBack).SetLoops(2, LoopType.Yoyo);
                Middle.transform.DOMoveX(-0.5f, 0.5f).SetEase(Ease.InOutBack).SetLoops(2, LoopType.Yoyo);
                SkinPlus1.transform.DOMoveX(4f, 0.5f).SetEase(Ease.InOutBack).SetLoops(2, LoopType.Yoyo);
                SkinMoins1.transform.DOMoveX(-5f, 0.5f).SetEase(Ease.InOutBack).SetLoops(2, LoopType.Yoyo);*/
            }
            else if (currentSwipe.x > swipeLength)
            {
                if (actualSkin != 0)
                    actualSkin--;
                else
                    actualSkin = playerSkinks.Count - 1;

                Middle.GetComponent<SpriteRenderer>().sprite = playerSkinks[actualSkin];

                if (actualSkin != playerSkinks.Count - 1)
                    SkinPlus1.GetComponent<SpriteRenderer>().sprite = playerSkinks[actualSkin + 1];
                else
                    SkinPlus1.GetComponent<SpriteRenderer>().sprite = playerSkinks[0];

                if (actualSkin != 0)
                    SkinMoins1.GetComponent<SpriteRenderer>().sprite = playerSkinks[actualSkin - 1];
                else
                    SkinMoins1.GetComponent<SpriteRenderer>().sprite = playerSkinks[playerSkinks.Count - 1];

                gm.player.GetComponent<SpriteRenderer>().sprite = playerSkinks[actualSkin];

                /*gm.player.transform.DOMoveX(0.5f, 0.5f).SetEase(Ease.InOutBack).SetLoops(2, LoopType.Yoyo);
                Middle.transform.DOMoveX(0.5f, 0.5f).SetEase(Ease.InOutBack).SetLoops(2, LoopType.Yoyo);
                SkinPlus1.transform.DOMoveX(5f, 0.5f).SetEase(Ease.InOutBack).SetLoops(2, LoopType.Yoyo);
                SkinMoins1.transform.DOMoveX(-4f, 0.5f).SetEase(Ease.InOutBack).SetLoops(2, LoopType.Yoyo);*/
            }
            else{
                if(isOnStartButton)
                    GameStart();
            }

            firstPressPos = Vector2.zero;
            secondPressPos = Vector2.zero;
        }
    }

    public void SetSkins()
    {

    }

    public void CheckStrtButton()
    {
        isOnStartButton = true;
    }

}
