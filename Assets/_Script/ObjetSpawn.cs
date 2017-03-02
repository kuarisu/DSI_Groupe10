using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ObjetSpawn : MonoBehaviour {

    public GameObject m_ObjectToBeSpawn;

    private void OnEnable()
    {
        GameObject clone = Instantiate(m_ObjectToBeSpawn, transform.position, Quaternion.identity);
        clone.transform.parent = this.gameObject.transform.root.transform;
        this.gameObject.SetActive(false);
    }
}
