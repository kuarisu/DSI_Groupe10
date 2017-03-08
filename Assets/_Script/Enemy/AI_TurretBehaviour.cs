using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AI_TurretBehaviour : MonoBehaviour {

	public bool targetPlayer = true ;
	public GameObject targetedPlayer;

	public bool launchMissile ;

	public float cadence;
	float timer = 0f ;
	public float minimumActivationLength;
	public float speedMissile;

	public GameObject prefabAIMissile;




	// Use this for initialization
	void Start () {
		targetedPlayer =GameManager.instance.PlayerVisual;
	}
	
	// Update is called once per frame
	void Update () {
		
		if ( targetedPlayer != null && this.transform.transform.position.y < targetedPlayer.transform.position.y && Vector3.Distance (transform.position, targetedPlayer.transform.position) < minimumActivationLength)
        {
            if (targetPlayer == true)
            {
                Vector2 direction = targetedPlayer.transform.position - transform.position;
                float rot_z = Mathf.Atan2(direction.y, direction.x) * Mathf.Rad2Deg;
                transform.rotation = Quaternion.Euler(0f, 0f, rot_z - 90f);
            }

			timer += Time.deltaTime;

			if(launchMissile == true)
            {
				if (timer > cadence)
                {
					timer = 0;
					GameObject clone;
                    GetComponent<AudioSource>().Play();
					clone = Instantiate (prefabAIMissile, transform.position, Quaternion.identity) as GameObject;
					Vector2 direction = targetedPlayer.transform.position - transform.position;
					float rot_z = Mathf.Atan2 (direction.y, direction.x) * Mathf.Rad2Deg;
					clone.transform.rotation = Quaternion.Euler (0f, 0f, rot_z - 90f);
                    clone.transform.parent = this.gameObject.transform.root.transform;
					clone.GetComponent<AI_MissileComponent> ().speedAIMissile = speedMissile;
				}
			}

		}
	}
}
