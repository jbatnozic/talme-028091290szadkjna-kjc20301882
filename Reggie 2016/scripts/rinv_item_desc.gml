///rinv_item_desc(Name, Description)
/*
Add a description to an item type with the given name.
*/
var grid = global.rinv_def_grid;

var h = global.rinv_def_map[?argument0];

grid[#RINV_STATIC.desc, h] = argument1;
