using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class UIManager : MonoBehaviour {

    public GameObject title;
    public GameObject startText;
    public GameObject achievements;
    public GameObject settings;
    public GameObject leaderboards;

    public Canvas settingsCanvas;

    GameManager gm;
    bool hasleft;

	// Use this for initialization
	void Start () {
        RotateRight();
        ScaleUp();
        gm = GameManager.instance;
        hasleft = false;
    }

    // Update is called once per frame
    void Update()
    {
        if (gm.gamestarted == true && hasleft == false)
        {
            LeaveUp();
            LeaveDown();
            GameStart();
            hasleft = true;
        }
    }

    public void ShowAchievements()
    {
        settingsCanvas.gameObject.SetActive(true);
    }

    public void ShowSettings()
    {
        settingsCanvas.gameObject.SetActive(true);
    }

    public void ShowLeaderboards()
    {
        settingsCanvas.gameObject.SetActive(true);
    }

    public void GameStart()
    {
        achievements.SetActive(false);
        settings.SetActive(false);
        leaderboards.SetActive(false);
    }

    // Visual Feedbacks
    void RotateRight()
    {
        title.transform.DORotate(new Vector3(0, 0, -1f), 2f).OnComplete(RotateLeft);
    }

    void RotateLeft()
    {
        title.transform.DORotate(new Vector3(0, 0, 1f), 2f).OnComplete(RotateRight);
    }

    void ScaleUp()
    {
        startText.transform.DOScale(0.4f, 1f).OnComplete(ScaleDown).SetEase(Ease.OutQuart);
    }

    void ScaleDown()
    {
        startText.transform.DOScale(0.5f, 1f).OnComplete(ScaleUp).SetEase(Ease.OutQuart);
    }

    void LeaveUp()
    {
        title.transform.DOMoveY(700, 1f).SetEase(Ease.InBack);
    }

    void LeaveDown()
    {
        startText.transform.DOMoveY(-100, 1f).SetEase(Ease.InBack);
    }

}
