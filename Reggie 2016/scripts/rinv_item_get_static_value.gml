///rinv_item_get_static_value(Item Name/Static ID, [RINV_STATIC enum] value)
/*

*/

if (is_string(argument0)) argument0 = global.rinv_def_map[?argument0];

return global.rinv_def_grid[#argument1, argument0];
