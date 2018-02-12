///HG_shadowcaster_destroy_all(World)
/*

 See Mercury's Manual, page 21.

*/
var i,world_list;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;
  
//Active:
world_list=hg_world_get_attribute(argument0,"shadowCasters");

while (ds_list_size(world_list)>0) begin
 
 HG_shadowcaster_destroy(world_list[|0]);

end;

//Inactive:
world_list=hg_world_get_attribute(argument0,"shadowCastersDeact");

while (ds_list_size(world_list)>0) begin
 
 HG_shadowcaster_destroy(world_list[|0]);

end;
