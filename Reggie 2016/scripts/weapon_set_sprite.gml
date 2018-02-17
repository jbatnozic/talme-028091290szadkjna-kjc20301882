///weapon_set_sprite(Index, ReadyStart, ReadyEnd, FireStart, FireEnd, Reloading)
/*
THIS SCRIPT SETS THE SPRITE PARAMETERS FOR THE WEAPON.

NOTE:In the following text, frame=image_index.

argument0 - (Integer) The weapon's sprite index.
argument1 - (Integer) The first frame of the preparing animation (as in gatling guns), if
                      the weapon doesn't have prepare time, this value doesn't matter.
argument2 - (Integer) The last frame of the preparing animation (as in gatling guns), if
                      the weapon doesn't have prepare time, this value doesn't matter.
argument3 - (Integer) The first frame of the shooting animation (as in gatling guns); if
                      the weapon isn't animated, the following argument will have the
                      same value as this one.
argument4 - (Integer) The last frame of the shooting animation (if any).
argument5 - (Integer) Frame of the sprite which is displayed when the weapon is reloading.

Returns nothing.
*/

sprite_index=argument0;
index_rs=argument1;
index_re=argument2;
index_ss=argument3;
index_se=argument4;
index_rl=argument5;
