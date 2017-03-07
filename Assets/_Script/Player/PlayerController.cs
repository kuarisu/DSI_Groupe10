using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering;
using DG.Tweening;

public class PlayerController : MonoBehaviour
{

    GameManager gm;
    Rigidbody2D rb;

    public GameObject bullet;
    public GameObject muzzleFlash;
    public GameObject muzzlepos;
    public GameObject noBullet;
    GameObject bulletFired;
    bool isHoldingDown;
    bool doRotate;
    Vector3 startRotation;
    float backforceTimer = 3f;

    public Camera mainCam;
    public float startOffset;
    public float maxOffsetY;
    public float distanceOffsetY;
    public float maxOffsetX;
    public float distanceOffsetX;

    [Header("GAMEPLAY")]
    [Tooltip("Distance minimum needed between top of the screen and player position")]
    public float minDistTop;
    [Tooltip("Force applied to player at the beginning")]
    public int startpunch;
    [Tooltip("Force applied to player when he fires bullets")]
    public int firepunch;
    [Tooltip("Side force applied to player when he fires bullets")]
    public int sidepunch;
    [Tooltip("Max Side force that can be applied to player when he fires bullets")]
    public float maxsidepunch;
    [Tooltip("Force applied to player when he falls back")]
    public int backForceY;
    [Tooltip("Force applied to player to make it back to the vertical center")]
    public int backForceX;
    [Tooltip("Time in seconds before player gets to his original rotation")]
    public float backForceRot;
    public int bulletSpeed;
    public int maxBullet;
    public float rateOfFire;
    public bool canBulletReturn;
    float lastShot;
    bool isRotating;

    [Header("ROTATION")]
    [Tooltip("Rotation Force applied to player at the beginning")]
    public int startrotationforce;
    [Tooltip("Rotation Force applied to player when he shots straight under him")]
    public int lowanglerotforce;
    [Tooltip("Rotation Force applied to player when he shots a little bit on the sides him")]
    public int midanglerotforce;
    [Tooltip("Rotation Force applied to player when he shots on the sides him")]
    public int faranglerotforce;

    [Header("SCREENSHAKE")]
    public float strenght;
    public float duration;
    public int vibrato;

    [HideInInspector]
    public int currentBullet;
    public bool passedFirstChunkpoint;
    public bool isInChunkPoint;
    public Vector2 targetPosition;
    float rot_z;
    int lastSpray;

    // Use this for initialization
    void Awake()
    {
        gm = GameManager.instance;
        rb = this.GetComponent<Rigidbody2D>();
        startOffset = (startOffset * mainCam.orthographicSize);
        targetPosition = new Vector2(mainCam.transform.position.x, mainCam.transform.position.y + startOffset);
        if (mainCam.transform.position.y - targetPosition.y < minDistTop)
            targetPosition = new Vector2(targetPosition.x, mainCam.orthographicSize - minDistTop);

        InitPlayer();        
    }

    public void InitPlayer()
    {
        transform.position = new Vector3(0, -2, 0);
        startRotation = transform.rotation.eulerAngles;
        currentBullet = maxBullet;
        isInChunkPoint = false;
        isRotating = false;
        passedFirstChunkpoint = false;
        canBulletReturn = false;
        lastSpray = 0;
    }

    // Update is called once per frame
    void Update()
    {
        if (gm.hasGameLaunched && gm.isPlayerDead == false)
        {
            if (SplashScreen.isFinished)
                Controls();

            BackForceY();
            BackForceX();
            PlayerRotation();
        }
    }

    // Controls for the player
    void Controls()
    {

        //INPUTS FOR EDITOR AND STANDALONE
#if UNITY_EDITOR || UNITY_STANDALONE

        if (Input.GetMouseButton(0) && Camera.main.ScreenToWorldPoint(Input.mousePosition).y < transform.position.y && Time.time > rateOfFire + lastShot)
        {
            Fire();
            lastShot = Time.time;
            gm.sprayShots++;
        }

        if (Input.GetMouseButtonUp(0))
        {
            gm.sprayShots -= 1;
            lastShot = 0;
            if (lastSpray < gm.sprayShots)
            {
                gm.sprayShots++;
                lastSpray = gm.sprayShots;
            }
            else
                gm.tapShots++;
        }

#endif


        // INPUTS FOR ANDROID
#if UNITY_ANDROID
        for (int i = 0; i < Input.touchCount; ++i)
        {
            if (Input.GetTouch(0).phase == TouchPhase.Began && Camera.main.ScreenToWorldPoint(Input.GetTouch(0).position).y < transform.position.y)
            {
                isHoldingDown = true;
                lastShot = Time.time;
                Fire();
                gm.sprayShots++;
            }

            if (Input.GetTouch(0).phase == TouchPhase.Ended)
            {
                gm.sprayShots -= 1;
                lastShot = 0;
                isHoldingDown = false;
                if (lastSpray < gm.sprayShots)
                {
                    gm.sprayShots++;
                    lastSpray = gm.sprayShots;
                }
                else
                    gm.tapShots++;
            }
        }

        if(isHoldingDown && Time.time > rateOfFire + lastShot)
        {
            Fire();
            lastShot = Time.time;
        }
#endif
    }

