///hg_light_auto_deactivate_simple(LightList, ActiveList, DeactList, Index)
/*

 Underlying HG script.

*/
var list,act_list,dea_list;

list=argument0;
act_list=argument1;
dea_list=argument2;
 
ds_list_add(dea_list,list);

ds_list_delete(act_list,argument3);
