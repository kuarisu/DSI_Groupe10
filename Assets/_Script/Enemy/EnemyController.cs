using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class Boundary                         // use to limit the movement of the enemy
{
    public float xMin, xMax, yMin, yMax;
}

public class EnemyController : MonoBehaviour {
    
    public float speedVertical;
    public float speedHorizontal;
    public Boundary boundary;
    [Tooltip("Decide a relative position you want to move to when trigger movePointToPoint function")]
    public Vector2 relativeOffset;                    //it's a relative vector which equals (Endpoint - StartPoint)

    [Tooltip("back to the original point, but remenber to check out when after used")]
    public bool backToOrigin;
    public bool chooseRandomAction;
    
    public bool moveUp;
    public bool moveDown;
    public bool moveLeft;
    public bool moveRight;
    public bool moveToTarget;
    public bool movePointToPoint;
   

    [Header("Move Horzontally")]
    [Tooltip("Decide whether to turn left or right first when trigger loopHorzontal function")]
    public bool GoLeftFirst;
    [Tooltip("The enemy will swing horizontally")]
    public bool loopHorizontal;

    [Header("Rotate Around Target")]
    public GameObject target;                      //normally it's the player
    [Tooltip("radius of the circle")]
    public float radius;
    public bool rotateClockwise;
    [Tooltip("First move toward player, then rotate")]
    public bool rotateAroundTarget;




    Vector2 moveDirection;
    Rigidbody2D rb;
   

    private Vector3 originalPosition;
    private bool shouldMoveLeft;              // judge if enemy should move to left
    private Vector2 movement;
    private float speedZ;                    // of speed of the enemy when it don't move horizontal and vertical
    private Vector2 startPoint;
    private Vector2 endPoint;

    private float AIThinkPeriod = 3f;   //every 3 seconds, Ai will make a decistion
    private float thinkTimeLeft;
    private int randomOrder;
    private ORDER order;
    private float distanceToTargetAtBegin;


    enum ORDER
    {
        UP,
        DOWN,
        LEFT,
        RIGHT,
        LOOPHORIZONTAL,
        POINTTOPOINT,
        ZUP,
        MOVETOPLAYER,
        ROTATEAROUNDPLAYER
    };

    void Awake()
    {
        originalPosition = transform.position;
        //target = GameObject.Find("Player");
        shouldMoveLeft = GoLeftFirst;
        speedZ = Mathf.Sqrt(speedVertical * speedVertical + speedHorizontal * speedHorizontal);
        startPoint.Set(transform.position.x, transform.position.y);        //start point is exactly where is enemy is at beginning
        //endPoint = startPoint + relativeOffset;
        thinkTimeLeft = 0;
        
    }
    void Start () {
        rb = GetComponent<Rigidbody2D>();
		if (target != null) {
			distanceToTargetAtBegin = DetectiveDistance (rb.position, target.transform.position);
		}


    }

	void Update () {
        //MoveRight();
        //MoveLeft();
        //MoveUp();
        //MoveLoopHorizontal();
        //MovePointToPoint();
        //TestMonitor();
        //MoveToPlayer();
        //RotateAroundPlayer();
        
    }

    void FixedUpdate()
    {
		if (target != null) {
			
			LookAtTarget ();
		}

        if (chooseRandomAction)
        {
            thinkTimeLeft -= Time.deltaTime;
            if (thinkTimeLeft <= 0)                    // every x seconds, AI will choose an action(x = AIThinkPeriod). 
            {
                ChooseRandomAction();
                thinkTimeLeft = AIThinkPeriod;
            }
            ExecuteRandomAction();
        }
        if (backToOrigin)
            BackToOrigin();
        if (moveUp)
            MoveUp();
        if (moveDown)
            MoveDown();
        if (moveLeft)
            MoveLeft();
        if (moveRight)
            MoveRight();
        if (loopHorizontal)
            MoveLoopHorizontal();
        if (movePointToPoint)
            MovePointToPoint();
        if (moveToTarget)
            MoveToTarget();
        if (rotateAroundTarget)
            RotateAroundTarget();

    }

    void MoveLoopHorizontal()        //The enemy will first move to left
    {
        if(shouldMoveLeft)
        {
            MoveLeft();
        }

        if (!shouldMoveLeft)  // if the enemy should not move to left, then move to right;
        {
            MoveRight();
        }
        
		if (transform.position.x <= originalPosition.x + boundary.xMin)
        {
            shouldMoveLeft = false;
        }
		if (transform.position.x >= originalPosition.x + boundary.xMax)
        {
            shouldMoveLeft = true;
        }
    }

    void BackToOrigin()
    {
        transform.position = originalPosition;
    }

    void MoveUp()
    {
        movement.Set(0, speedVertical * Time.deltaTime);
        rb.position += movement;
        //rb.velocity = Vector2.up * speed * Time.deltaTime;
        //rb.position = new Vector2(rb.position.x, rb.position.y + speedVertical * Time.deltaTime);
        //rb.MovePosition(rb.position + Vector2.up * speed * Time.deltaTime);
        ClampEnemeyToBoundry();
    }

