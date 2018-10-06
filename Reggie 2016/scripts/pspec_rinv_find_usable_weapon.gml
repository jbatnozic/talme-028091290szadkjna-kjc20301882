///pspec_rinv_find_usable_weapon(Inventory ID)
/*
Returns Local ID of a usable weapon in the inventory if successful, -1 otherwise.
*/

var __inv = argument0;

var __item_arr;
__item_arr[0,0] = RINV_NULL.id;

rinv_list_items(__inv, RINV_TYPE.any, 0, -1, 0, __item_arr);
  
var i;
for (i = 0; i < array_height_2d(__item_arr); i += 1) {

    if (rinv_item_get_static_value(__item_arr[i, 0], RINV_STATIC.type) != RINV_TYPE.weapon)
        continue;
        
    if (rinv_item_get_dynamic_value(__inv, __item_arr[i, 1], WPTRN.xdur) == 0) 
        continue;
        
    if (rinv_item_get_dynamic_value(__inv, __item_arr[i, 1], WPTRN.xammo) > 0)
        return i;
        
    var __wpn_name = rinv_item_get_static_value(__item_arr[i, 0], RINV_STATIC.name);
        
    var __loop_max = wpn_sys_get_amt_cnt(__wpn_name);
    for (var t = 0; t < __loop_max; t += 1) {
    
        if (rinv_count_item(__inv, wpn_sys_get_amt_name(__wpn_name, t)) > 0) {
            rinv_item_set_dynamic_value(__inv, i, WPTRN.ammo_curr, t);
            return i;
            }
    
        }

    }
    
return -1;
