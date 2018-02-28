///rinv_item_set_dynamic_value(Inventory ID, Local Item ID, DynVal Index, New Value)
/*

*/

if (argument0 == -1) argument0 = global.rinv_default_inst;

var grid = argument0[|1];
    
var dvArray = grid[#RINV_LOCAL.dv_array, argument1];

dvArray[@argument2] = argument3;
