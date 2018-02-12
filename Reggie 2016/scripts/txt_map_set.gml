///txt_map_set(Key, Value)
/*

*/

if ds_map_exists(global.textbox_map,argument0)
 ds_map_delete(global.textbox_map,argument0);
 
global.textbox_map[?argument0]=argument1;
