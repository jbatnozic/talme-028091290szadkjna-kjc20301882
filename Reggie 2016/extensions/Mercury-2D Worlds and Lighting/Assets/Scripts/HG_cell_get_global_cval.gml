///HG_cell_get_global_cval(World, X, Y, CvalIndex)
/*

 See Mercury's Manual, section "Worlds".

*/
var map,key,type;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;

map=global.HG_GCVAL_MAP;

type=ds_grid_get(argument0[?"index"],argument1,argument2);

key=string(type)+"_"+string(argument3);

if !ds_map_exists(map,key) {
 return undefined;
 }

return map[?key];
