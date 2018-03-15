///rinv_read(String)
/*
Creates a new inventory instantiation from the given string.
*/

var list = rinv_create(),
    grid = list[|1];
    
// Exctract [Reserved Slots] value:
var pos = string_pos(chr(31), argument0);

var resn = real(string_copy(argument0, 1, pos - 1));

argument0 = string_delete(argument0, 1, pos);
// ***    

ds_grid_read(grid, argument0);

var ht = ds_grid_height(grid);

for (var i = 0; i < ht; i += 1) {

  var static_id = rinv_item_get_static_id( grid[#RINV_LOCAL.static_id, i] );
                                        
  grid[#RINV_LOCAL.static_id, i] = static_id;

  var a = grid[#RINV_LOCAL.dv_array, i];
  
  if (is_string(a)) {
  
    grid[#RINV_LOCAL.dv_array, i] = _rinv_string_to_array(a);
  
    }
  
  }
  
_rinv_remap(list);

rinv_recalc_weight(list);
rinv_recount_slots(list);

rinv_reserve_slots(list, resn);

return list;







