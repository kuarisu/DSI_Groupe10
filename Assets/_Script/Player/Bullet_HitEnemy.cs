using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Bullet_HitEnemy : MonoBehaviour {


    private void OnTriggerEnter2D(Collider2D col)
    {
        Debug.Log(col.gameObject.name);
        if (col.gameObject.tag == "enemy" && col.gameObject.GetComponent<Enemy_Lives>() != null)
        {
            col.gameObject.GetComponent<Enemy_Lives>().Hited();
        }
    }
}
