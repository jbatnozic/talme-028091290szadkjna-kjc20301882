///HG_light_turn_off(World, Light, Type)
/*

 See Mercury's Manual, page 20.

*/
var list,act_list,dea_list;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;
  
list=argument1;
  
//Find lists:
switch (argument2) begin

 case HG_LTYPE.dynamic:
   act_list=hg_world_get_attribute(argument0,"lightListDynamic");
   dea_list=hg_world_get_attribute(argument0,"lightListDeactDynamic");
  break;
 
 case HG_LTYPE.static:
   act_list=hg_world_get_attribute(argument0,"lightListStatic");
   dea_list=hg_world_get_attribute(argument0,"lightListDeactStatic");
  break;
 
 case HG_LTYPE.simple:
   act_list=hg_world_get_attribute(argument0,"lightListSimple");
   dea_list=hg_world_get_attribute(argument0,"lightListDeactSimple");
  break;
 
 default:
  break;

end;

//Turn off:
if surface_exists(list[|HG_LPROP.surf1])
 surface_free(list[|HG_LPROP.surf2]);
  
if surface_exists(list[|HG_LPROP.surf1])
 surface_free(list[|HG_LPROP.surf2]);
 
list[|HG_LPROP.update]=true;
list[|HG_LPROP.turnedoff]=true;
 
ds_list_add(dea_list,list);

ds_list_delete(act_list, ds_list_find_index(act_list,list) );
