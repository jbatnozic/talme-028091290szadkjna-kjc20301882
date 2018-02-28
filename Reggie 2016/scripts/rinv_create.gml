///rinv_create()
/*

*/

enum RINV_LOCAL {

  static_id,
  amount,
  dv_array,
  sort_column,
  
  property_count  

  }

var list = ds_list_create(),
    grid = ds_grid_create(RINV_LOCAL.property_count, 0),
    map  = ds_map_create();
    
list[|0] = map;
list[|1] = grid;
list[|2] = 0; // Total weight
list[|3] = 0; // Reserved slots
list[|4 + RINV_TYPE.any] = 0; // Item slot counters
list[|4 + RINV_TYPE.bulk] = 0;
list[|4 + RINV_TYPE.weapon] = 0;
list[|4 + RINV_TYPE.consumable] = 0;
list[|4 + RINV_TYPE.ammo] = 0;
list[|4 + RINV_TYPE.armour] = 0;

return list;
