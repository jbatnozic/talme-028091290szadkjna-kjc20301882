///HG_shadowcaster_set_angle(ShadowCaster, Angle)
/*

 See Mercury's Manual, page 22.

*/
var i,delta,list;

list=argument0;

if list[|3]=round(argument1) exit;

delta=-angle_difference(list[|3],round(argument1));

for (i=7; i<ds_list_size(list); i+=2) begin

 if is_string(list[|i]) {
   i-=1;   
   continue;
   }
   
 dist=point_distance(0,0,list[|i],list[|i+1]);
 dir=point_direction(0,0,list[|i],list[|i+1]);
 
 list[|i] = lengthdir_x(dist,dir+delta);
 list[|i+1]=lengthdir_y(dist,dir+delta);

end;

list[|3]=round(argument1);

hg_world_update_shadows(list[|0],list[|1],list[|2],false,list[|4]);
