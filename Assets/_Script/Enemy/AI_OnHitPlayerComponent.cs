﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AI_OnHitPlayerComponent : MonoBehaviour {

	public bool killThePlayer;
	public bool stealAmmo;
	public float numberAmmoSteal;

	public bool destroyThisAfterImpact;



	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}

	void OnCollisionEnter2D (Collision2D other){
		if (other.gameObject.name == "Player"){
			if (killThePlayer == true){
				Destroy (other.gameObject);

				//If we need to instantiate something after Death, do it here
			}

			if (stealAmmo == true){
				Debug.Log ("Link the float in gestion of the number of bullet inside the PlayerControlleur");
				Debug.Log("Here the component steal :  " + numberAmmoSteal + " bullets");
				//other.gameObject.GetComponent<PlayerController> ().numberBullet = numberBullet - numberAmmoSteal;
			}

			if (destroyThisAfterImpact == true){
				Destroy (gameObject);
			}
		}
	}
}
