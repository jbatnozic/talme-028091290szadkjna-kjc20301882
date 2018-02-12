///hg_light_free_all_surfaces(World)
/*

 Underlying HG script.

*/
var i,world_list,list;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;
  
//Static:
world_list=hg_world_get_attribute(argument0,"lightListStatic");
for (i=0; i<ds_list_size(world_list); i+=1) begin
 
 list=world_list[|i];
 
 if surface_exists(list[|HG_LPROP.surf1])
  surface_free(list[|HG_LPROP.surf1]);

end;
 
//Dynamic: 
world_list=hg_world_get_attribute(argument0,"lightListDynamic");
for (i=0; i<ds_list_size(world_list); i+=1) begin
 
 list=world_list[|i];

 if surface_exists(list[|HG_LPROP.surf1])
  surface_free(list[|HG_LPROP.surf1]);
  
  if surface_exists(list[|HG_LPROP.surf2])
  surface_free(list[|HG_LPROP.surf2]);

end;
