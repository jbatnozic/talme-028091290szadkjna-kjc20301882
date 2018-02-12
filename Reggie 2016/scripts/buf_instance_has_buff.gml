///buf_instance_has_buff(Instance, Buff ID)
/*

*/
var grid;

grid=argument0.local_buff_grid;

return ds_grid_value_exists(grid,0,0,0,ds_grid_height(grid)-1,argument1);
