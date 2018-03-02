///_rinv_collapse(Inventory ID, Skip Reserved)
/*
Note: Will not remap the inventory!
*/

var list = argument0,
    grid = list[|1],
    map  = list[|0],
    res  = list[|3];
    
var start = cpptern(argument1 == true, res, 0);

var ht = ds_grid_height(grid);

var temp = ds_grid_create(RINV_LOCAL.property_count, ht);

var t = 0;

// Copy reserved if required (if any)
if (start != 0) { 

  for (var i = 0; i < start; i += 1) {
  
    ds_grid_set_grid_region(temp, grid,
                            0, i, RINV_LOCAL.property_count - 1, i,
                            0, t);
                            
    t += 1;
  
    }

  }

// Copy other items:
for (var i = start; i < ht; i += 1) {

  if (grid[#RINV_LOCAL.static_id, i] != RINV_NULL.id) {
  
    ds_grid_set_grid_region(temp, grid,
                            0, i, RINV_LOCAL.property_count - 1, i,
                            0, t);
                            
    t += 1;
  
    }

  }
  
// Shrink to fit:
if (t != 0) {

  ds_grid_resize(temp, RINV_LOCAL.property_count, t);
  
  }
else {

  ds_grid_destroy(temp);
  
  temp = ds_grid_create(RINV_LOCAL.property_count, 0);

  }

// Cleanup and rebind:
ds_grid_destroy(grid);

list[|1] = temp;











