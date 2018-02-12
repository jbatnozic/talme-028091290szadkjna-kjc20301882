///HG_shadowcaster_destroy(ShadowCaster)
/*

 See Mercury's Manual, page 21.

*/
var list,world_list;
  
list=argument0;

//Turned on:
world_list=hg_world_get_attribute(list[|0],"shadowCasters");

if ds_list_find_index(world_list,list)<>-1 {

 ds_list_delete(world_list,ds_list_find_index(world_list,list));
 hg_world_update_shadows(list[|0],list[|1],list[|2],false,list[|4]);
 ds_list_destroy(list);
 exit;

 }
 
//Turned off:
world_list=hg_world_get_attribute(list[|0],"shadowCastersDeact");

if ds_list_find_index(world_list,list)<>-1 {

 ds_list_delete(world_list,ds_list_find_index(world_list,list));
 ds_list_destroy(list);
 exit;

 }
