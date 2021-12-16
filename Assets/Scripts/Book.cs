using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Book : MonoBehaviour
{
    private SpriteRenderer sr;
    private BoxCollider2D box;
    public GameObject collected;

    [SerializeField] private int score;

    void Start()
    {
        sr = GetComponent < SpriteRenderer> ();
        box = GetComponent <BoxCollider2D> ();
    }
    void OnTriggerEnter2D (Collider2D collider)
    {
        if (collider.gameObject.tag == "Player")
        {
            sr.enabled = false;
            box.enabled = false;
            collected.SetActive(true);

            GameController.instance.totalScore += score;

            GameController.instance.UpdateScoreText();
            Destroy(gameObject, 0.25f);
        }
    }
}
