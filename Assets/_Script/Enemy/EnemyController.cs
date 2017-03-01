using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class Boundary                         // use to limit the movement of the target
{
    public float xMin, xMax;
}

public class EnemyController : MonoBehaviour {
    public float speedVertical;
    public float speedHorizontal;
    public Boundary boundary;               
    public Vector2 offset;                    //it's a relative vector which equals (Endpoint - StartPoint)
    public bool GoLeftFirst;

    public bool moveUp;
    public bool moveDown;
    public bool moveLeft;
    public bool moveRight;
    public bool loopHorizontal;
    public bool movePointToPoint;               
    


    Vector2 moveDirection;
    Rigidbody2D rb;

    private bool shouldMoveLeft;              // judge if enemy should move to left
    private Vector2 movement;
    private float speedZ;                    // of speed of the enemy when it don't move horizontal and vertical
    private Vector2 startPoint;
    private Vector2 endPoint;


    enum ORDER
    {
        NOTHING,
        UP,
        DOWN,
        LEFT,
        RIGHT,
        LOOPHORIZONTAL,
        POINTTOPOINT,
    };

    void Awake()
    {
        shouldMoveLeft = GoLeftFirst;
        speedZ = Mathf.Sqrt(speedVertical * speedVertical + speedHorizontal * speedHorizontal);
        startPoint.Set(transform.position.x, transform.position.y);        //start point is exactly where is enemy is at beginning
        endPoint = startPoint + offset;

    }
    void Start () {
        rb = GetComponent<Rigidbody2D>();
	}
	
	// Update is called once per frame
	void Update () {
        //MoveRight();
        //MoveLeft();
        //MoveUp();
        //MoveLoopHorizontal();
        //MovePointToPoint();
        //TestMonitor();
    }

    void FixedUpdate()
    {
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
        /*
        ORDER order = AcceptOrder();
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
           }
        */

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
        
        if (transform.position.x < boundary.xMin)
        {
            shouldMoveLeft = false;
        }
        if (transform.position.x >= boundary.xMax)
        {
            shouldMoveLeft = true;
        }
    }

    void MoveUp()
    {
        movement.Set(0, speedVertical * Time.deltaTime);
        rb.position += movement;
        //rb.velocity = Vector2.up * speed * Time.deltaTime;
        //rb.position = new Vector2(rb.position.x, rb.position.y + speedVertical * Time.deltaTime);
        //rb.MovePosition(rb.position + Vector2.up * speed * Time.deltaTime);

    }

    void MoveDown()
    {
        movement.Set(0, -speedVertical * Time.deltaTime);
        rb.position += movement;
        //rb.velocity = Vector2.down * speed * Time.deltaTime;
        //rb.position = new Vector2(rb.position.x, rb.position.y - speedVertical * Time.deltaTime);
    }

    void MoveLeft()
    {
        movement.Set(-speedHorizontal * Time.deltaTime, 0);
        rb.position += movement;
        clampEnemeyToBoundry();
        //rb.velocity = Vector2.left * speed * Time.deltaTime;
        //rb.position = new Vector2(rb.position.x - speedHorizontal * Time.deltaTime, rb.position.y);
        //rb.MovePosition(rb.position + Vector2.left * speed * Time.deltaTime);
        // Debug.Log("moving to the left");
    }

    void MoveRight()
    {
        movement.Set(speedHorizontal * Time.deltaTime, 0);
        rb.position += movement;
        clampEnemeyToBoundry();
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
        //calulate the distance between endPoint and startPoint
        //Vector2 temp = endPoint - startPoint;
        float distance = offset.magnitude;

        rb.position = Vector2.Lerp(rb.position, endPoint, distance / speedZ * Time.deltaTime / 10);
        Debug.Log("distance =  " + distance);
    }

    void clampEnemeyToBoundry()          
    {
        rb.position = new Vector2
           (
               Mathf.Clamp(rb.position.x, boundary.xMin, boundary.xMax),
               rb.position.y
           );
    }

    ORDER AcceptOrder()
    {
        if (moveUp)
            return ORDER.UP;
        if (moveDown)
            return ORDER.DOWN;
        if (moveLeft)
            return ORDER.LEFT;
        if (moveRight)
            return ORDER.RIGHT;
        if (loopHorizontal)
            return ORDER.LOOPHORIZONTAL;
        if (movePointToPoint)
            return ORDER.POINTTOPOINT;
        return ORDER.NOTHING;
    }
}
