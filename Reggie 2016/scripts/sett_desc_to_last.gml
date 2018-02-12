///sett_desc_to_last(Description)
/*
Sets a description for the last defined setting.
*/
var c_h;

c_h=ds_grid_height(global.sett_grid);

global.sett_grid[#3,c_h-1]=argument0;
