using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ObjetSpawn : MonoBehaviour {

    public GameObject m_ObjectToBeSpawn;

    private void OnEnable()
    {
        Instantiate(m_ObjectToBeSpawn, transform.position, Quaternion.identity);
        this.gameObject.SetActive(false);
    }
}
