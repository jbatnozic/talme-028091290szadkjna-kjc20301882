///HG_shadowcaster_finalize(ShadowCaster, [OPT] Angle)
/*

 See Mercury's Manual, page 21.

*/
var list;

list=argument[0];
  
if argument_count=1
 hg_world_update_shadows(list[|0],list[|1],list[|2],false,list[|4])
 else {
  HG_shadowcaster_set_angle(list,argument[1]);
  if round(argument[1])=0
   hg_world_update_shadows(list[|0],list[|1],list[|2],false,list[|4]);
  }
