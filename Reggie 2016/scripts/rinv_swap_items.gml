///rinv_swap_items(Inventory ID, Local ID 1, Local ID 2)
/*

*/

if (argument1 == argument2) exit;

if (argument0 == -1) argument0 = global.rinv_default_inst;

var list = argument0,
    map  = list[|0],
    grid = list[|1];
    
var h1 = argument1, h2 = argument2;
    
var tStaticId, tAmount, tArray, tSortCol;

// Item 1 -> Temp
tStaticId = grid[#RINV_LOCAL.static_id,   h1];
tAmount   = grid[#RINV_LOCAL.amount,      h1];
tArray    = grid[#RINV_LOCAL.dv_array,    h1];
tSortCol  = grid[#RINV_LOCAL.sort_column, h1];

// Item 2 -> Item 1
grid[#RINV_LOCAL.static_id,   h1] = grid[#RINV_LOCAL.static_id,   h2];
grid[#RINV_LOCAL.amount,      h1] = grid[#RINV_LOCAL.amount,      h2];
grid[#RINV_LOCAL.dv_array,    h1] = grid[#RINV_LOCAL.dv_array,    h2];
grid[#RINV_LOCAL.sort_column, h1] = grid[#RINV_LOCAL.sort_column, h2];

// Temp -> Item 2
grid[#RINV_LOCAL.static_id,   h2] = tStaticId;
grid[#RINV_LOCAL.amount,      h2] = tAmount;
grid[#RINV_LOCAL.dv_array,    h2] = tArray;
grid[#RINV_LOCAL.sort_column, h2] = tSortCol;

// Remap:
var name1 = rinv_item_get_static_value(
              grid[#RINV_LOCAL.static_id, h1], RINV_STATIC.name);
              
var name2 = rinv_item_get_static_value(
              grid[#RINV_LOCAL.static_id, h2], RINV_STATIC.name);
              
if (ds_map_exists(map, name1))
  map[?name1] = h1;

if (ds_map_exists(map, name2))
  map[?name2] = h2;


  
  
  
  
  
