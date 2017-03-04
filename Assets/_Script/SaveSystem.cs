using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SaveSystem : MonoBehaviour {

    public GameManager gm;

    private void Awake()
    {
        gm = GameManager.instance;
    }

    public void SetSave()
    {
        PlayerPrefs.SetInt("Highscore", gm.highScore);
        PlayerPrefs.SetInt("Experience", gm.playerXP);
        PlayerPrefs.SetInt("PlayerLevel", gm.playerLvl);
        PlayerPrefs.Save();
    }

    public void GetSave()
    {
        gm.highScore = PlayerPrefs.GetInt("Highscore");
    }

    public void ResetSave()
    {
        PlayerPrefs.DeleteKey("Highscore");
        PlayerPrefs.DeleteKey("Experience");
        PlayerPrefs.DeleteKey("PlayerLevel");
    }
}
