///HG_cell_get_cval(World, X, Y, CvalIndex)
/*

 See Mercury's Manual, section "Worlds".

*/
var map,key;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;

map=argument0[?"custv"];
key=string(argument1)+"_"+string(argument2)+"_"+string(argument3);

if !ds_map_exists(map,key) {
 return undefined;
 }

return map[?key];
