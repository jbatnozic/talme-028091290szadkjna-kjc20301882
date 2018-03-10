///rinv_initialize()
/*

*/

enum RINV_STATIC {

  name,
  type,
  rarity,
  weight,
  complex,
  objwe,
  objwd,
  desc,
  icon,
  
  property_count

  }
  
enum RINV_TYPE { // TEMP

  null = -1,

  any = 0,

  bulk       = 1,        
  weapon     = 2,
  consumable = 3,
  ammo       = 4,
  armour     = 5,
  special    = 6,

  }

global.rinv_def_grid = ds_grid_create(RINV_STATIC.property_count, 0);
global.rinv_def_map  = ds_map_create();

// Note: Position in the grid defines the item's Static ID

global.rinv_default_inst = noone;

// Define the "null" item:
rinv_define_item("__rinv_null_item__", RINV_TYPE.null, 0, 0, true, -1, -1, -1);

enum RINV_NULL {

  id = 0 // Static ID - It will always be 0

  }







