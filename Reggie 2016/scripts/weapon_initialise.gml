///weapon_initialise()
/*
THIS SCRIPT SETS UP SOME BASIC VARIABLES FOR THE WEAPON'S BACKGROUND WORKINGS.

argument0 - (Integer) The weapon's object ID.

Returns nothing.
*/

//BASIC:
modes_available=0;
 
b_clipsize=1
b_reloadtime=2
b_readytime=1
b_jam=0.5
b_dur=100
 
//WEAPON SETUP:
x_offset=0;
y_offset=0;  

//AMMUNITION:
ammo_available=0;

//SPRITE:
index_rs=0;
index_re=0;
index_ss=0;
index_se=0;
index_rl=1;
  
//SOUND:
s_change=-1;
s_reload=-1;
s_empty=-1;

//OTHER: (These are some inner-mechanism variables and must not be changed)
reloading=0;
mode_current=1;
preparing=0;
refiring=0;
unload_counter=0;
reload_lock=false;
special_action=false;

//LOAD VARIABLES FROM ITEM:
patron=global.inventory_active;
//"patron" is the item's index in quick items.
xammo=inv_item_get_dynamic_value(patron,true,1);
ammo_current=inv_item_get_dynamic_value(patron,true,2);
xdur=inv_item_get_dynamic_value(patron,true,3);
b_state=inv_item_get_dynamic_value(patron,true,4);
reloading=inv_item_get_dynamic_value(patron,true,5);
