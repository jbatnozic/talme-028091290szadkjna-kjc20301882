///HG_cell_set_frame(World, X, Y, Frame)
/*

 See Mercury's Manual, section "Worlds".

*/
var;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;

ds_grid_set(argument0[?"anims"],argument1,argument2,argument3);
