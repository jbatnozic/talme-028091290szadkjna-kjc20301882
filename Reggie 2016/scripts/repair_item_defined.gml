///repair_item_defined(Name, Potency)
/*

*/

if ds_map_exists(global.repair_map,argument0)=false
 return false;
 
if global.repair_map[?argument0]>=argument1 return true;

return false;
