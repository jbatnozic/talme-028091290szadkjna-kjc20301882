///HG_light_set_position(World, Light, X, Y, Angle)
/*

 See Mercury's Manual, page 19.

*/
var lq,list;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;

lq=hg_world_get_attribute(argument0,"lightQuality");

argument2=round(argument2*lq)/lq;
argument3=round(argument3*lq)/lq;
argument4=round(argument4);

list=argument1;

if (list[|HG_LPROP.xPos]<>argument2 or 
    list[|HG_LPROP.yPos]<>argument3 or
    list[|HG_LPROP.angle]<>argument4) {
    
 list[|HG_LPROP.xPos]=argument2;
 list[|HG_LPROP.yPos]=argument3;
 list[|HG_LPROP.angle]=argument4;
 
 hg_light_update(list);
 
 }
 
//*TEMP*
//hg_light_update(list);
