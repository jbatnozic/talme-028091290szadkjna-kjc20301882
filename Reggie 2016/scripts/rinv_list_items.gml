///rinv_list_items(Inventory ID, Type, Start From, Amount, Skip, Target Array)
/*
Note: argument4 = reference to a 2D array in which to place the result.
      The array will contain Static IDs (row 0), relevant Local IDs (row 1),
      and amounts (row 2).
      
Returns: Number of found elements.
*/

if (argument0 == -1) argument0 = global.rinv_default_inst;

var list = argument0,
    grid = list[|1],
    type = argument1,
    skip = argument4;
    
var ht = ds_grid_height(grid);

var found_cnt = 0;

for (var i = argument2; i < ht; i += 1) {

  var iType = rinv_item_get_static_value(grid[#RINV_LOCAL.static_id, i], RINV_STATIC.type);

  if ((type == iType || type == RINV_TYPE.any) && (iType != RINV_TYPE.null)) {
    
    if (skip > 0) {
    
      skip -= 1;
    
      }
    else {
    
      argument5[@found_cnt, 0] = grid[#RINV_LOCAL.static_id, i];
      argument5[@found_cnt, 1] = i; // Local ID
      argument5[@found_cnt, 2] = grid[#RINV_LOCAL.amount, i];
      
      found_cnt += 1;
      
      if (found_cnt == argument3) break;
    
      } 
                                                           
    }

  }
  
return found_cnt;