    void Fire()
    {


        Vector2 direction = Camera.main.ScreenToWorldPoint(Input.mousePosition) - transform.position;
        direction.Normalize();

        rb.AddForce(new Vector2(Mathf.Clamp(-direction.x * sidepunch, -maxsidepunch, maxsidepunch), -direction.y) * firepunch, ForceMode2D.Impulse);
        rot_z = Mathf.Atan2(direction.y, direction.x) * Mathf.Rad2Deg;
        transform.rotation = Quaternion.Euler(0f, 0f, rot_z + 90);

        if (currentBullet > 0)
        {
            PlaySound();
            bulletFired = Instantiate(bullet, new Vector3(transform.position.x, transform.position.y, -2), transform.rotation);
            bulletFired.transform.SetParent(gm.levelManager.currentChunk[1].transform);

            GameObject muzzleflash = Instantiate(muzzleFlash, muzzlepos.transform.position, Quaternion.Euler(0f, 0f, rot_z + 90));
            muzzleflash.transform.SetParent(transform);

            if (!isInChunkPoint)
                Bullets(-1);

            bulletFired.GetComponent<Rigidbody2D>().velocity = direction * bulletSpeed;
        }else
        {
            PlaySoundNoBulett();
            bulletFired = Instantiate(noBullet, transform.position, transform.rotation);
            bulletFired.transform.SetParent(transform);
        }

        // Rotate the bullet and player towards the input
        rot_z = Mathf.Atan2(direction.y, direction.x) * Mathf.Rad2Deg;
        bulletFired.transform.rotation = Quaternion.Euler(0f, 0f, rot_z + 90);
        backforceTimer = 0f;

        // Screen Shake
        if (gm.uiManager.isRight == true)
            Camera.main.transform.DOMoveX(-Camera.main.orthographicSize * 0.035f, 2f);
        else if(gm.uiManager.isRight == false)
            Camera.main.transform.DOMoveX(Camera.main.orthographicSize * 0.035f, 2f);
        Camera.main.transform.DOShakePosition(duration, new Vector3(strenght / 2, strenght, 0), 20, 90);

        DOTween.Kill("Rotation");
        isRotating = false; 
    }

    void PlaySound()
    {
        SoundManager.Instance.ShotFired.pitch = Random.Range(0.8f, 1.3f);
        SoundManager.Instance.ShotFired.Play();
    }

    void PlaySoundNoBulett()
    {
        SoundManager.Instance.Player_NoBulletFiring.pitch = Random.Range(0.9f, 1.1f);
        SoundManager.Instance.Player_NoBulletFiring.Play();
    }

    void OnTriggerEnter2D(Collider2D collision)
    {
        if (collision.tag == "Chunkpoint")
        {
            Bullets(maxBullet - currentBullet);
            isInChunkPoint = true;
            gm.uiManager.slider.maxValue = 35;
        }
    }

    void OnTriggerExit2D(Collider2D collision)
    {
        if (collision.tag == "Chunkpoint")
        {
            Bullets(maxBullet - currentBullet);
            currentBullet = maxBullet;
            isInChunkPoint = false;
            gm.uiManager.slider.value = 0;
            gm.uiManager.SetSlider();
            if (passedFirstChunkpoint == false)
                passedFirstChunkpoint = true;
        }
    }

    public void Bullets(int bullet)
    {
        currentBullet += bullet;
        gm.uiManager.M_ammoCount.SetFloat("_AmmoCurrent", currentBullet);
    }

    void BackForceY()
    {
        distanceOffsetY = transform.position.y - targetPosition.y;
       // float distanceToMax = maxOffsetY - distanceOffsetY;

        if (Mathf.Abs(distanceOffsetY) > 0.1f)
        {
            Vector2 vectorToNormalize = new Vector2(0f, targetPosition.y - transform.position.y);
            vectorToNormalize.Normalize();
            rb.AddForce(vectorToNormalize * backForceY * Mathf.Abs(distanceOffsetY * 1.2f / maxOffsetY), ForceMode2D.Force);
            transform.position = new Vector3(transform.position.x, Mathf.Clamp(transform.position.y, startOffset - maxOffsetY, startOffset + maxOffsetY + 1), transform.position.z);
        }
    }

    void BackForceX()
    {
        distanceOffsetX = transform.position.x;

        if (Mathf.Abs(distanceOffsetX) > 0.1f)
        {
            Vector2 vectorToNormalize = new Vector2(transform.position.x, 0f);
            vectorToNormalize.Normalize();
            rb.AddForce(vectorToNormalize * -backForceX * Mathf.Abs(distanceOffsetX * 1.2f / maxOffsetX), ForceMode2D.Force);
            transform.position = new Vector3(Mathf.Clamp(transform.position.x, -maxOffsetX, maxOffsetX), transform.position.y, transform.position.z);
        }
    }

    void PlayerRotation()
    {
        if (Vector3.Dot(-transform.up, Vector3.down) < 1f)
        {
            if (backforceTimer > 1f && !isRotating)
                BackForceRotation();
            else
                backforceTimer += Time.deltaTime;
        }
    }

    void BackForceRotation()
    {
        isRotating = true;
        transform.DORotate(startRotation, 0.3f + backForceRot * (1 - Vector3.Dot(-transform.up, Vector3.down))).SetEase(Ease.OutSine).SetId("Rotation").OnComplete(ResetRotation);
    }

    void ResetRotation()
    {
        isRotating = false;
    }

} 
