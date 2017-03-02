using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LookAtTarget2D : MonoBehaviour {


    private GameObject target;
    
	void Start () {
        target = GameObject.Find("Player");
    }
	
	// Update is called once per frame
	void Update () {
        LookAtTarget();
	}

    void LookAtTarget()
    {
        Vector3 diff = target.transform.position - transform.position;
        diff.Normalize();

        float rot_z = Mathf.Atan2(diff.y, diff.x) * Mathf.Rad2Deg;
        transform.rotation = Quaternion.Euler(0f, 0f, rot_z - 90);
    }

    void Helper()
    {

        Debug.DrawLine(transform.position, target.transform.position, Color.blue);
    }
}
