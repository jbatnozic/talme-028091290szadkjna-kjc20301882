///weapon_set_sprite(Index, ReadyStart, ReadyEnd, FireStart, FireEnd, Reloading, X offset, Y offset)
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
argument6 - (Integer) X offset - The distance (in pixels, in the weapon's sprite) between
                      the X coordinate of the sprite origin and the X coordinate of the
                      end of the barrel.
argument7 - (Integer) Y offset - The distance (in pixels, in the weapon's sprite) between
                      the Y coordinate of the sprite origin and the Y coordinate of the
                      end of the barrel.

Returns nothing.
*/

sprite_index=argument0;
index_rs=argument1;
index_re=argument2;
index_ss=argument3;
index_se=argument4;
index_rl=argument5;
x_offset=argument6;
y_offset=argument7;
