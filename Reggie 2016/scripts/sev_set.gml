///sev_set(EventID, New value)
/*

*/

if ds_map_exists(global.sev_map,argument0)
 ds_map_delete(global.sev_map,argument0);
 
global.sev_map[?argument0]=argument1;
