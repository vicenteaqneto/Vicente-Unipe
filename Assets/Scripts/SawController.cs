using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SawController : MonoBehaviour
{
    [SerializeField] private float speed;
    [SerializeField] private float moveTime;
    private bool dirRight = true;
    private float timer;
    private PlayerController playerController;

    void Update()
    {
        if(dirRight)
        {
            transform.Translate(Vector2.right*speed*Time.deltaTime);
        }else
        {
            transform.Translate(Vector2.left*speed*Time.deltaTime);
        }
        timer += Time.deltaTime;
        if(timer >= moveTime)
        {
            dirRight = !dirRight;
            timer = 0f;
        }
    }
    
}
