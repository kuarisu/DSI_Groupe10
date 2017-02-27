using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class PlayerController : MonoBehaviour {

    GameManager gm;
    Rigidbody2D rb;
    TrailRenderer trail;

    public GameObject bullet;
    GameObject bulletFired;

    // Use this for initialization
    void Awake () {
        gm = GameManager.instance;
        rb = this.GetComponent<Rigidbody2D>();
        trail = this.GetComponent<TrailRenderer>();
    }
	
	// Update is called once per frame
	void Update () {
        if (gm.gamestarted == false)
            this.transform.Rotate(Vector3.forward, 50*Time.deltaTime);

        Controls();
    }

    // Controls for the player
    void Controls()
    {
#if UNITY_EDITOR || UNITY_STANDALONE
        //Get shot's direction
        Vector2 direction = Camera.main.ScreenToWorldPoint(Input.mousePosition) - this.transform.position;
        direction.Normalize();

        if (Input.GetMouseButtonDown(0))
        {
            if (gm.gamestarted == false)
            {
                gm.gamestarted = true;
                rb.simulated = true;
                rb.velocity = Vector2.up * 5;
                rb.AddTorque(700);
            }
            else
            {
                rb.velocity = direction * -3f;
                bulletFired = (GameObject)Instantiate(bullet, transform.position, transform.rotation);

                // Rotate the bullet towards the input
                float rot_z = Mathf.Atan2(direction.y, direction.x) * Mathf.Rad2Deg;
                bulletFired.transform.rotation = Quaternion.Euler(0f, 0f, rot_z + 90);

                bulletFired.GetComponent<Rigidbody2D>().velocity = direction * 50f;
                bulletFired.GetComponent<Bullet>().Destruction();

                // Add more or less force to rotation according to the angle between Up Vector and shot's direction
                if (Vector2.Angle(Vector2.up, direction) > 170)
                {
                    rb.AddTorque(-rb.angularVelocity + 50 * -1);
                }

                else if(Vector2.Angle(Vector2.up, direction) <= 170 && Vector2.Angle(Vector2.up, direction) > 165)
                    rb.AddTorque(-rb.angularVelocity + 250 * -1);
                else if (Vector2.Angle(Vector2.up, direction) < 165)
                    rb.AddTorque(-rb.angularVelocity + 500 * -1);

                // Screen Shake
                Camera.main.transform.DOShakePosition(0.5f, 0.2f, 20, 90);
            }
        }
             
#endif

#if UNITY_ANDROID
        for (int i = 0; i < Input.touchCount; ++i)
        {
            if (Input.GetTouch(i).phase == TouchPhase.Began)
            {
                RaycastHit hit;
                if (Physics.Raycast(Camera.main.ScreenToWorldPoint(Input.GetTouch(i).position), Camera.main.transform.TransformDirection(Vector3.forward) * 10000, out hit, Mathf.Infinity, 1 << LayerMask.NameToLayer("ThrowCollider")) && hit.collider.tag == "player" && canthrow == true && objectif.packageThrown == false)
                {
                    
                }
        }
#endif
    }
}
