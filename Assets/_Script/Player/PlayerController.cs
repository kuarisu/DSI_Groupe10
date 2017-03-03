using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering;
using DG.Tweening;

public class PlayerController : MonoBehaviour
{

    GameManager gm;
    LevelManager lm;
    UIManager ui;
    Rigidbody2D rb;
    TrailRenderer trail;

    public GameObject bullet;
    GameObject bulletFired;
    bool fired;
    bool isHoldingDown;
    bool doRotate;
    Vector3 startRotation;
    float backforceTimer = 3f;

    public Camera mainCam;
    public Vector2 targetPosition;
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
    public int bulletNumber;
    public float rateOfFire;
    float lastShot;

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

    // Use this for initialization
    void Awake()
    {
        gm = GameManager.instance;
        lm = gm.levelManager;
        ui = gm.uiManager;
        rb = this.GetComponent<Rigidbody2D>();
        trail = this.GetComponent<TrailRenderer>();
        startOffset = (startOffset * mainCam.orthographicSize);
        targetPosition = new Vector2(mainCam.transform.position.x, mainCam.transform.position.y + startOffset);
        if (mainCam.transform.position.y - targetPosition.y < minDistTop)
            targetPosition = new Vector2(targetPosition.x, mainCam.orthographicSize - minDistTop);
        transform.position = new Vector3(0,-3,0);
        fired = false;
        startRotation = transform.rotation.eulerAngles;
    }

    // Update is called once per frame
    void Update()
    {
        if (gm.hasGameLaunched)
        {
            if (SplashScreen.isFinished)
                Controls();

            BackForceY();
            BackForceX();
        }

        if (Vector3.Dot(-transform.up, Vector3.down) < 1f)
        {
            if (backforceTimer > 1f && !isRotating)
            {
                BackForceRotation();
            }
            else
            {
                backforceTimer += Time.deltaTime;
            }
        }

    }

    // Controls for the player
    void Controls()
    {

        //INPUTS FOR EDITOR AND STANDALONE
#if UNITY_EDITOR || UNITY_STANDALONE
        if (Input.GetMouseButton(0) && Camera.main.ScreenToWorldPoint(Input.mousePosition).y < transform.position.y && Time.time > rateOfFire + lastShot /*&& bulletNumber > 0*/)
        {
            Fire();
            lastShot = Time.time;
        }

        if (Input.GetMouseButtonUp(0))
            lastShot = 0;
#endif


        // INPUTS FOR ANDROID
#if UNITY_ANDROID
        for (int i = 0; i < Input.touchCount; ++i)
        {
            if (Input.GetTouch(0).phase == TouchPhase.Began && Camera.main.ScreenToWorldPoint(Input.GetTouch(0).position).y < transform.position.y /*&& bulletNumber > 0*/)
            {
                isHoldingDown = true;
                lastShot = Time.time;
                Fire();
            }

            if (Input.GetTouch(0).phase == TouchPhase.Ended)
            {
                lastShot = 0;
                isHoldingDown = false;
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
        bulletFired = Instantiate(bullet, transform.position, transform.rotation);
        bulletFired.transform.SetParent(lm.currentChunk[1].transform);

        // Rotate the bullet and player towards the input
        float rot_z = Mathf.Atan2(direction.y, direction.x) * Mathf.Rad2Deg;
        bulletFired.transform.rotation = Quaternion.Euler(0f, 0f, rot_z + 90);
        transform.rotation = Quaternion.Euler(0f, 0f, rot_z + 90);
        backforceTimer = 0f;

        bulletFired.GetComponent<Rigidbody2D>().velocity = direction * bulletSpeed;

        // Screen Shake
        Camera.main.transform.position = new Vector3(0, 0, -10);
        Camera.main.transform.DOShakePosition(duration, new Vector3(strenght / 2, strenght, 0), 20, 90);
        bulletNumber--;
        DOTween.Kill("Rotation");
        isRotating = false;
    }

    void BackForceY()
    {
        distanceOffsetY = transform.position.y - targetPosition.y;
        float distanceToMax = maxOffsetY - distanceOffsetY;

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

    bool isRotating = false;

    void BackForceRotation()
    {
        isRotating = true;
        transform.DORotate(startRotation, 0.3f + backForceRot * (1 - Vector3.Dot(-transform.up, Vector3.down))).SetEase(Ease.OutSine).SetId("Rotation").OnComplete(ResetBool);
    }

    void ResetBool()
    {
        isRotating = false;
    }
} 
