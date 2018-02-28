///rinv_item_desc_to_last(Description)
/*
Add a description to the last defined item.
*/
var grid = global.rinv_def_grid;

var h = ds_grid_height(grid);

grid[#RINV_STATIC.desc, h - 1] = argument0;
