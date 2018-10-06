///wpn_sys_initialize()
/*

*/

enum WPN_STATE {

    Regular = 0,
    Reloading = 1,
    Unloaded = 2,
    Disabled = 3

    }

enum WPTRN {

  xammo          = 0,
  ammo_curr      = 1,
  xdur           = 2,
  state          = 3,
  reloading_cnt  = 4

  }

global.wpn_sys_property_map = ds_map_create();
