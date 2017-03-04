using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BulletReturn : MonoBehaviour {

    public GameObject targetReturn;
    public int speed;

    // Use this for initialization
    void Awake () {
		
	}
	
	// Update is called once per frame
	void Update () {
        transform.LookAt(targetReturn.transform);
        transform.Translate(Vector3.forward * speed * Time.deltaTime);
	}
}
