using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Bullet : MonoBehaviour {


    // Use this for initialization
    public void Awake () {
        Destroy(gameObject, 2f);
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
