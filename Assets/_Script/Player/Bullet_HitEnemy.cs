using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Bullet_HitEnemy : MonoBehaviour {

    public GameObject impact;
    public GameManager gm;

    private void Awake()
    {
        gm = GameManager.instance;
    }

    private void OnTriggerEnter2D(Collider2D col)
    {
        if (col.gameObject.tag == "enemy" && col.gameObject.GetComponent<Enemy_Lives>() != null)
        {
            Enemy_Lives enemyHit;
            enemyHit = col.gameObject.GetComponent<Enemy_Lives>();
            //float remainingLives = enemyHit.m_NumberOfLives;

            enemyHit.Hited();
            //if (remainingLives != 1)
                impact = Instantiate(impact,col.transform.position,transform.rotation);

            impact.transform.SetParent(gm.levelManager.currentChunk[1].transform);
            PlaySound();
            Destroy(gameObject);
        }
        else if(col.gameObject.tag != "BulletDestroyer")
        {
            impact = Instantiate(impact, transform.position, transform.rotation);
            impact.transform.SetParent(gm.levelManager.currentChunk[1].transform);
            PlaySound();
            Destroy(gameObject);
        }
        else
        {
            GetComponent<Collider2D>().enabled = false;
            PlaySound();
            Destroy(gameObject, 1f);
        }
    }

    void PlaySound()
    {
        SoundManager.Instance.BulletDestroyed.pitch = Random.Range(0.9f, 1.1f);
        SoundManager.Instance.BulletDestroyed.Play();
    }
}
