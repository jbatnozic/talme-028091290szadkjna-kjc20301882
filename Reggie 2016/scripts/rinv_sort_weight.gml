///rinv_sort_weight(Inventory ID, Ascending, Skip Reserved)
/*
Note: Invalidates any returned Local IDs
*/

if (argument0 == -1) argument0 = global.rinv_default_inst;

var list = argument0,
    grid = list[|1],
    res  = list[|3];
    
var ht = ds_grid_height(grid);
    
if (argument2 == true) { // Ignore reserved slots

  if (ht == res) exit;
        
  var tg = ds_grid_create(RINV_LOCAL.property_count, ht - res);
  
  for (var i = res; i < ht; i += 1) {
  
    var static_id = grid[#RINV_LOCAL.static_id, i];
  
    var wg = rinv_item_get_static_value(static_id, RINV_STATIC.weight);
  
    tg[#RINV_LOCAL.static_id,   i - res] = static_id;
    tg[#RINV_LOCAL.amount,      i - res] = grid[#RINV_LOCAL.amount,    i];
    tg[#RINV_LOCAL.dv_array,    i - res] = grid[#RINV_LOCAL.dv_array,  i];
    tg[#RINV_LOCAL.sort_column, i - res] = grid[#RINV_LOCAL.amount,    i] * wg;
  
    }
    
  ds_grid_sort(tg, RINV_LOCAL.sort_column, argument1);
  
  for (var i = res; i < ht; i += 1) {
  
    grid[#RINV_LOCAL.static_id,   i] = tg[#RINV_LOCAL.static_id, i - res];
    grid[#RINV_LOCAL.amount,      i] = tg[#RINV_LOCAL.amount,    i - res];
    grid[#RINV_LOCAL.dv_array,    i] = tg[#RINV_LOCAL.dv_array,  i - res];
    grid[#RINV_LOCAL.sort_column, i] = undefined;
  
    }
    
  ds_grid_destroy(tg);
  
  }
else {

  for (var i = res; i < ht; i += 1) {
  
    var static_id = grid[#RINV_LOCAL.static_id, i];
  
    var wg = rinv_item_get_static_value(static_id, RINV_STATIC.weight);
  
    grid[#RINV_LOCAL.sort_column, i - res] = grid[#RINV_LOCAL.amount,    i] * wg;
  
    }
    
  ds_grid_sort(grid, RINV_LOCAL.sort_column, argument1);
  
  ds_grid_set_region(grid, RINV_LOCAL.sort_column, 0,
                           RINV_LOCAL.sort_column, ht - 1, undefined);

  }
  
_rinv_remap(list);
  
  
  
  
  
  
  
  
  
