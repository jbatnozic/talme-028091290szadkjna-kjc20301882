///spl_tick(View X, View Y)
/*

*/
var xx,yy,surf1,surf2,t;

if (!global.SPLAT_ENABLED) exit;

surf1=global.SPLAT_SURF_1;
surf2=global.SPLAT_SURF_2;

//Preparation:
if !surface_exists(surf1) {
  surf1=surface_create(GLOBAL.view_width,GLOBAL.view_height);  
  
  surface_set_target(surf1);
  draw_clear_alpha(c_black,0);
  surface_reset_target();
    
  global.SPLAT_SURF_1=surf1;  
  }
  
if !surface_exists(surf2) {
  surf2=surface_create(GLOBAL.view_width,GLOBAL.view_height);
  
  surface_set_target(surf1);
  draw_clear_alpha(c_black,0);
  surface_reset_target();
  
  global.SPLAT_SURF_2=surf2;  
  }

if !(surface_exists(surf1) and surface_exists(surf2)) exit;

if ((global.SPLAT_TIMER mod 2) == 0) {
  t=surf1;
  surf1=surf2;
  surf2=t;
  }

global.SPLAT_TIMER=((global.SPLAT_TIMER+1) mod global.SPLAT_SPEED);
  
//Drawing:
xx=(global.SPLAT_PREV_X-argument0);
yy=(global.SPLAT_PREV_Y-argument1);

global.SPLAT_PREV_X=argument0;
global.SPLAT_PREV_Y=argument1;

surface_set_target(surf1);

  //draw_clear_alpha(c_black,0);
  //draw_surface_ext(surf2,xx,yy,1,1,0,c_white,0.99);
  
  draw_clear_alpha(c_black,0);
  
  draw_set_blend_mode_ext(bm_one,bm_one);  
    draw_surface_ext(surf2,xx,yy,1,1,0,c_white,1-0.05*(global.SPLAT_TIMER==0));      
  draw_set_blend_mode(bm_normal);
  
surface_reset_target();





