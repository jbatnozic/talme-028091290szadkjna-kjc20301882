///spl_free()
/*

*/

if surface_exists(global.SPLAT_SURF_1) {

  surface_free(global.SPLAT_SURF_1);
  global.SPLAT_SURF_1=-4;

  }
  
if surface_exists(global.SPLAT_SURF_2) {

  surface_free(global.SPLAT_SURF_2);
  global.SPLAT_SURF_12=-4;

  }
