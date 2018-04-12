///rinv_write(Inventory ID)
/*
Returns a string that can be turned into an inventory instantiation using rinv_read().
*/

if (argument0 == -1) argument0 = global.rinv_default_inst;

_rinv_collapse(argument0, true);
_rinv_remap(argument0);

var list = argument0,
    grid = list[|1];

var ht = ds_grid_height(grid);

var i, rv;

for (i = 0; i < ht; i += 1) {

  var iName = rinv_item_get_static_value( grid[#RINV_LOCAL.static_id, i]
                                        , RINV_STATIC.name);
                                        
  grid[#RINV_LOCAL.static_id, i] = iName;
  
  var a = grid[#RINV_LOCAL.dv_array, i];
  
  if (is_array(a)) {
  
    grid[#RINV_LOCAL.dv_array, i] = _rinv_array_to_string(a);
  
    }

  }
  
rv = ds_grid_write(grid);

for (i = 0; i < ht; i += 1) {

  var static_id = rinv_item_get_static_id( grid[#RINV_LOCAL.static_id, i] );
                                        
  grid[#RINV_LOCAL.static_id, i] = static_id;

  var a = grid[#RINV_LOCAL.dv_array, i];
  
  if (is_string(a)) {
  
    grid[#RINV_LOCAL.dv_array, i] = _rinv_string_to_array(a);
  
    }
  
  }
  
return string(list[|3]) + chr(31) + rv;





