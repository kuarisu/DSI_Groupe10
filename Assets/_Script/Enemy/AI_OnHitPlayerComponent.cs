using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class AI_OnHitPlayerComponent : MonoBehaviour {

    public GameManager gm;
    public GameObject explosion;

    public bool killThePlayer;
	public bool stealAmmo;
	public float numberAmmoSteal;

	public bool destroyThisAfterImpact;



	// Use this for initialization
	void Start () {
        gm = GameManager.instance;
	}
	
	// Update is called once per frame
	void Update () {
		
	}

	void OnCollisionEnter2D (Collision2D other){
		if (other.gameObject.name == "Player"){
			if (killThePlayer == true){
                gm.enemyKiller = gameObject;
                gm.enemyKiller_ID = GetComponent<ElementID>().e_ID;
                //Call Amplitude event function

                gm.PlayerDeath();

                //If we need to instantiate something after Death, do it here
            }

            if(gameObject.tag == "bonuses")
            {
                GameObject expClone = Instantiate(explosion, transform.position, transform.rotation);
                expClone.transform.SetParent(transform.root);

                GameObject scoreFdbk = Instantiate(gm.levelManager.scoreFeedback, Camera.main.WorldToScreenPoint(transform.position), gm.uiManager.playerUI.transform.rotation);
                scoreFdbk.GetComponent<Text>().text = "+" + 100;
                scoreFdbk.transform.SetParent(gm.uiManager.playerUI.transform);
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
