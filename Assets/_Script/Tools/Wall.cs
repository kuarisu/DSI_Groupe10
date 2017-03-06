using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Wall : MonoBehaviour {

    public List<Sprite> wallSprites = new List<Sprite>();
    public bool left;
    public bool right;

	// Use this for initialization
	void Start () {
        if (left)
            GetComponent<SpriteRenderer>().sprite = wallSprites[0];
        if(right)
            GetComponent<SpriteRenderer>().sprite = wallSprites[1];
    }
	
	// Update is called once per frame
	void Update () {
		
	}
}
