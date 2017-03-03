using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class ObjetSpawn : MonoBehaviour {

    public enum EnemyToSpawn {Movement,MovementTop,ScrollHorizontal,Main1,
    Main2,Main3,MovingHorizontalTop,MurG,MurD,MurC,Turret,Empty1}

    public EnemyToSpawn enemyToSpawn;
    public bool shouldSpawn;
    public  List<GameObject> Enemies = new List<GameObject>();

    public GameObject clone;

    private void OnEnable()
    {
        if (transform.childCount > 0)
            DestroyImmediate(transform.GetChild(0).gameObject);

    }

    void Update()
    {
        if (shouldSpawn)
        {
            if (clone)
                DestroyImmediate(clone);

            clone = Instantiate(Enemies[(int)enemyToSpawn], transform.position, transform.rotation, transform);
        }
    }
}
