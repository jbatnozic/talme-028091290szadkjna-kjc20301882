///rinv_item_get_dynamic_arr(Inventory ID, Local Item ID)
/*

*/

if (argument0 == -1) argument0 = global.rinv_default_inst;

var list = argument0,
    grid = list[|1];
    
return grid[#RINV_LOCAL.dv_array, argument1];
