///wpn_sys_get_max_ammo(WeaponItemName)
/*
THIS SCRIPT FETCHES THE CLIP SIZE OF THE INDICATED WEAPON.

argument0 - (String)  Item name.

Returns - Clip size of the indicated weapon.
*/

var map = global.wpn_sys_property_map;
var key = argument0 + "_max_ammo";

if (ds_map_exists(map, key)) {

  return map[?key];

  }
else {

  var wp_obj = rinv_item_get_static_value(argument0, RINV_STATIC.objwe);
  
  var son = weapon_create(0, 0, wp_obj, -1);

  var rv = son.b_clipsize;
  
  remove(son);
  
  map[?key] = rv;
  
  return rv;
  
  }
