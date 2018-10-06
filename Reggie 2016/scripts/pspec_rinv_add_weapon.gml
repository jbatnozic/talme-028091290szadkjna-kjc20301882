///pspec_rinv_add_weapon(Inventory ID, ItemName, [0..1] xAmmo, AmmoTypeCurr, [0..1] xDur)
/*
Returns: Local ID of inserted item.
*/

var __name = argument1;

var a;

a[WPTRN.xammo]     = round(wpn_sys_get_max_ammo(__name) * argument2);
a[WPTRN.ammo_curr] = argument3;
a[WPTRN.xdur]      = round(wpn_sys_get_max_dur(__name)  * argument4);
a[WPTRN.state]     = WPN_STATE.Regular;

a[WPTRN.reloading_cnt] = 0;

return rinv_add_complex_arr(argument0, __name, a);
