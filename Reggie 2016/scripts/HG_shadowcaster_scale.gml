///HG_shadowcaster_scale(ShadowCaster, Multiplier)
/*

 See Mercury's Manual, page 22.

*/
var i,list;

list=argument0;

for (i=7; i<ds_list_size(list); i+=2) begin

 if is_string(list[|i]) {
   i-=1;   
   continue;
   }
 
 list[|i] *= argument1;
 list[|i+1]*=argument1;

end;

list[|4]*=argument1;

hg_world_update_shadows(list[|0],list[|1],list[|2],false,list[|4]);
