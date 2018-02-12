///HG_cell_set_cval(World, X, Y, CvalIndex, Value)
/*

 See Mercury's Manual, section "Worlds".

*/
var map;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;

map=argument0[?"custv"];

map[?string(argument1)+"_"+string(argument2)+"_"+string(argument3)]=argument4;
