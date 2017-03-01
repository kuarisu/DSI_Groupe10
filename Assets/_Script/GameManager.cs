using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameManager : MonoBehaviour {

    public static GameManager instance;
    public bool loaded;
    public bool gamestarted;
    public float chunkSize;

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

        //Set camera size depending on aspect ratio
        Camera.main.orthographicSize = ((Screen.height * chunkSize) / Screen.width) / 2;
    }

    // Update is called once per frame
    void Update () {
		
	}
}
