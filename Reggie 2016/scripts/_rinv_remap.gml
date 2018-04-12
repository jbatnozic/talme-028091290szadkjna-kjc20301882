///_rinv_remap(Inventory ID)
/*

*/

var list = argument0,
    grid = list[|1],
    map  = list[|0];

var ht = ds_grid_height(grid);
        
ds_map_clear(map);

for (var i = 0; i < ht; i += 1) {

  var static_id = grid[#RINV_LOCAL.static_id, i];

  if (rinv_item_get_static_value(static_id, RINV_STATIC.complex) == false) {
  
    var iname = rinv_item_get_static_value(static_id, RINV_STATIC.name);
    
    map[?iname] = i;
  
    }

  }
