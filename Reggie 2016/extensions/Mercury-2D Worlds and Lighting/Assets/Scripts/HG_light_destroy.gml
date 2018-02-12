///HG_light_destroy(World, Light, Type)
/*

 See Mercury's Manual, page 19.

*/
var pos,list,light;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;

light=argument1;

//If not simple, free surfaces:
if ds_list_size(light)>6 {

 if surface_exists(light[|HG_LPROP.surf1])
  surface_free(light[|HG_LPROP.surf1]);
  
 if surface_exists(light[|HG_LPROP.surf2])
  surface_free(light[|HG_LPROP.surf2]);

 }
 
//Destroy list:
ds_list_destroy(light);

//Remove from the world's registry:
switch (argument2) begin

 case HG_LTYPE.static:
   list=hg_world_get_attribute(argument0,"lightListStatic");
   pos=ds_list_find_index(list,light);
   if pos<>-1
    ds_list_delete(list,pos)
    else {
     list=hg_world_get_attribute(argument0,"lightListDeactStatic");
     pos=ds_list_find_index(list,light);
     ds_list_delete(list,pos);
     }
  break;
 
 case HG_LTYPE.dynamic:
   list=hg_world_get_attribute(argument0,"lightListDynamic");
   pos=ds_list_find_index(list,light);
   if pos<>-1
    ds_list_delete(list,pos)
    else {
     list=hg_world_get_attribute(argument0,"lightListDeactDynamic");
     pos=ds_list_find_index(list,light);
     ds_list_delete(list,pos);
     }
  break;
  
 case HG_LTYPE.simple:
   list=hg_world_get_attribute(argument0,"lightListSimple");
   pos=ds_list_find_index(list,light);
   if pos<>-1
    ds_list_delete(list,pos)
    else {
     list=hg_world_get_attribute(argument0,"lightListDeactSimple");
     pos=ds_list_find_index(list,light);
     ds_list_delete(list,pos);
     }
  break;
  
 default:
  break;
  
end;
