using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FallingPlatform : MonoBehaviour
{
    [SerializeField]  private float fallingTime;
  private TargetJoint2D target;
  private BoxCollider2D boxCollider2D;

  void Start()
  {
      target = GetComponent<TargetJoint2D>();
      boxCollider2D =GetComponent<BoxCollider2D>();

  }
  void OnCollisionEnter2D (Collision2D collision)
  {
      if (collision.gameObject.tag == "Player")
      {
          Invoke ("Falling", fallingTime);
      }
       }
       void Falling()
      {
          target.enabled = false;
          boxCollider2D.isTrigger = true;
      }

      void OnTriggerEnter2D (Collider2D collider)
      {
          if (collider.gameObject.layer == 7)
          {
              Destroy(gameObject);
          }
      }
}
