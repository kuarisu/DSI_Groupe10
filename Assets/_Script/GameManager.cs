using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameManager : MonoBehaviour {

    public static GameManager instance;
    public bool loaded;
    public bool gamestarted;

    void Awake()
    {
        if (instance == null)
        {
            DontDestroyOnLoad(gameObject);
            instance = this;
        }
        else {
            instance.loaded = true;
            Destroy(gameObject);
        }
        gamestarted = false;
        Screen.orientation = ScreenOrientation.Portrait;
    }

    // Update is called once per frame
    void Update () {
		
	}
}
