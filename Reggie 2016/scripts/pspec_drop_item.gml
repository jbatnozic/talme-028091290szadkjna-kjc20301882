///pspec_drop_item(Inventory ID, Local ID, X, Y)
/*

*/

if (argument0 == -1) argument0 = global.rinv_default_inst;

var static_id = rinv_local_to_static(argument0, argument1);

var obj = rinv_item_get_static_value(static_id, RINV_STATIC.objwd);

if (obj == -1) exit;

if (obj >= RINV_OBJ(0)) {

  obj -= RINV_OBJ(0);

  var son = instance_create(argument2, argument3, obj);

  son.init_inv_id    = argument0;
  son.init_local_id  = argument1;
  son.init_static_id = static_id;
  son.init_amount    = 1;
  
  with (son) {
  
    event_user(ev_pickup_init);
  
    }
  
  }
else {

  var son = instance_create(argument2, argument3, obj_pickup_item);

  son.init_inv_id    = argument0;
  son.init_local_id  = argument1;
  son.init_static_id = static_id;
  son.init_amount    = 1;
  
  with (son) {
  
    event_user(ev_pickup_init);
  
    }
  
  }

//Remove the item used if needed:
var amnt = rinv_item_get_amount(argument0, argument1);

if (amnt > 1) {

  rinv_item_set_amount(argument0, argument1, amnt - 1);

  }
else {

  _rinv_clear_slot(argument0, argument1);

  }
