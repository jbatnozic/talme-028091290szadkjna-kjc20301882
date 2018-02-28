///rinv_add_simple(Inventory ID, Item Name, Amount)
/*
Returns: Local ID of the added item.
*/

if (argument0 == -1) argument0 = global.rinv_default_inst;

var list = argument0,
    grid = list[|1],
    map  = list[|0],
    name = argument1;
    
var h = 0;
    
if (ds_map_exists(map, name)) {

  h = map[?name];
  
  grid[#RINV_LOCAL.amount, h] += argument2;

  }
else {

  h = ds_grid_height(grid);
  
  ds_grid_resize(grid, RINV_LOCAL.property_count, h + 1);
  
  var static_id = global.rinv_def_map[?name];
  
  grid[#RINV_LOCAL.static_id,   h] = static_id;
  grid[#RINV_LOCAL.amount,      h] = argument2;
  grid[#RINV_LOCAL.dv_array,    h] = undefined;
  grid[#RINV_LOCAL.sort_column, h] = undefined;

  map[?name] = h;
  
  // Adjust slot counters:
  var type = rinv_item_get_static_value(static_id, RINV_STATIC.type);
  
  list[|4 + RINV_TYPE.any] += 1;
  list[|4 + type] += 1;
  
  }
  
// Adjust weight:
list[|2] += argument2 * rinv_item_get_static_value(name, RINV_STATIC.weight);

return h;
