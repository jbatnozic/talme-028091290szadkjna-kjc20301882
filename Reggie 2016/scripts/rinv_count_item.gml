///rinv_count_item(Inventory ID, Item Name)
/*

*/

if (argument0 == -1) argument0 = global.rinv_default_inst;

var list = argument0,
    grid = list[|1],
    map  = list[|0],
    name = argument1;
    
var static_id = rinv_item_get_static_id(name);
    
if (rinv_item_get_static_value(static_id, RINV_STATIC.complex) == false) { // Simple item
    
  if (ds_map_exists(map, name)) {
  
    var h = map[?name];
    
    return grid[#RINV_LOCAL.amount, h];
  
    }
  else {
  
    return 0;
  
    }
  
  }
else { // Complex item

  var cnt = 0, h = ds_grid_height(grid);
  
  for (var i = 0; i < h; i += 1) {
  
    if (grid[#RINV_LOCAL.static_id, i] == static_id) cnt += 1;
  
    }

  return cnt;
    
  }
