using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemiesManager : MonoBehaviour {

    public List<GameObject> m_ListOfEnemies = new List<GameObject>();
    bool m_ElementsEnbaled = false;

	void Update () {
		if(GameManager.instance.gamestarted == true && !m_ElementsEnbaled)
        {
            m_ElementsEnbaled = true;
            EnablingEnemies();

        }
	}

    
    void EnablingEnemies()
    {
        foreach (var GameObject in m_ListOfEnemies)
        {
            GameObject.gameObject.SetActive(true);
        }
    } 
}
