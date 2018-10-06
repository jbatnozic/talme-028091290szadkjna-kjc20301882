///wpn_sys_get_amt_cnt(WeaponItemName)
/*
THIS SCRIPT FETCHES THE NUMBER OF AMMO TYPES OF PASSED WEAPON.

argument0 - (String)  Item name.

Returns
*/

var map = global.wpn_sys_property_map;
var key = argument0 + "_amt_cnt";

if (ds_map_exists(map, key)) {

  return map[?key];

  }
else {

  var wp_obj = rinv_item_get_static_value(argument0, RINV_STATIC.objwe);
  
  wp_obj -= (RINV_OBJ(wp_obj) - wp_obj);
  
  //var son = wpn_instance_create(0, 0, wp_obj, -1, -1);
  var son = instance_create(0, 0, wp_obj);
  
  var rv = son.ammo_available;
  
  remove(son);
  
  map[?key] = rv;
  
  return rv;
  
  }
