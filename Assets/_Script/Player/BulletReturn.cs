using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class BulletReturn : MonoBehaviour {

    public GameObject targetReturn;
    public int speed;
    public int addedBullets;

    GameManager gm;

    // Use this for initialization
    void Awake()
    {
        gm = GameManager.instance;
        targetReturn = gm.levelManager.bulletReturn;
    }

    // Update is called once per frame
    void Update()
    {
        LookAt2D(targetReturn.transform);
        transform.Translate(Vector3.up * -1 * speed * Time.deltaTime);

       // Debug.Log(Vector3.Distance(Camera.main.ScreenToWorldPoint(targetReturn.transform.position), transform.position));
        if (Vector3.Distance(Camera.main.ScreenToWorldPoint(targetReturn.transform.position), transform.position) < 5.05f)
        {
            gm.uiManager.transform.localScale = new Vector3(0.8f, 1f, 1);
            gm.uiManager.bulletIndicator.transform.DOPunchScale(new Vector3(0.1f, 0.1f, 1), 0.5f, 10, 1);
            gm.player.Bullets(addedBullets);
            Destroy(gameObject);
        }
    }

    public void LookAt2D(Transform target)
    {
        Vector2 direction = Camera.main.ScreenToWorldPoint(target.position) - transform.position;
        direction.Normalize();

        float rot_z = Mathf.Atan2(direction.y, direction.x) * Mathf.Rad2Deg;
        transform.rotation = Quaternion.Euler(0f, 0f, rot_z + 90);
    }
}
