///weapon_add_firing_mode(Name, RateOfFire, Automatic, Recoil, Scatter)
/*
THIS SCRIPT ADDS ANOTHER FIRING MODE TO THE WEAPON.

NOTE: A weapon must have at least one firing mode!

argument0 - (String)  Name of the firing mode.
argument1 - (Integer) Rate of fire of the new mode (time, in steps, inbetween shots).
argument2 - (Integer) Whether this mode is automatic (0=No, 1=Yes).
argument3 - (Integer) The weapon's recoil in this mode (this is how much the weapon
                      "goes up", in degrees, when it's fired).  
argument4 - (Integer) How much can the projectiles diverge from their ideal trajectory
                      angle, in degrees.

Returns nothing.
*/

modes_available+=1;
 
fm_name[modes_available]=argument0;
b_tbs[modes_available]=argument1;
b_automatic[modes_available]=argument2;
b_recoil[modes_available]=argument3;
bl_scatter[modes_available]=argument4;
