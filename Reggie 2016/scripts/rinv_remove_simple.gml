///rinv_remove_simple(Inventory ID, Item Name, Amount)
/*
Note: The script will just remove all items of the given type if
      there aren't enough.
Returns: Number of actually removed items.
*/

if (argument0 == -1) argument0 = global.rinv_default_inst;

var list = argument0,
    grid = list[|1],
    map  = list[|0],
    name = argument1;
    
if (!ds_map_exists(map, name)) exit;
    
var h  = map[?name], 
    ca = grid[#RINV_LOCAL.amount, h];
    
if (ca > argument2) {
  
  grid[#RINV_LOCAL.amount, h] -= argument2;
  
  list[|2] -= argument2 * rinv_item_get_static_value(name, RINV_STATIC.weight);
  
  return argument2;
  
  }
else {

  _rinv_clear_slot(argument0, h);
  
  list[|2] -= ca * rinv_item_get_static_value(name, RINV_STATIC.weight);
  
  var type = rinv_item_get_static_value(name, RINV_STATIC.type);
  
  list[|4 + RINV_TYPE.any] -= 1;
  list[|4 + type] -= 1;
  
  return ca;
  
  }
