using System.Collections;
using System.Collections.Generic;
using DG.Tweening;
using UnityEngine;

public class SoundManager : MonoBehaviour {

    public AudioSource BulletDestroyed;
    public AudioSource ShotFired;
    public AudioSource PLayerTrailSound;
    public AudioSource PlayerDeath;
    public AudioSource Player_NoBulletFiring;
    public AudioSource MenuTheme;
    public AudioSource IntroTheme;
    public AudioSource MainTheme;

    public static SoundManager Instance;
    private void Awake()
    {
        if (SoundManager.Instance != null)
        {
            Destroy(this.gameObject);
            return;
        }

        SoundManager.Instance = this;
        
    }

    public IEnumerator PlayMainTheme()
    {
        MainTheme.Play();
        MenuTheme.DOFade(0, 8f);
        MainTheme.DOFade(0.85f, 12f);

        yield return new WaitForSeconds(10f);

        MenuTheme.Stop();
    }
}
