///hg_world_del_attribute(World, Attribute)
/*

 Underlying HG script.

*/
var map;

map=argument0[?"attri"];

return ds_map_delete(map,argument1);
