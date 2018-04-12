///rinv_refresh(Inventory ID, Skip Reserved)
/*

*/

if (argument0 == -1) argument0 = global.rinv_default_inst;

_rinv_collapse(argument0, argument1);
_rinv_remap(argument0);
