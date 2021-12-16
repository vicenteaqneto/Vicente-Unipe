using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class EnemyController : MonoBehaviour
{
    [SerializeField] private float speed;

    private Rigidbody2D rig;
    private Animator anim;
    [SerializeField] private Transform rightCol;
    [SerializeField] private Transform leftCol;
    [SerializeField] private Transform headPoint;
    private bool colliding;
    public LayerMask layer;
    public BoxCollider2D boxCollider2D;
    private PlayerController playerController;
    [SerializeField] private Transform initialPoint;

   
   

    void Start()
    {
        rig = GetComponent<Rigidbody2D>();
        anim = GetComponent<Animator>();
        playerController = GetComponent<PlayerController>();

    }
    void Update()
    {
        rig.velocity = new Vector2(speed, rig.velocity.y);
        colliding = Physics2D.Linecast(rightCol.position, leftCol.position, layer);
        if (colliding)
        {
            transform.localScale = new Vector2(transform.localScale.x*-1f, transform.localScale.y);
            speed *=-1f;
        }
    }
    bool playerDestroyed = false;
     void OnCollisionEnter2D (Collision2D collision)
    {
        if(collision.gameObject.tag == "Player")
        {
            float height = collision.contacts[0].point.y - headPoint.position.y;

            if(height > 0 && !playerDestroyed )
            {
                collision.gameObject.GetComponent<Rigidbody2D>().AddForce(Vector2.up*5, ForceMode2D.Impulse);
                speed = 0;
                anim.SetTrigger("Die");
                boxCollider2D.enabled = false;
                rig.bodyType = RigidbodyType2D.Kinematic;
                Destroy(gameObject,0.33f);
            }else
            {
                playerDestroyed = true;
               
                Destroy(collision.gameObject);
                SceneManager.LoadScene(SceneManager.GetActiveScene().name);
                transform.position = initialPoint.position;
                
            }
        }
    }
}
