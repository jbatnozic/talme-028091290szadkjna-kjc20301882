///wpn_local_set_basics(ClipSize, ReloadTime, PreparingTime, JamChance, MaxDurability, ProjectileType, RotSpeed, Smoothness)
/*
THIS SCRIPT PROVIDES THE WEAPON OBJECT WITH SOME BASIC VARIABLES FOR ITS MECHANISM.

argument0 - (Integer) Clip size.
argument1 - (Integer) Reload time (in steps).
argument2 - (Integer) The time (in steps) the weapon needs to prepare for shooting (like
                      in gatling guns).
argument3 - (Integer) Chance to jam per % durability missing below 75% (A negative value
                      means the weapon will never jam).
argument4 - (Integer) The maximum durability of the weapon.
argument5 - (Integer) Projectile type (Enumerated: PROJECTILE.bullet/rocket/flame/grenade).

argument6 - (Integer) Rotation speed of the weapon (usually about 15 is good, but this may
                      be decreased to simulate "heavy" weapons, or increased to simulate
                      "lighter" ones).
                      
argument7 - (Integer) How smooth the rotation will be (about 80 is optimal).

Returns nothing.
*/

b_clipsize   = argument0;
b_reloadtime = argument1 + 1;   //Always add 1 to the actual value
b_readytime  = argument2;
b_jam        = argument3;
b_dur        = argument4;
b_projobj    = wpn_get_projobj(argument5);
b_rspeed     = argument6;
b_smoothness = argument7;

