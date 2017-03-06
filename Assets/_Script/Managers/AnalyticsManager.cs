using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AnalyticsManager : MonoBehaviour
{


    public float runDuration;
    public float totalScore;
    public float highscore;
    public int enemyKilled;


    public static AnalyticsManager instance;
    Dictionary<string, object> DeathDictionary = new Dictionary<string, object>();

    private void Awake()
    {
        if (instance == null)
        {
            instance = this;
        }
        else
        {
            Destroy(gameObject);
        }
    }


    void Update()
    {
        runDuration += Time.deltaTime; 
    }

    public void DeathAnalyticsRegistration()
    {
       // DeathDictionary.Add("score", (int)uiManager.UIlocalScore);
        Amplitude.Instance.logEvent("Death", DeathDictionary);
    }
}