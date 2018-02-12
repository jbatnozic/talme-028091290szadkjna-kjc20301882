///repair_item_defined_a(Name, Potency)
/*
NOTE: For armour.
*/

if ds_map_exists(global.repair_map_a,argument0)=false
 return false;
 
if global.repair_map_a[?argument0]>=argument1 return true;

return false;
