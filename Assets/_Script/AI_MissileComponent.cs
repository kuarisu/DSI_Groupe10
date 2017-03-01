using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AI_MissileComponent : MonoBehaviour {

	public float speedAIMissile;

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		transform.Translate (transform.up * speedAIMissile, Space.World);
		//transform.position = new Vector3 (transform.position.x, transform.position.y, 0.0f);
	}

	void OnCollisionEnter2D (Collision2D other){
		if (other.gameObject.name == "Player"){
			Debug.Log ("cc");
			Destroy (this.gameObject);
		}

		Debug.Log ("slt");
	}
}
