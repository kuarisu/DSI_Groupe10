using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BulletReturn : MonoBehaviour {

    public GameObject targetReturn;
    public int speed;
    public int addedBullets;

    GameManager gm;

    // Use this for initialization
    void Awake () {
        gm = GameManager.instance;
        targetReturn = gm.player.gameObject;
    }
	
	// Update is called once per frame
	void Update () {
        LookAt2D(targetReturn.transform);
        transform.Translate(Vector3.up * -1 * speed * Time.deltaTime);

        if(transform.position.y >= targetReturn.transform.position.y + 0.1f)
        {
            GameManager.instance.player.Bullets(addedBullets);
            Destroy(gameObject);
        }

    }
    
    public void LookAt2D(Transform target)
    {
        Vector2 direction = target.position - transform.position;
        direction.Normalize();

        float rot_z = Mathf.Atan2(direction.y, direction.x) * Mathf.Rad2Deg;
        transform.rotation = Quaternion.Euler(0f, 0f, rot_z + 90);
    }
}
