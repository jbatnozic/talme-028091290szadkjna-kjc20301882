///HG_cell_set_type_dc(X, Y, Type, ChangeCval)
/*

 See Mercury's Manual, section "Worlds".

*/
var world;

world=global.HG_DEFAULT_WORLD;
cs=hg_world_get_attribute(world,"cellSize");

HG_cell_set_type(world,
                 HG_coord_to_grid(argument0,cs),
                 HG_coord_to_grid(argument1,cs),
                 argument2,argument3);
