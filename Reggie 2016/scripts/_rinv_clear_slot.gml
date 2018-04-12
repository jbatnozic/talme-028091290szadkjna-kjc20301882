///_rinv_clear_slot(Inventory ID, Local ID)
/*

*/

var list = argument0,
    grid = list[|1],
    map  = list[|0];
    
var h = argument1;
    
var iStaticId = grid[#RINV_LOCAL.static_id, h];

var iComplex = rinv_item_get_static_value(iStaticId, RINV_STATIC.complex);

if (iComplex == true) {

  list[|2] -= rinv_item_get_static_value(iStaticId, RINV_STATIC.weight);

  }
else {

  list[|2] -= grid[#RINV_LOCAL.amount, h] *
              rinv_item_get_static_value(iStaticId, RINV_STATIC.weight);

  var iName = rinv_item_get_static_value(grid[#RINV_LOCAL.static_id, h], RINV_STATIC.name);
  
  ds_map_delete(map, iName);
             
  }

grid[#RINV_LOCAL.static_id,   h] = RINV_NULL.id;
grid[#RINV_LOCAL.amount,      h] = undefined;
grid[#RINV_LOCAL.dv_array,    h] = undefined;
grid[#RINV_LOCAL.sort_column, h] = undefined;














