///rinv_item_is_null(Inventory ID, Local Item ID)
/*

*/

if (argument0 == -1) argument0 = global.rinv_default_inst;

var grid = argument0[|1];

return (grid[#RINV_LOCAL.static_id, argument1] == RINV_NULL.id);
