///hg_light_auto_deactivate(LightList, ActiveList, DeactList, Index)
/*

 Underlying HG script.

*/
var list,act_list,dea_list;

list=argument0;
act_list=argument1;
dea_list=argument2;

if surface_exists(list[|HG_LPROP.surf1])
 surface_free(list[|HG_LPROP.surf1]);
  
if surface_exists(list[|HG_LPROP.surf2])
 surface_free(list[|HG_LPROP.surf2]);
 
list[|HG_LPROP.update]=true;
 
ds_list_add(dea_list,list);

ds_list_delete(act_list,argument3);
