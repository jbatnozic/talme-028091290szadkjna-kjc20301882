///rinv_recalc_weight(Inventory ID)
/*

*/

if (argument0 == -1) argument0 = global.rinv_default_inst;

var list = argument0,
    grid = list[|1];
    
var wg = 0;

var ht = ds_grid_height(grid);

for (var i = 0; i < ht; i += 1) {

  var static_id = grid[#RINV_LOCAL.static_id, i];
  
  var amount = grid[#RINV_LOCAL.amount, i];
  
  wg += amount * rinv_item_get_static_value(static_id, RINV_STATIC.weight);

  }
  
list[|2] = wg;
  
  
  
  
