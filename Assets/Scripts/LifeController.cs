using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;


public class LifeController : MonoBehaviour
{
    [SerializeField] private Sprite fullHeart, emptyHeart;
    [SerializeField] private Image[] image;
    [SerializeField] private int life, maxLife;

    
    void Start()
    {
      this.life = maxLife;
      UpdateLifes();  
    }

    void UpdateLifes()
    {
        for(int i = 0;i<maxLife;i++)
        {
            if(i<life)
            {
                image[i].sprite= fullHeart;
            }
            else
            {
                image[i].sprite = emptyHeart;
            }
        }
    }
    public void LifeDown(int value)
    {
        life -= value;
        UpdateLifes();
        if(life<0)
        {
            life = 0;
        }
    }
    public bool isDead()
    {
        if(life<=0)
        
        {
            life = maxLife;
            UpdateLifes();
            return true;
        }
        else
        {
            return false;
        }
    }
}
