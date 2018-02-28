///rinv_local_to_static(Inventory ID, Local ID)
/*

*/

if (argument0 == -1) argument0 = global.rinv_default_inst;

var grid = argument0[|1];
    
return grid[#RINV_LOCAL.static_id, argument1];
