///HG_light_turn_on(World, Light, Type)
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

//Turn on:
var lq,w,s;

lq=hg_world_get_attribute(argument0,"lightQuality");

w=sprite_get_width(list[|HG_LPROP.sprite]);
s=list[|HG_LPROP.scale];

list[|HG_LPROP.surf1]=hg_create_surface(w*lq*s,w*lq*s);
list[|HG_LPROP.surf2]=hg_create_surface(w*lq*s,w*lq*s);

list[|HG_LPROP.turnedoff]=false;

ds_list_add(act_list,list);

ds_list_delete(dea_list, ds_list_find_index(dea_list,list) );
