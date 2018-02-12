///HG_light_reset(World, Light, Sprite, Colour, Scale, Alpha)
/*

 See Mercury's Manual, page 19.

*/
var list;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;
  
list=argument1;
  
list[|HG_LPROP.sprite]=argument2;
list[|HG_LPROP.colour]=argument3;
list[|HG_LPROP.scale]=argument4;
list[|HG_LPROP.alpha]=argument5;

if surface_exists(list[|HG_LPROP.surf1])
 surface_free(list[|HG_LPROP.surf1]);

if surface_exists(list[|HG_LPROP.surf2])
 surface_free(list[|HG_LPROP.surf2]);

hg_light_update(list);
