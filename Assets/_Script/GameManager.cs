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

    public bool loaded;
    public bool gamestarted;
    public bool hasGameLaunched;
    public float chunkSize;
    public int score;
    public bool isRight;

    //Data to save
    public int highScore;
    public int playerXP;
    public int playerLvl;
    public float TimeBeforeRespawn;
    public float TimeForEffect;
    public ParticleSystem PlayerDestruction;
    public GameObject PlayerVisual;



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

        isRight = true;

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
        CameraPos(isRight);

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
        uiManager.playerInterface.GetComponent<RectTransform>().DOAnchorPosX(0.75f, 0.5f).SetEase(Ease.OutBack);
    }

    public void CameraPos(bool right)
    {
        
        //For a right-handed player: UI is on the left
        if (right)
        {
            Camera.main.transform.DOMoveX(-Camera.main.orthographicSize * 0.035f, 2f);
            uiManager.Score.transform.localPosition = new Vector3(chunkSize, uiManager.Score.transform.localPosition.y, 0);
            uiManager.leftRight.transform.localScale = new Vector3(1, 1, 1);
            isRight = true;
        }
        else
        {
            Camera.main.transform.DOMoveX(Camera.main.orthographicSize * 0.035f, 2f);
            uiManager.Score.transform.localPosition = new Vector3(-chunkSize, uiManager.Score.transform.localPosition.y, 0);
            uiManager.leftRight.transform.localScale = new Vector3(-1, 1, 1);
            uiManager.ammoCount.transform.DOScaleX(-uiManager.ammoCount.transform.localScale.x,0.1f);
            isRight = false;
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
        StartCoroutine(DestroyedCoroutine());
        StartCoroutine(DeathEffect());

        if (score > highScore)
            highScore = score;
        score = 0;
        PlayerDestruction.Play();



    }

    IEnumerator DestroyedCoroutine()
    {
        yield return new WaitForSeconds(TimeBeforeRespawn);
        SceneManager.LoadScene(0);
    }

    IEnumerator DeathEffect()
    {
        float _Value = 0;
        float _CurrentTime = 0;
        while(_CurrentTime <= TimeForEffect)
        {
            _Value = Mathf.Lerp(0, 1, _CurrentTime);
            PlayerVisual.GetComponent<SpriteRenderer>().material.SetFloat("_Destroy", _Value);
            _CurrentTime += Time.deltaTime;
            yield return new WaitForEndOfFrame();
        }

        yield break;

    }



    public void SetSave()
    {
        PlayerPrefs.SetInt("Highscore", highScore);
        PlayerPrefs.SetInt("Experience", playerXP);
        PlayerPrefs.SetInt("PlayerLevel", playerLvl);
        PlayerPrefs.Save();
    }

    public void GetSave()
    {
        highScore = PlayerPrefs.GetInt("Highscore");
    }

    public void ResetSave()
    {
        PlayerPrefs.DeleteKey("Highscore");
        PlayerPrefs.DeleteKey("Experience");
        PlayerPrefs.DeleteKey("PlayerLevel");
    }

    public void OnApplicationQuit()
    {
       SetSave();
    }
}
