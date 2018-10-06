///wpn_local_update_patron()
/*
THIS SCRIPT UPDATES THE WEAPON'S PATRON ITEM.

Returns: void
*/
var a;

if (patron_item_ind == -1) exit;

a[0] = WPTRN.xammo;
a[1] = WPTRN.ammo_curr;
a[2] = WPTRN.xdur;
a[3] = WPTRN.state;
a[4] = WPTRN.reloading_cnt;

rinv_item_set_dynamic_value(my_inventory, patron_item_ind, a[0], xammo);
rinv_item_set_dynamic_value(my_inventory, patron_item_ind, a[1], ammo_current);
rinv_item_set_dynamic_value(my_inventory, patron_item_ind, a[2], xdur);
rinv_item_set_dynamic_value(my_inventory, patron_item_ind, a[3], b_state);
rinv_item_set_dynamic_value(my_inventory, patron_item_ind, a[4], reloading);
