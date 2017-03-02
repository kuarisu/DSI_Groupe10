using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Enemy_Lives : MonoBehaviour {

    [SerializeField]
    int m_NumberOfLives;        //The Game Designers can change the number of lifves the enemy has.

    [SerializeField]
    float m_TimerBeforeDestroy; //The Game Designers can change the delay before destroying the enemy. If it's 0, it will be instant.


    // The function called by the bullet each time it hits an enemy with life.
    public void Hited()
    {
        m_NumberOfLives--;

        if (m_NumberOfLives <= 0) //If the enemy lives number falls to 0, the enemy dies.
        {
            EnemyDeath();
        }
    }


    //A seperate function to directly call the death of the enemy, might be useful if the player has some special abilities
    public void EnemyDeath()
    {
        StartCoroutine(DeathCoroutine());
    }

    //Coroutine so we can add some daly before destroying the enemy and maybe add animation and visual effects here
    IEnumerator DeathCoroutine()
    {
        this.GetComponent<Collider2D>().enabled = false; // Disable the collider so it won't have any impact on the reste of the game.
        yield return new WaitForSeconds(m_TimerBeforeDestroy);
        Destroy(this.gameObject);
        yield break;
    }

}
