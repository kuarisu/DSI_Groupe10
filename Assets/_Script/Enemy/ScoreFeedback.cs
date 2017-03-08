using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;

public class ScoreFeedback : MonoBehaviour {

    public Text text;
    public Transform targetPos;

    void Awake()
    {
        transform.DOPunchScale(new Vector3(1.25f, 1.25f, 1.25f), 0.75f, 7);
        transform.DOLocalMoveY(transform.position.y + 10, 1f).OnComplete(Destruction);
        text.DOFade(0, 0.75f).SetEase(Ease.InQuart);
    }

    void Destruction()
    {
        Destroy(gameObject);
    }

}
