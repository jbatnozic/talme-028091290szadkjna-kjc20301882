///rinv_destroy(Inventory ID)
/*

*/
var list = argument0;

ds_map_destroy(list[|0]);
ds_grid_destroy(list[|1]);

ds_list_destroy(list);
