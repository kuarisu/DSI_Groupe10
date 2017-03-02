using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AI_BonusOnHitComponent : MonoBehaviour {
	[Header("Bonus Box Information")]
	public bool destroyable;
	public int howManyHP;

	[Space(10)]
	[Header("Type of Bonus")]
	public bool moreMaxAmmo;
	public bool giveBackAmmo;
	public bool invicibilityForLimitedTime;

	[Space(10)]
	[Header("More Max Ammo Set Up")]
	public float howMAnyMoreMaxAmmo = 2;

	[Space(10)]
	[Header("Give Back Ammo Set up")]
	public float howManyGiveBackAmmo = 3;

	[Space(10)]
	[Header("Invicibility Set Up")]
	public float howManyTimeIncible = 5;


	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}

    void OnTriggerEnter2D(Collider2D other)
    {
		if (other.gameObject.name == "Player"){
			if (moreMaxAmmo == true){
				Debug.Log ("Here we can define how many max ammo the player will have after getting this bonus");
				//other.gameObject.GetComponent<PlayerController> ().numberMaxBullet = numberMaxBullet + howMAnyMoreMaxAmmo

			}

			if (giveBackAmmo == true){
				Debug.Log("Here we can define how many ammo the player will receive after getting this bonus");

				//other.gameObject.GetComponent<PlayerController> ().numberBullet = numberBullet + howManyGiveBackAmmo;

			}

			if (invicibilityForLimitedTime == true){
				Debug.Log ("Here we can set the invincibility of the player for a determined time, if we want this feature, or do another one, just an idea");

			}

		}

		if (other.gameObject.name == "Bullet"){
			if ( destroyable == true){
				howManyHP = howManyHP - 1;
				if (howManyHP == 0) {
					Destroy (gameObject);
				}
			}

		}
	}
}
