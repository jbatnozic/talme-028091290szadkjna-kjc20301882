///HG_shadowcaster_create(World, X, Y, Colour, Alpha)
/*

 See Mercury's Manual, page 20.

*/
var list,world_list;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;
  
list=ds_list_create();

ds_list_add(list,argument0,argument1,argument2,0,0,argument3,argument4);
              // World, X, Y, Angle, Radius, Colour, Alpha

world_list=hg_world_get_attribute(argument0,"shadowCasters");

ds_list_add(world_list,list);

return list;
