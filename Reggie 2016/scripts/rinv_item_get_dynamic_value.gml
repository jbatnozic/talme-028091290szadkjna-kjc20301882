///rinv_item_get_dynamic_value(Inventory ID, Local Item ID, DynVal Index)
/*

*/

if (argument0 == -1) argument0 = global.rinv_default_inst;

var list = argument0,
    grid = list[|1];
    
var dvArray = grid[#RINV_LOCAL.dv_array, argument1];

return dvArray[argument2];
