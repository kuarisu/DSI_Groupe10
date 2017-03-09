using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MyPlayerPosition : MonoBehaviour {
    public Transform targetPlayer;


    private Material _mat;
    // Use this for initialization
    void Start()
    {
        targetPlayer = GameObject.FindGameObjectWithTag("Player").transform;
        _mat = GetComponent<Renderer>().material;
    }

    // Update is called once per frame
    void Update()
    {
        _mat.SetVector("_MyPlayerPosition", targetPlayer.position);
    }
}