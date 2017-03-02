using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering;
using DG.Tweening;

public class PlayerController : MonoBehaviour
{

    GameManager gm;
    Rigidbody2D rb;
    TrailRenderer trail;

    public GameObject bullet;
    GameObject bulletFired;
    bool fired;

    public Camera mainCam;
    public Vector2 targetPosition;
    public float startOffset;
    public float maxOffsetY;
    public float distanceOffsetY;
    public float maxOffsetX;
    public float distanceOffsetX;

    [Header("GAMEPLAY")]
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
    public int bulletSpeed;
    public int bulletNumber;

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

        rb = this.GetComponent<Rigidbody2D>();
        trail = this.GetComponent<TrailRenderer>();
        targetPosition = new Vector2(mainCam.transform.position.x, mainCam.transform.position.y + startOffset);
        transform.position = new Vector3(0,-3,0);
        fired = false;
    }

    private void Start()
    {
        gm = GameManager.instance;
    }
    // Update is called once per frame
    void Update()
    {
        if(SplashScreen.isFinished == true && gm.hasGameLaunched)
            Controls();

        if (gm.hasGameLaunched)
        {
            BackForceY();
            BackForceX();
        }

    }

    // Controls for the player
    void Controls()
    {

        //INPUTS FOR EDITOR AND STANDALONE
#if UNITY_EDITOR || UNITY_STANDALONE
        if (Input.GetMouseButtonDown(0) && Camera.main.ScreenToWorldPoint(Input.mousePosition).y < transform.position.y /*&& bulletNumber > 0*/)
        {
            Vector2 direction = Camera.main.ScreenToWorldPoint(Input.mousePosition) - transform.position;
            direction.Normalize();

            rb.AddForce(new Vector2(Mathf.Clamp(-direction.x * sidepunch, -maxsidepunch, maxsidepunch), -direction.y) * firepunch, ForceMode2D.Impulse);
            bulletFired = Instantiate(bullet, transform.position, transform.rotation);

            // Rotate the bullet towards the input
            float rot_z = Mathf.Atan2(direction.y, direction.x) * Mathf.Rad2Deg;
            bulletFired.transform.rotation = Quaternion.Euler(0f, 0f, rot_z + 90);

            bulletFired.GetComponent<Rigidbody2D>().velocity = direction * bulletSpeed;

            // Screen Shake
            Camera.main.transform.position = new Vector3(0, 0, -10);
            Camera.main.transform.DOShakePosition(duration, new Vector3(strenght / 2, strenght, 0), 20, 90);
            bulletNumber--;
        }
        #endif


        // INPUTS FOR ANDROID
#if UNITY_ANDROID
        for (int i = 0; i < Input.touchCount; ++i)
        {
            if (Input.GetTouch(0).phase == TouchPhase.Began && Camera.main.ScreenToWorldPoint(Input.GetTouch(0).position).y < transform.position.y /*&& bulletNumber > 0*/)
            {
                Vector2 direction = Camera.main.ScreenToWorldPoint(Input.GetTouch(0).position) - this.transform.position;
                direction.Normalize();
             
                rb.AddForce(new Vector2(Mathf.Clamp(-direction.x * sidepunch,-maxsidepunch,maxsidepunch), -direction.y) * firepunch, ForceMode2D.Impulse);
                bulletFired = Instantiate(bullet, transform.position, transform.rotation);

                // Rotate the bullet towards the input
                float rot_z = Mathf.Atan2(direction.y, direction.x) * Mathf.Rad2Deg;
                bulletFired.transform.rotation = Quaternion.Euler(0f, 0f, rot_z + 90);

                bulletFired.GetComponent<Rigidbody2D>().velocity = direction * bulletSpeed;

                // Screen Shake
                Camera.main.transform.position = new Vector3(0, 0, -10);
                Camera.main.transform.DOShakePosition(duration, new Vector3(strenght / 2, strenght, 0), 20, 90);
            }
        }
#endif
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
    } 
