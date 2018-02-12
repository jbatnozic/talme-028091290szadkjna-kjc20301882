///HG_cell_get_type(World, X, Y, String)
/*

 See Mercury's Manual, section "Worlds".

*/
var type;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;

type=ds_grid_get(argument0[?"index"],argument1,argument2);

if (argument3=true)
 type=hg_ds_map_find_key(global.HG_TYPE_MAP,type);
 
return type;
