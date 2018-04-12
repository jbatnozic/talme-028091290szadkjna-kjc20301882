///rinv_item_set_amount(Inventory ID, Local Item ID, New Amount)
/*
NewAmount >= 1
Item must be simple
*/

if (argument0 == -1) argument0 = global.rinv_default_inst;

var grid = argument0[|1];
    
if (argument2 < 1) show_error("Can't set item amount to below 1!", true);

// Calc weight delta:
var iStaticId = grid[#RINV_LOCAL.static_id, argument1];

var wg_delta = (argument2 - grid[#RINV_LOCAL.amount, argument1]) *
               rinv_item_get_static_value(iStaticId, RINV_STATIC.weight);

// Set new amount:
grid[#RINV_LOCAL.amount, argument1] = argument2;
        
// Set new weight:
argument0[|2] += wg_delta; 
