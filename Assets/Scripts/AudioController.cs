using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class AudioController : MonoBehaviour
{
    public static AudioController instance = null;
[SerializeField] AudioSource audioPlayerJump, audioPlayerHurt, audioPlayerWin;
    public void Start()
    {
       instance = this; 
    }

    public void PlayAudioJump()
    {
        audioPlayerJump.Play();

    }
    public void PlayAudioHurt()
    {
        audioPlayerHurt.Play();
    }
    public void PlayAudioWin()
    {
        audioPlayerWin.Play();
    }
}
