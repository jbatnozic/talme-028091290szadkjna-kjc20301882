///hg_world_get_attribute(World, Attribute)
gml_pragma("forceinline");
/*

 Underlying HG script.

*/
var map;

map=argument0[?"attri"];

return ds_map_find_value(map,argument1);
