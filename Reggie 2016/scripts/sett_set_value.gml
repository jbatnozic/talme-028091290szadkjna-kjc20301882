///sett_set_value(Key, Value)
/*

*/

if ds_map_exists(global.sett_map,argument0)
 ds_map_delete(global.sett_map,argument0);

ds_map_add(global.sett_map,argument0,argument1);
