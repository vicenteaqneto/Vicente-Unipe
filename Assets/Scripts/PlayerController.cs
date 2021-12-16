using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

[RequireComponent(typeof(Rigidbody2D))]
public class PlayerController : MonoBehaviour
{
    [SerializeField] private float speed;
    private float horizontal;
    public float Horizontal => this.horizontal;
    private Rigidbody2D rb;
    private Animator anim;
    private PlayerController playerController;
    private SpriteRenderer sprite;

    [SerializeField] private float JumpForce;
    [SerializeField] private bool isGround;
    [SerializeField] private LayerMask groundMask;
    [SerializeField] private Transform groundCheck;
    public float VelocityY => rb.velocity.y;
    public bool IsGround => isGround;

    private bool damage;
    private LifeController lifeController;
    [SerializeField] private Transform initialPoint;

    
    private void Awake()
    {
        if(rb == null) rb = GetComponent<Rigidbody2D>();
        if(anim == null) anim = GetComponent<Animator>();
        if(playerController == null) playerController = GetComponent<PlayerController> ();
        if(sprite == null) sprite = GetComponent<SpriteRenderer>();
        if(lifeController== null) lifeController = GetComponent<LifeController>();
    }
    void Update()
    {
        if (!damage) horizontal = Input.GetAxisRaw("Horizontal");
        anim.SetFloat("Horizontal", Mathf.Abs(playerController.Horizontal));
        
        Flip();
        Jump();
        isGround = Physics2D.OverlapCircle(groundCheck.position, 0.01f, groundMask);
        anim.SetFloat("VelocityY", playerController.VelocityY);
        anim.SetBool("IsGround", playerController.IsGround);
        if( lifeController.isDead())
        {
            SceneManager.LoadScene(SceneManager.GetActiveScene().name);
            transform.position = initialPoint.position;
        }
    }
    void FixedUpdate()
    {
        Vector2 velocity = new Vector2 (horizontal*speed*Time.fixedDeltaTime, rb.velocity.y);
        if(damage) velocity = Vector2.zero;
        rb.velocity = velocity;
    }
    void Flip()
    {
        if (playerController.Horizontal > 0 && sprite.flipX)
        {
            sprite.flipX = false;
        }
        if (playerController.Horizontal <0 && !sprite.flipX)
        {
            sprite.flipX = true;
        }
    }
    void Jump()
    {
        if( Input.GetKeyDown(KeyCode.Space) && isGround)
        {
            AudioController.instance.PlayAudioJump();
            rb.velocity = new Vector2(rb.velocity.x, JumpForce);
        }
    }

    public void StartBlink()
    {
        StartCoroutine(Blink());
    }
    IEnumerator Blink()
    {
    for (int i=1;i<=5;i++)
    {
        sprite.color = new Color(sprite.color.r,sprite.color.g,sprite.color.b,0);
        yield return new WaitForSeconds(0.1f);
        
        sprite.color = new Color(sprite.color.r,sprite.color.g,sprite.color.b,1);
        yield return new WaitForSeconds(0.1f);
        playerController.damage = false;
    }
    }
    
    void OnTriggerEnter2D (Collider2D other)
    {
        
    if(other.gameObject.CompareTag("Spikeball") && !damage)
    {
        damage = true;
        AudioController.instance.PlayAudioHurt();
        lifeController.LifeDown(1);
        if(other.transform.position.x>transform.position.x)
        {
            rb.AddForce(new Vector2(-800,rb.velocity.y));
            playerController.StartBlink();
        }else
        {
           rb.AddForce(new Vector2(800,rb.velocity.y));
            playerController.StartBlink(); 
        }
        
    }
    if(other.gameObject.CompareTag("Saw") && !damage)
    {
        damage = true;
        AudioController.instance.PlayAudioHurt();
        lifeController.LifeDown(1);
        if(other.transform.position.x>transform.position.x)
        {
        rb.AddForce(new Vector2(-800,250));
        playerController.StartBlink();
        }
        else
        {
        rb.AddForce(new Vector2(800,250));
        playerController.StartBlink();
        }
        
    }
    if(other.gameObject.CompareTag("Spikes"))
    {
        damage = true;
        AudioController.instance.PlayAudioHurt();
        lifeController.LifeDown(3);
        if(other.transform.position.x>transform.position.x)
        {
            rb.AddForce(new Vector2(-800,rb.velocity.y));
            playerController.StartBlink();
        }else
        {
           rb.AddForce(new Vector2(800,rb.velocity.y));
            playerController.StartBlink(); 
        }
        
    }
    }
    void OnCollisionEnter2D(Collision2D collision)
    {
    if(collision.gameObject.CompareTag("Enemy") && !damage)
    {
        damage = true;
        AudioController.instance.PlayAudioHurt();
        lifeController.LifeDown(0);
        if(collision.transform.position.x>transform.position.x)
        {
        rb.AddForce(new Vector2(-800,250));
        playerController.StartBlink();
        }
        else
        {
        rb.AddForce(new Vector2(800,250));
        playerController.StartBlink();
        }
        
    }
    }

}

