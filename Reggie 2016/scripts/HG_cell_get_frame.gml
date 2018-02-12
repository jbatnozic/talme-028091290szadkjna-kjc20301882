///HG_cell_get_frame(World, X, Y)
/*

 See Mercury's Manual, section "Worlds".

*/
var;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;

return ds_grid_get(argument0[?"anims"],argument1,argument2);
