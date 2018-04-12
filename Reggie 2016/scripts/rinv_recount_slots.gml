///rinv_recount_slots(Inventory ID)
/*

*/

if (argument0 == -1) argument0 = global.rinv_default_inst;

var list = argument0,
    grid = list[|1];
    
list[|4 + RINV_TYPE.any] = 0;
list[|4 + RINV_TYPE.bulk] = 0;
list[|4 + RINV_TYPE.weapon] = 0;
list[|4 + RINV_TYPE.consumable] = 0;
list[|4 + RINV_TYPE.ammo] = 0;
list[|4 + RINV_TYPE.armour] = 0;
list[|4 + RINV_TYPE.special] = 0;
    
var ht = ds_grid_height(grid);

for (var i = 0; i < ht; i += 1) {

  var static_id = grid[#RINV_LOCAL.static_id, i];
  
  if (static_id == RINV_NULL.id) continue;
  
  var type = rinv_item_get_static_value(static_id, RINV_STATIC.type); 
  
  var amount = grid[#RINV_LOCAL.amount, i];
  
  list[|4 + RINV_TYPE.any] += amount;
  list[|4 + type] += amount;

  }

