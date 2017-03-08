using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;

public class ScoreFeedback : MonoBehaviour {

    public Text text;
    public Transform targetPos;
    public float maxAngleText;

    void Awake()
    {
        //transform.DOPunchScale(new Vector3(1.25f, 1.25f, 1.25f), 0.75f, 7);
        transform.DOScale(1.25f, 0.25f).SetLoops(2, LoopType.Yoyo);
        text.DOFade(0, 0.75f).SetEase(Ease.InQuart).OnComplete(Destruction);
        transform.DORotate(new Vector3(0, 0, Random.Range(-maxAngleText, maxAngleText)),0f);
    }

    private void Update()
    {
        transform.position += transform.up * 500 * Time.deltaTime;
    }

    void Destruction()
    {
        Destroy(gameObject);
    }

}
