///rinv_item_set_amount(Inventory ID, Local Item ID, New Amount)
/*

*/

if (argument0 == -1) argument0 = global.rinv_default_inst;

var grid = argument0[|1];
    
grid[#RINV_LOCAL.amount, argument1] = argument2;
