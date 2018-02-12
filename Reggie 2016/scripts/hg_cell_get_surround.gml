///hg_cell_get_surround(World, X, Y)
/*

 Underlying HG script.

*/
var grid,a=0;

grid=argument0[?"index"];

//Checking right:
if argument1=hg_world_get_attribute(argument0,"width")-1
or hg_shape_is_full_left(ds_list_find_value(grid[#argument1+1,argument2],HG_TPROP.shape))
 a+=1;
 
//Checking up:
if argument2=0
or hg_shape_is_full_bottom(ds_list_find_value(grid[#argument1,argument2-1],HG_TPROP.shape))
 a+=10;
 
//Checking left:
if argument1=0
or hg_shape_is_full_right(ds_list_find_value(grid[#argument1-1,argument2],HG_TPROP.shape))
 a+=100;
 
//Checking down:
if argument2=hg_world_get_attribute(argument0,"height")-1
or hg_shape_is_full_top(ds_list_find_value(grid[#argument1,argument2+1],HG_TPROP.shape))
 a+=1000;
 
return a;
