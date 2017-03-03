using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AutoDestroy : MonoBehaviour {

    public float timeB4Death;

	// Use this for initialization
	void Awake () {
        Destroy(gameObject, timeB4Death);
	}
}
