///HG_shadowcaster_duplicate(ShadowCaster, X, Y, Angle)
/*

 See Mercury's Manual, page 22.

*/
var list,world_list;

list=ds_list_create();

ds_list_copy(list,argument1);

world_list=hg_world_get_attribute(argument0,"shadowCasters");

ds_list_add(world_list,list);

list[|1]=argument1;
list[|2]=argument2;

if round(argument3)<>list[|3]
 HG_shadowcaster_set_angle(list,round(argument3))
 else
  hg_world_update_shadows(list[|0],list[|1],list[|2],false,list[|4]);

return list;
