///snd_initialize()
/*

*/

enum SND_IND {
    
      destroyer  
    , footstep
    , machinegun

    }
    
global.SND_ARRAY[SND_IND.destroyer]  = sound0_DestroyerFire;
global.SND_ARRAY[SND_IND.footstep]   = SND_NULL;
global.SND_ARRAY[SND_IND.machinegun] = SND_NULL;

/////////////////////////////////////////////////
global.SND_LISTENER_X = 0;
global.SND_LISTENER_Y = 0;

audio_listener_orientation(0, 0, 1000, 0, -1, 0);

enum SND_CONFIG {

      falloff_ref = 50
    , falloff_max = 600

    }

// audio_falloff_set_model(audio_falloff_inverse_distance);
audio_falloff_set_model(audio_falloff_linear_distance);
