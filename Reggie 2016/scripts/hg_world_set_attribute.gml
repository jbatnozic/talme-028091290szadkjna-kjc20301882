///hg_world_set_attribute(World, Attribute, Value);
gml_pragma("forceinline");
/*

 Underlying HG script.

*/
var map;

map=argument0[?"attri"];

map[?argument1]=argument2;
