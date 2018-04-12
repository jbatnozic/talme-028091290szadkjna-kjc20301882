///weapon_update_patron()
/*
THIS SCRIPT UPDATES THE WEAPON'S PATRON ITEM.

Returns nothing.
*/
var a;

if (patron == -1) exit;

a[0] = WPTRN.xammo;
a[1] = WPTRN.ammo_curr;
a[2] = WPTRN.xdur;
a[3] = WPTRN.state;
a[4] = WPTRN.is_reloading;

rinv_item_set_dynamic_value(-1, patron, a[0], xammo);
rinv_item_set_dynamic_value(-1, patron, a[1], ammo_current);
rinv_item_set_dynamic_value(-1, patron, a[2], xdur);
rinv_item_set_dynamic_value(-1, patron, a[3], b_state);
rinv_item_set_dynamic_value(-1, patron, a[4], reloading);
