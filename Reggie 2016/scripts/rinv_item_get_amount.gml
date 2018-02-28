///rinv_item_get_amount(Inventory ID, Local Item ID)
/*

*/

if (argument0 == -1) argument0 = global.rinv_default_inst;

var grid = argument0[|1];
    
return grid[#RINV_LOCAL.amount, argument1];
