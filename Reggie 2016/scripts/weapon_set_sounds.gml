///weapon_set_sounds(Change, Reloaded, Empty, Unload, Jam)
/*
THIS SCRIPT SETS THE BASIC SOUNDS FOR THE WEAPON.

NOTE: In this script -1 means "no sound".

argument0 - (Integer) The sound that is played when the ammo type or firing mode is changed.
argument1 - (Integer) The sound that is played when the weapon is reloaded.
argument2 - (Integer) The sound that is played when the player tries to shoot but there's no
                      ammo in the clip.
argument3 - (Integer) The sound that is played when the weapon's ammo is unloaded.
argument4 - (Integer) The sound that is played when the weapon jams.

Returns nothing.
*/

s_change=argument0;
s_reload=argument1;
s_empty=argument2;
s_unload=argument3;
s_jam=argument4;
