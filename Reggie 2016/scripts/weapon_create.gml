///weapon_create(X, Y, Object, Patron ID)
/*
Note: Always uses default inventory.
*/

var son = instance_create(argument0, argument1, argument2);

with (son) {

  if (argument3 != -1) {
  
    patron = argument3;
    
    xammo        = rinv_item_get_dynamic_value(-1, patron, WPTRN.xammo);
    ammo_current = rinv_item_get_dynamic_value(-1, patron, WPTRN.ammo_curr);
    xdur         = rinv_item_get_dynamic_value(-1, patron, WPTRN.xdur);
    b_state      = rinv_item_get_dynamic_value(-1, patron, WPTRN.state);
    reloading    = rinv_item_get_dynamic_value(-1, patron, WPTRN.is_reloading);
  
    }
  else {
  
    patron = -1;
    
    xammo        = b_clipsize;
    ammo_current = 1;
    xdur         = b_dur;
    b_state      = 0;
    reloading    = false;
  
    }

  }
  
return son;
