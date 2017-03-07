﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SoundManager : MonoBehaviour {

    public AudioSource BulletDestroyed;
    public AudioSource ShotFired;
    public AudioSource PLayerTrailSound;
    public AudioSource PlayerDeath;
    public AudioSource Player_NoBulletFiring;

    public AudioSource SoundTrack;

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
}
