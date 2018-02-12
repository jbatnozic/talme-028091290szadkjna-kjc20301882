///hg_light_auto_activate(LightList, ActiveList, DeactList, LightQuality, Index)
/*

 Underlying HG script.

*/
var list,act_list,dea_list,lq,w,s;

list=argument0;
act_list=argument1;
dea_list=argument2;

lq=argument3;

w=sprite_get_width(list[|HG_LPROP.sprite]);
s=list[|HG_LPROP.scale];

list[|HG_LPROP.surf1]=hg_create_surface(w*lq*s,w*lq*s);
list[|HG_LPROP.surf2]=hg_create_surface(w*lq*s,w*lq*s);

ds_list_add(act_list,list);

ds_list_delete(dea_list,argument4);
