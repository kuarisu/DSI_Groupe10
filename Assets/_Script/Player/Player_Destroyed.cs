using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player_Destroyed : MonoBehaviour {

    public float TimeBeforeRespawn;

    public void Death()
    {
        StartCoroutine(DestroyedCoroutine());
    }

    IEnumerator DestroyedCoroutine()
    {
        yield return new WaitForSeconds(TimeBeforeRespawn);
    }
}