    void MoveDown()
    {
        movement.Set(0, -speedVertical * Time.deltaTime);
        rb.position += movement;
        //rb.velocity = Vector2.down * speed * Time.deltaTime;
        //rb.position = new Vector2(rb.position.x, rb.position.y - speedVertical * Time.deltaTime);
        ClampEnemeyToBoundry();
    }

    void MoveLeft()
    {
        movement.Set(-speedHorizontal * Time.deltaTime, 0);
        rb.position += movement;
        ClampEnemeyToBoundry();
        //rb.velocity = Vector2.left * speed * Time.deltaTime;
        //rb.position = new Vector2(rb.position.x - speedHorizontal * Time.deltaTime, rb.position.y);
        //rb.MovePosition(rb.position + Vector2.left * speed * Time.deltaTime);
        // Debug.Log("moving to the left");
    }

    void MoveRight()
    {
        movement.Set(speedHorizontal * Time.deltaTime, 0);
        rb.position += movement;
        ClampEnemeyToBoundry();
        //rb.velocity = Vector2.right * speed * Time.deltaTime;
        //rb.position = new Vector2(rb.position.x + speedHorizontal * Time.deltaTime, rb.position.y);
    }

    void StopMove()
    {
        rb.velocity = Vector2.zero;
    }

    void TestMonitor()
    {
        //Debug.Log(" speedZ =  " + speedZ);
        
    }

    void MovePointToPoint()
    {
       
        endPoint = startPoint + relativeOffset;
        //calulate the distance between endPoint and startPoint
        float distance = relativeOffset.magnitude;
        //endPoint = rb.position + relativeOffset;
        //rb.position = Vector2.LerpUnclamped(rb.position, endPoint, distance / speedZ * Time.deltaTime / 10);    // lerp will cause uneven speed moving behaviour, sometimes useful
        rb.position = Vector2.MoveTowards(rb.position, endPoint, distance / speedZ * Time.deltaTime);
        //Debug.Log("spend time =  " + Time.time);
    }

    void MoveToTarget()
    {
        rb.position = Vector2.MoveTowards(rb.position, target.transform.position, distanceToTargetAtBegin / speedZ * Time.deltaTime);
    }

    void RotateAroundTarget()                   //attatation, this function must work with LookAtTarget function
    {
        float distance = DetectiveDistance(rb.position, target.transform.position);
        if(distance > radius)
        {
            MoveToTarget();
        }
        else   //distance <= radius
        {
            if (rotateClockwise)
            {
                transform.Translate(-speedZ * Time.deltaTime, 0, 0, Space.Self);
            }
            else
            {
                transform.Translate(speedZ * Time.deltaTime, 0, 0, Space.Self);
            }
           
        }
        
    }


    void ClampEnemeyToBoundry()          
    {
        rb.position = new Vector2
           (
				Mathf.Clamp(rb.position.x, originalPosition.x + boundary.xMin,originalPosition.x +  boundary.xMax),
				rb.position.y
           );
    }

    float DetectiveDistance(Vector3 startPoint, Vector3 endPoint)
    {
        Vector3 relativeVecotr = endPoint - startPoint;
       
        return relativeVecotr.magnitude;
    }

    void ChooseRandomAction()
    {
        randomOrder = Random.Range(0, 9); //return 0 ~ 8, the 9 is not include
        order = AcceptOrder(randomOrder);
    }

    void LookAtTarget()
    {
        Vector3 diff = target.transform.position - transform.position;
        diff.Normalize();

        float rot_z = Mathf.Atan2(diff.y, diff.x) * Mathf.Rad2Deg;
        transform.rotation = Quaternion.Euler(0f, 0f, rot_z - 90);
    }

    void ExecuteRandomAction()
    {
        switch (order)
        {
            case ORDER.UP:
                MoveUp();       
                break;
            case ORDER.DOWN:
                MoveDown();
                break;
            case ORDER.LEFT:
                MoveLeft();
                break;
            case ORDER.RIGHT:
                MoveRight();
                break;
            case ORDER.LOOPHORIZONTAL:
                MoveLoopHorizontal();
                break;
            case ORDER.POINTTOPOINT:
                MovePointToPoint();
                break;
            case ORDER.ZUP:
                MoveUp();
                MoveLoopHorizontal();
                break;
            case ORDER.MOVETOPLAYER:
                MoveToTarget();
                break;
            case ORDER.ROTATEAROUNDPLAYER:
                RotateAroundTarget();
                break;
        }
        Debug.Log("the order = " + order);
    }

    ORDER AcceptOrder(int orderNumber)
    {
        ORDER order = new ORDER();
        if (orderNumber == 0)
            order = ORDER.UP;
        if (orderNumber == 1)
            order = ORDER.DOWN;
        if (orderNumber == 2)
            order = ORDER.LEFT;
        if (orderNumber == 3)
            order = ORDER.RIGHT;
        if (orderNumber == 4)
            order = ORDER.LOOPHORIZONTAL;
        if (orderNumber == 5)
            order = ORDER.POINTTOPOINT;
        if (orderNumber == 6)
            order = ORDER.ZUP;
        if (orderNumber == 7)
            order = ORDER.MOVETOPLAYER;
        if (orderNumber == 8)
            order = ORDER.ROTATEAROUNDPLAYER;
        return order;
    }
}
