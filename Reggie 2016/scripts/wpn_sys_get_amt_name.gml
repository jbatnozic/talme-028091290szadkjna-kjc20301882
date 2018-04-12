///wpn_sys_get_amt_name(WeaponItemName, AmmoTypeIndex)
/*

*/

var map = global.wpn_sys_property_map;
var key = argument0 + "_amt_name_" + string(argument1);

if (ds_map_exists(map, key)) {

  return map[?key];

  }
else {

  var wp_obj = rinv_item_get_static_value(argument0, RINV_STATIC.objwe);
  
  wp_obj -= (RINV_OBJ(wp_obj) - wp_obj);
  
  var son = weapon_create(0, 0, wp_obj, -1);

  var rv = son.bl_name[argument1];
  
  remove(son);
  
  map[?key] = rv;
  
  return rv;
  
  }
