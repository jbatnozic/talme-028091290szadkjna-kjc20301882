///HG_light_set_colour(World, Light, Colour, Alpha)
/*

 See Mercury's Manual, page 19.

*/
var list;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;
  
list=argument1;

list[|HG_LPROP.colour]=argument2;
list[|HG_LPROP.alpha]=argument3;

hg_light_update(list);
