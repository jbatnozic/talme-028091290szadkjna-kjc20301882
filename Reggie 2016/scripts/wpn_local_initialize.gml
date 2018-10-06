///wpn_local_initialize(InventoryId, ItemIndex)
/*
THIS SCRIPT SETS UP SOME BASIC VARIABLES FOR THE WEAPON'S BACKGROUND WORKINGS.

Returns nothing.
*/

//INVENTORY:
my_inventory    = 999999;
patron_item_ind = -1;

//BASIC:
modes_available = 0;
 
b_clipsize = 1;
b_reloadtime = 2;
b_readytime = 1;
b_jam = 0.5;
b_dur = 100;
 
//POSITION AND OFFSETS:
shoulder_x = 0;
shoulder_y = 0;

x_offset = 0;
y_offset = 0;

fore_hand_xoff = 0;
fore_hand_yoff = 0;
back_hand_xoff = 0;
back_hand_yoff = 0;

fore_hand_x = 0;
fore_hand_y = 0;
back_hand_x = 0;
back_hand_y = 0;

bullet_xoff = 0;
bullet_yoff = 0;

//AMMUNITION:
ammo_available = 0;
ammo_current   = 0;

//SPRITE:
index_rs = 0;
index_re = 0;
index_ss = 0;
index_se = 0;
index_rl = 1;
  
//SOUND:
s_change = -1;
s_reload = -1;
s_empty  = -1;

//OTHER: (These are some inner-mechanism variables and must not be changed)
reloading      = 0;
mode_current   = 0;
preparing      = 0;
refiring       = 0;
unload_counter = 0;
reload_lock    = false;
old_yscale     = 0;
image_speed    = 0;
