///HG_light_draw_quick(World, X, Y, Sprite, Colour, Scale, Angle, Alpha)
/*

 See Mercury's Manual, page 19.

*/
var grid,c_h;

 if argument0=-1
  argument0=global.HG_DEFAULT_WORLD;

grid=hg_world_get_attribute(argument0,"lightGridQuick");

c_h=ds_grid_height(grid);

ds_grid_resize(grid,ds_grid_width(grid),c_h+1);

grid[#0,c_h]=argument1;
grid[#1,c_h]=argument2;
grid[#2,c_h]=argument3;
grid[#3,c_h]=argument4;
grid[#4,c_h]=argument5;
grid[#5,c_h]=argument6;
grid[#6,c_h]=argument7;
