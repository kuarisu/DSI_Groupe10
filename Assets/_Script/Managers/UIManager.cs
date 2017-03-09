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
    public List<Sprite> playerSkins = new List<Sprite>();
    public List<Sprite> unlockedSkins = new List<Sprite>();
    public GameObject shipName;

    [Header("SETTINGS")]
    public Canvas settingsCanvas;
    public GameObject On;
    public GameObject Off;
    public GameObject Right;
    public GameObject Left;
    public GameObject Yes;
    public GameObject No;
    public GameObject Reset;
    public GameObject ResetConfirmation;
    public GameObject Credits;
    public Color unselected;

    /////////////////////////////////////////////////////////////////////////////////////////////
    [Header("LEADBOARD")]
    public Canvas leadboardCanvas;
    public Canvas YournameCanvas;

    [Header("ACHIEVEMENT")]
    public Canvas achievementCanvas;
    public Image achievement_1;
    [HideInInspector]
    public string achievement_1_achieved;
    /////////////////////////////////////////////////////////////////////////////////////////////

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
    public Image cursor;

    [Header("SKINKS")]
    public GameObject SkinSelector;
    public GameObject Middle;
    public GameObject SkinPlus1;
    public GameObject SkinMoins1;
    public float swipeLength;
    public int chosenSkin;

    [HideInInspector]
    public bool isSound;
    public bool isNormal;
    public bool isRight;
    public bool isRate;
    public bool factorySettings;
    public int scoreToDraw;
    public int actualSkin;
    public bool isOnStartButton;
    public float UIlocalScore;
    public float direction;

    GameManager gm;
    bool menuIsHidden;
    bool clikedButton;
    Text highScoreText;
    bool scoreUpdated;
    float timePassed;
    bool isSwiping;
    Vector2 firstPressPos;
    Vector2 secondPressPos;
    Vector2 currentSwipe;
    Text shipNameText;

    // Use all of these for initialization
    void Awake () {

        gm = GameManager.instance;
        highScoreText = highscore.GetComponent<Text>();
        shipNameText = shipName.GetComponent<Text>();
        achievements.SetActive(true);
        leaderboards.SetActive(true);

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
        ChangeSkins();
        SetShipName();
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
        else if (!isSound)
        {
            On.GetComponent<Text>().color = unselected;
            Off.GetComponent<Text>().color = Color.white;
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

    public void SetExperience()
    {
        playerExp.value = gm.playerXP;
        playerLvl.text = gm.playerLvl.ToString();
        if (gm.playerLvl < gm.toNextLevel.Count)
            toNextLvl.text = "" + gm.playerXP + "/" + gm.toNextLevel[gm.playerLvl];
        else
            toNextLvl.text = "LEVEL MAX";
    }

    //Update
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
        
        CheckAchievement();   // Check if player has achieve an achievement
    }

    //In game
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
        if (SplashScreen.isFinished)
        {
            if (gm.player.spriteRender.sprite.name.Contains("Locked"))
                gm.player.spriteRender.sprite = playerSkins[chosenSkin];

            //Hide menu
            start.SetActive(false);
            achievements.SetActive(false);
            settings.SetActive(false);
            leaderboards.SetActive(false);
            quit.SetActive(false);
            playerExp.gameObject.SetActive(false);
            playerLvl.gameObject.SetActive(false);
            SkinSelector.SetActive(false);
            shipName.SetActive(false);
            PlayerPrefs.SetInt("ActualSkin", actualSkin);
            gm.SetSave();

            gm.player.GetComponent<SpriteRenderer>().enabled = true;

            //Highscore Feedback
            highscore.transform.DOScale(3, 1f);
            highScoreText.DOFade(0, 1f);

            gm.LaunchGame();
        }
    }

    public void SetHighScore()
    {
        highScoreText.text = "" + gm.highScore;
    }

    //Controls
    public void SwipeTouch()
    {
        if (Input.touches.Length > 0)
        {
            Touch t = Input.GetTouch(0);
            if (t.phase == TouchPhase.Began)
                firstPressPos = new Vector2(t.position.x, t.position.y);

            if (t.phase == TouchPhase.Ended)
            {
                secondPressPos = new Vector2(t.position.x, t.position.y);
                currentSwipe = new Vector2(secondPressPos.x - firstPressPos.x, secondPressPos.y - firstPressPos.y);
                currentSwipe.Normalize();
                if (currentSwipe.x < -swipeLength)
                {
                    if (actualSkin != playerSkins.Count - 1)
                        actualSkin++;
                    else
                        actualSkin = 0;
                    ChangeSkins();
                }
                else if (currentSwipe.x > swipeLength)
                {
                    if (actualSkin != 0)
                        actualSkin--;
                    else
                        actualSkin = playerSkins.Count - 1;

                    ChangeSkins();
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
            firstPressPos = new Vector2(Input.mousePosition.x, Input.mousePosition.y);

        if (Input.GetMouseButtonUp(0))
        {
            secondPressPos = new Vector2(Input.mousePosition.x, Input.mousePosition.y);
            currentSwipe = new Vector2(secondPressPos.x - firstPressPos.x, secondPressPos.y - firstPressPos.y);
            currentSwipe.Normalize();

            if (currentSwipe.x < -swipeLength)
            {
                if (actualSkin != playerSkins.Count - 1)
                    actualSkin++;
                else
                    actualSkin = 0;

                ChangeSkins();
                direction = -50;
                ShipName();
            }
            else if (currentSwipe.x > swipeLength)
            {
                if (actualSkin != 0)
                    actualSkin--;
                else
                    actualSkin = playerSkins.Count - 1;

                ChangeSkins();
                direction = 50;
                ShipName();
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

    public void ChangeSkins()
    {
        Middle.GetComponent<SpriteRenderer>().sprite = playerSkins[actualSkin];
        cursor.sprite = playerSkins[actualSkin];

        if (actualSkin != playerSkins.Count - 1)
            SkinPlus1.GetComponent<SpriteRenderer>().sprite = playerSkins[actualSkin + 1];
        else
            SkinPlus1.GetComponent<SpriteRenderer>().sprite = playerSkins[0];

        if (actualSkin != 0)
            SkinMoins1.GetComponent<SpriteRenderer>().sprite = playerSkins[actualSkin - 1];
        else
            SkinMoins1.GetComponent<SpriteRenderer>().sprite = playerSkins[playerSkins.Count - 1];

        gm.player.spriteRender.sprite = playerSkins[actualSkin];

        if (!playerSkins[actualSkin].name.Contains("Locked"))
            chosenSkin = actualSkin;

    }

    public void CheckStrtButton(bool start)
    {
        isOnStartButton = start;
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

    void SetShipName()
    {
        shipNameText.text = playerSkins[actualSkin].name.ToUpper(); //Replace("_Locked"," [Locked]").Trim().ToUpper();
        if (shipNameText.text.Contains("_LOCKED"))
        {
            shipNameText.text = "[LOCKED]";
            shipNameText.color = Color.grey;
        }
        else
        {
            shipNameText.color = Color.white;
        }
    }

    void ShipName()
    {
        shipName.transform.DOLocalMoveX(direction, 0.1f).OnComplete(ShipName_Next);
        shipNameText.DOFade(0, 0.1f);
    }

    public void ShipName_Next()
    {
        SetShipName();
        shipName.transform.localPosition = new Vector2(-direction, shipName.transform.localPosition.y);
        shipName.transform.DOLocalMoveX(0, 0.1f);
        shipNameText.DOFade(1, 0.1f);
    }

    //Button Scripts
    public void ShowSettings()
    {
        isOnStartButton = false;
        if (!SplashScreen.isFinished) return;
        settingsCanvas.gameObject.SetActive(true);
        settings.transform.DOPunchScale(new Vector3(0.2f, 0.2f, 1), 1f, 4, 1);

        CheckSettings();
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    public void ShowAchievements()
    {
        if (!SplashScreen.isFinished) return;
        achievementCanvas.gameObject.SetActive(true);
    }


    public void ShowLeaderboards()
    {
        if (!SplashScreen.isFinished) return;
        leadboardCanvas.gameObject.SetActive(true);

        achievement_1_achieved = "true";  // for test, should be change*****************
    }


    public void CheckAchievement()           //should be used in Update() after game start.
    {
        if (achievement_1_achieved == "true")    //condition 1 to meet
        {
            achievement_1.color = Color.green;   // just for test**************************
        }
        /*
        if (true) //condition 2 to meet
        {
            Social.ReportProgress(ApeyronOnlineID.achievement_test_2, 100.0f, (bool success) => {
                // handle success or failure
            });
           
        }
        if (true) //condition 3 to meet
        {
            Social.ReportProgress(ApeyronOnlineID.achievement_test_3, 100.0f, (bool success) => {
                // handle success or failure
            });
        }
        */
    }

    public void HideAchievement()
    {
        achievementCanvas.gameObject.SetActive(false);
    }

    public void HideLeadboard()
    {
        leadboardCanvas.gameObject.SetActive(false);
    }
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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
        }
        else if (!isSound && isOn)
        {
            isSound = true;
            On.GetComponent<Text>().color = Color.white;
            On.transform.DOScale(0.8f, 0.1f).SetEase(Ease.Linear).SetLoops(2, LoopType.Yoyo);
            Off.GetComponent<Text>().color = unselected;
            AudioListener.volume = 1;
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

    public void ToggleCredits(bool toggle)
    {
        Credits.SetActive(toggle);
    }

    public void ShowConfirmation()
    {
        ResetConfirmation.SetActive(true);
    }

    public void ToggleEA()
    {
        isOnStartButton = false;
        earlyAccess.SetActive(false);
        gm.firstTime = false;
    }

    public void ResetSave(bool yesno)
    {
        if (yesno)
        {
            gm.ResetSave();
            gm.ResetSettings();
            Reset.transform.DOScale(0.8f, 0.1f).SetEase(Ease.Linear).SetLoops(2, LoopType.Yoyo);
            SceneManager.LoadScene(0);
        }
        else
        {
            ResetConfirmation.SetActive(false);
        }
    }

    public void QuitGame()
    {
        gm.SetSave();
        Application.Quit();
    }

}
