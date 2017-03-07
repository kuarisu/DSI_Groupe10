using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AnalyticsManager : MonoBehaviour
{


    float runDuration;
    float totalScore;
    float highscore;
    int enemyKilled;

    public static AnalyticsManager instance;
    Dictionary<string, object> DeathDictionary = new Dictionary<string, object>();
    GameManager gm;

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

        gm = GameManager.instance;
    }


    void Update()
    {
        if (gm.hasGameLaunched)
            runDuration += Time.deltaTime; 
    }

    public void DeathAnalyticsRegistration()
    {
        DeathDictionary.Add("runDuration", runDuration);

        DeathDictionary.Add("totalScore", gm.totalScore);
        DeathDictionary.Add("enemyScore", gm.enemyScore);
        DeathDictionary.Add("distanceScore", gm.distanceScore);
        DeathDictionary.Add("bonusScore", gm.bonusScore);

        DeathDictionary.Add("totalChunkPassed", gm.totalChunkPassed);
        DeathDictionary.Add("enemyChunkPassed", gm.enemyChunkPassed);
        DeathDictionary.Add("bonusChunkPassed", gm.bonusChunkPassed);

        DeathDictionary.Add("killerChunk", gm.currentChunk_ID);
        DeathDictionary.Add("killerTag", gm.enemyKiller.tag);
        DeathDictionary.Add("killerID", gm.enemyKiller_ID);

        DeathDictionary.Add("remainingAmmo", gm.player.currentBullet);

        Amplitude.Instance.logEvent("Death", DeathDictionary);
    }
}