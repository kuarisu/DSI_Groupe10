using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;


public class LeaderboardManager : MonoBehaviour {

    const string privateCode = "YmwJgAK8o0iNFGL0Z9Rs5wGLYzGVkZzUiG4IRhKCvkvQ";
    const string publicCode = "58bd433868fc0c0c4c8b25d8";
    const string webURL = "http://dreamlo.com/lb/";

    public static LeaderboardManager leaderboardInstance;
    public Text[] highscoreText;            // Now it has fixed to a array of 10 elements.
    public Text playerName;
    public Highscore[] highscoresList;

    [HideInInspector]
    public bool stillTyping;   //detect if player is typing his/her name
    //GameManager gm;

    void Awake()
    {
        if (leaderboardInstance == null)
        {
            leaderboardInstance = this;
        }
        //gm = GameManager.instance;

        /*
        string[] name = { "Yue", "Batman", "Superman", "Spiderman", "Arrow", "Ironman", "Atom", "Holmes", "Micky", "What'sUpMan", "Thanksman" };
        for(int i = 0; i < name.Length; i++)
        {
            AddNewHighscore(name[i], 100 - i);
        }
        */
        StartCoroutine(RefreshHighscores());
        stillTyping = false;
    }

    void Start()
    {
        for (int i = 0; i < highscoreText.Length; i++)
        {
            highscoreText[i].text = i + 1 + ". Fetching...";
        }

        //highscoreManger = GetComponent<Highscores>();
    }

    // Use this for initialization
    public static void AddNewHighscore(string username, int score)
    {
        leaderboardInstance.StartCoroutine(leaderboardInstance.UploadNewHighscore(username, score));
    }

    IEnumerator UploadNewHighscore(string username, int score)
    {
        WWW www = new WWW(webURL + privateCode + "/add/" + WWW.EscapeURL(username) + "/" + score);
        yield return www;

        if (string.IsNullOrEmpty(www.error))
        {
            print("Upload Successful");
            DownloadHighscores();                          // Download the high scores at the same time
        }
        else
        {
            print("Error uploading:" + www.error);
        }
    }

    public void DownloadHighscores()
    {
        StartCoroutine(DownloadHighscoresFromDatabase());
    }

    IEnumerator DownloadHighscoresFromDatabase()
    {
        WWW www = new WWW(webURL + publicCode + "/pipe/");
        yield return www;

        if (string.IsNullOrEmpty(www.error))
        {
            FormatHighscores(www.text);
            OnHighscoreDownloaded(highscoresList);
        }
        else
            print("Error Downloading: " + www.error);

    }

    void FormatHighscores(string textStream)
    {
        string[] entries = textStream.Split(new char[] { '\n' }, System.StringSplitOptions.RemoveEmptyEntries);
        highscoresList = new Highscore[entries.Length];

        for (int i = 0; i < entries.Length; i++)
        {
            string[] entryInfo = entries[i].Split(new char[] { '|' });
            string username = entryInfo[0];
            int score = int.Parse(entryInfo[1]);
            highscoresList[i] = new Highscore(username, score);
           // print(highscoresList[i].username + ": " + highscoresList[i].score);
        }
        
    }

    public void OnHighscoreDownloaded(Highscore[] highscoreList)                //refresh the Top x scores on the leaderboard
    {
        for (int i = 0; i < highscoreText.Length; i++)
        {
            highscoreText[i].text = i + 1 + ". ";
            if (highscoreList.Length > i)
            {
                highscoreText[i].text += highscoreList[i].username + " - " + highscoreList[i].score;
            }
        }
    }

    IEnumerator RefreshHighscores()       //every x seconds, down load high scores on the online server, in this case, 30 seconds.
    {
        while (true)
        {
            DownloadHighscores();
            yield return new WaitForSeconds(30);
        }
    }

    public void UpdateLeaderboard()
    {
        string name = playerName.text.ToString();
        int score = GameManager.instance.highScore;
        AddNewHighscore(name, score);

        stillTyping = false;
    }
}


public struct Highscore
{
    public string username;
    public int score;

    public Highscore(string _username, int _score)
    {
        username = _username;
        score = _score;
    }
}

