///_rinv_grid_size(Inventory ID)
/*

*/

if (argument0 == -1) argument0 = global.rinv_default_inst;

var grid = argument0[|1];

return ds_grid_height(grid);
