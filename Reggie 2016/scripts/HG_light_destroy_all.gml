///HG_light_destroy_all(World, Static, Dynamic, Quick, StaticOff, DynamicOff, SimpleOff)
/*

 See Mercury's Manual, page 20.

*/
var world_list;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;
  
if (argument1=true) {

 world_list=hg_world_get_attribute(argument0,"lightListStatic");
 while (ds_list_size(world_list)>0) begin
 
  HG_light_destroy(argument0,world_list[|0],HG_LTYPE.static);

 end;
 
 }
 
if (argument2=true) {

 world_list=hg_world_get_attribute(argument0,"lightListDynamic");
 while (ds_list_size(world_list)>0) begin
 
  HG_light_destroy(argument0,world_list[|0],HG_LTYPE.dynamic);

 end;
 
 }
 
if (argument3=true) {

 world_list=hg_world_get_attribute(argument0,"lightListSimple");
 while (ds_list_size(world_list)>0) begin
 
  HG_light_destroy(argument0,world_list[|0],HG_LTYPE.simple);

 end;
 
 }
 
if (argument4=true) {

 world_list=hg_world_get_attribute(argument0,"lightListDeactStatic");
 while (ds_list_size(world_list)>0) begin
 
  HG_light_destroy(argument0,world_list[|0],HG_LTYPE.static);

 end;
 
 }
 
if (argument5=true) {

 world_list=hg_world_get_attribute(argument0,"lightListDeactDynamic");
 while (ds_list_size(world_list)>0) begin
 
  HG_light_destroy(argument0,world_list[|0],HG_LTYPE.dynamic);

 end;
 
 }
 
if (argument6=true) {

 world_list=hg_world_get_attribute(argument0,"lightListDeactSimple");
 while (ds_list_size(world_list)>0) begin
 
  HG_light_destroy(argument0,world_list[|0],HG_LTYPE.simple);

 end;
 
 }
