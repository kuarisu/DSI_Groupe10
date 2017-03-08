using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AI_MissileComponent : MonoBehaviour {

	public float speedAIMissile;
    public float m_TimeBeforeDestroy;

	// Use this for initialization
	void Start () {
        StartCoroutine(DelayBeforeDestroy());
	}
	
	// Update is called once per frame
	void Update () {
		transform.Translate (transform.up * speedAIMissile * Time.deltaTime * 60f, Space.World);
	}

    IEnumerator DelayBeforeDestroy()
    {
        yield return new WaitForSeconds(m_TimeBeforeDestroy);
        Destroy(this.gameObject);
        yield break;
    }
}
