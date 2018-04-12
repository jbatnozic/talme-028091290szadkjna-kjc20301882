///rinv_reserve_slots(Inventory ID, # Of Slots)
/*

The first N reserved slots are:
  - Not subject to sorting, unless required
  - Just marked as empty rather than collapsed if there's nothing in them
  - Not modified by rinv_add_* funcions, unless required

*/

if (argument0 == -1) argument0 = global.rinv_default_inst;

argument0[|3] = argument1;

var grid = argument0[|1];

while (ds_grid_height(grid) < argument1) {

  rinv_add_empty_slot(argument0);

  }
