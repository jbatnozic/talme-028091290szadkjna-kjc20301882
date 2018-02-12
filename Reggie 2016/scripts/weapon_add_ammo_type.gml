///weapon_add_ammo_type(Name, Speed, Sprite, Damage, BlNumber, DRLoss, ExScale, ExSprite, Knock, DoT, DoTtype, Arc, FSpr, FInt, Sound);
/*
THIS SCRIPT ADDS ANOTHER AMMO TYPE WHICH THE WEAPON CAN USE.

NOTE: The weapon must have at least one usable ammo type!

argument0 - (String)  The name of the inventory item which is used as this ammo.
argument1 - (Integer) The projectile's speed (in pixels per step).
argument2 - (Integer) The sprite of the projectile.
argument3 - (Integer) The damage of the rpojectile.
argument4 - (Integer) The number of bullets generated per shot (for a weapon such as a shotgun).
argument5 - (Integer) How much durability loss the weapon suffers per shot.
argument6 - (Integer) Explosion image / sprite scale (-1 if the projectile doesn't explode).
argument7 - (Integer) Explosion sprite (-1 if the projectile doesn't explode).
argument8 - (Integer) Knockback of the projectile itself, or of the explosion if the
                      projectile is explosive.
argument9 - (Integer) Damage over time (0 if none, duh).
argument10 - (Integer) Type of the Damage over time effect.
argument11 - (Integer) Firing arc lobbed projectiles (0 if the projectile isn't lobbed,
                       a negative value would make the projectile rise over time, like a
                       flame would). 
argument12 - (Integer) Sprite index of the muzzle flash (-1 if there's no muzzle flash).
argument13 - (Integer) Light intensity of the muzzle flash (doesn't matter if there is no
                       muzzle flash). 
argument14 - (Integer) The sound that is played when the weapon fires this ammo type.

Returns nothing.
*/

ammo_available+=1;

//Basic:
bl_name[ammo_available]=argument0;
bl_speed[ammo_available]=argument1;
bl_sprite[ammo_available]=argument2;
bl_damage[ammo_available]=argument3;
bl_number[ammo_available]=argument4;
 
//Duration loss:
bl_durloss[ammo_available]=argument5;
 
//Explosion:
bl_expradius[ammo_available]=argument6;
bl_expsprite[ammo_available]=argument7;
 
//Knockback:
bl_knockback[ammo_available]=argument8;
 
//Damage over time:
bl_dot[ammo_available]=argument9;
bl_dot_type[ammo_available]=argument10;
 
//Arc:
bl_arc[ammo_available]=argument11;
 
//Muzzle flash:
bl_flashsprite[ammo_available]=argument12;
bl_flashint[ammo_available]=argument13;
 
//Sound:
bl_firesound[ammo_available]=argument14;
