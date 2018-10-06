///wpn_instance_create(X, Y, InventoryId, PatronIndex)
/*

*/

var __inv = argument2, __pid = argument3;

if (rinv_item_is_null(__inv, __pid)) return noone;
    //show_error("wpn_instance_create() - Error 1", true);
    
var static_id = rinv_local_to_static(__inv, __pid);
    
if (rinv_item_get_static_value(static_id, RINV_STATIC.type) != RINV_TYPE.weapon) return noone;
    //show_error("wpn_instance_create() - Error 2", true);
    
var obj_id = rinv_item_get_static_value(static_id, RINV_STATIC.objwe);
    
obj_id -= RINV_OBJ(0);

var son = instance_create(argument0, argument1, obj_id);

with (son) {

    my_inventory    = __inv;
    patron_item_ind = __pid;
    
    if (my_inventory != -1 && patron_item_ind != -1) {
    
        xammo        = rinv_item_get_dynamic_value(my_inventory, patron_item_ind, WPTRN.xammo);
        ammo_current = rinv_item_get_dynamic_value(my_inventory, patron_item_ind, WPTRN.ammo_curr);
        xdur         = rinv_item_get_dynamic_value(my_inventory, patron_item_ind, WPTRN.xdur);
        b_state      = rinv_item_get_dynamic_value(my_inventory, patron_item_ind, WPTRN.state);
        reloading    = rinv_item_get_dynamic_value(my_inventory, patron_item_ind, WPTRN.reloading_cnt);
    
        }
    else {
    
        xammo        = b_clipsize;
        ammo_current = 0;
        xdur         = b_dur;
        b_state      = 0;
        reloading    = 0;
    
        }

  }
  
return son;
