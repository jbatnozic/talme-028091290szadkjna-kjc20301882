///weapon_update()
/*
THIS SCRIPT UPDATES THE WEAPON'S PATRON ITEM.


Returns nothing.
*/

inv_item_set_dynamic_value(patron,true,1,xammo);
inv_item_set_dynamic_value(patron,true,2,ammo_current);
inv_item_set_dynamic_value(patron,true,3,xdur);
inv_item_set_dynamic_value(patron,true,4,b_state);
inv_item_set_dynamic_value(patron,true,5,reloading);
