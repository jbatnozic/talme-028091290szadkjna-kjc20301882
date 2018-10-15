///snd_play_at([SND_IND enum] Sound, X, Y, Loop, Priority)
/*
Returns: Sound index.
*/

return
audio_play_sound_at( global.SND_ARRAY[argument0]
                   , argument1
                   , argument2
                   , 0 /* z */
                   , SND_CONFIG.falloff_ref
                   , SND_CONFIG.falloff_max
                   , 1
                   , argument3
                   , argument4
                   ) ;
