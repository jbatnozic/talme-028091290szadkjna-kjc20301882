///HG_shadowcaster_add_vertex(ShadowCaster, VertexRelativeX, VertexRelativeY)
/*

 See Mercury's Manual, page 21.

*/
var r;

r=argument0[|4];

ds_list_add(argument0,argument1,argument2);

if point_distance(0,0,argument1,argument2)>r
 argument0[|4]=point_distance(0,0,argument1,argument2);
