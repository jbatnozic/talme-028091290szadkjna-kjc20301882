///hg_light_auto_activate_simple(LightList, ActiveList, DeactList, Index)
/*

 Underlying HG script.

*/
var list,act_list,dea_list;

list=argument0;
act_list=argument1;
dea_list=argument2;

ds_list_add(act_list,list);

ds_list_delete(dea_list,argument3);
