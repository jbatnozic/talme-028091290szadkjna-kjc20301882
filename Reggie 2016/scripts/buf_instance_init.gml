///buf_instance_init()
/*
Initiates the buff system for the calling instance, making it able to receive buffs.

No arguments.

Returns nothing.
*/

local_buff_grid=ds_grid_create(2,0);
local_buff_counter=0;

//Modifiers:
mod_speed=1;
mod_jump=1;

mod_acc=1;
mod_sta=0; //+
mod_hp=0;  //+
mod_rel=1;
mod_dr=1;

mod_carryw=1;
mod_kbrs=1;

mod_streg=1;
mod_hac=1;

mod_abs=1;

//Particle efects: (More can be added)
eff_fire=0;
eff_acid=0;
eff_poison=0;
eff_bleed=0;
