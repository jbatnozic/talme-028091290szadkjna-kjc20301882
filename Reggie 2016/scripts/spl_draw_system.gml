///spl_draw_surface(View X, View Y)
/*

*/
var surf;

if (!global.SPLAT_ENABLED) exit;

if ((global.SPLAT_TIMER mod 2)==0)
  surf=global.SPLAT_SURF_1;
  else 
    surf=global.SPLAT_SURF_2;

if (!surface_exists(surf)) exit;
    
draw_set_alpha(1);
draw_surface(surf,argument0,argument1);
