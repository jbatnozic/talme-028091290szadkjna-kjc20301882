///weapon_set_basics(ClipSize, ReloadTime, PreparingTime, JamChance, MaxDurability, ProjectileType)
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

Returns nothing.
*/

b_clipsize=argument0;
b_reloadtime=argument1+1;   //Always add 1 to the actual value
b_readytime=argument2;
b_jam=argument3;
b_dur=argument4;
b_projobj=projectile_get_object(argument5);
