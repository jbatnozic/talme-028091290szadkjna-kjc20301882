///HG_light_destroy_general(World, Light)
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
ds_list_destroy(argument1);

//Remove from the world's registry:

 //If Static:
 list=hg_world_get_attribute(argument0,"lightListStatic");
 pos=ds_list_find_index(list,light);
 if pos<>-1 {
  ds_list_delete(light,pos);
  exit;
  }
  
 //If Static (Turned Off):
 list=hg_world_get_attribute(argument0,"lightListDeactStatic");
 pos=ds_list_find_index(list,light);
 if pos<>-1 {
  ds_list_delete(light,pos);
  exit;
  }
 
 //If Dynamic:
 list=hg_world_get_attribute(argument0,"lightListDynamic");
 pos=ds_list_find_index(list,light);
 if pos<>-1 {
  ds_list_delete(light,pos);
  exit;
  }
  
 //If Dynamic (Turned Fff):
 list=hg_world_get_attribute(argument0,"lightListDeactDynamic");
 pos=ds_list_find_index(list,light);
 if pos<>-1 {
  ds_list_delete(light,pos);
  exit;
  }
 
 //If Simple:
 list=hg_world_get_attribute(argument0,"lightListSimple");
 pos=ds_list_find_index(list,light);
 if pos<>-1 {
  ds_list_delete(light,pos);
  exit;
  }
  
 //If Simple (Turned Off):
 list=hg_world_get_attribute(argument0,"lightListDeactSimple");
 pos=ds_list_find_index(list,light);
 if pos<>-1 {
  ds_list_delete(light,pos);
  exit;
  }
