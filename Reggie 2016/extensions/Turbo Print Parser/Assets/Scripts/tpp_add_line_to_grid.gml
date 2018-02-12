///tpp_add_line_to_grid(Grid, String, Width, Height, Padding)
/*

Underlying TPP script:
  Adds a new line to a ds_grid of parsed text.

NOTES:
  --
  
Returns: n/a

*/
var g,work_str,w,h,c_h,pad;

g=argument0;
work_str=argument1;
w=argument2;
h=argument3;
pad=argument4;

c_h=ds_grid_height(g);
ds_grid_resize(g,ds_grid_width(g),c_h+1);

g[#0,c_h]=work_str;
g[#1,c_h]=w;
g[#2,c_h]=round(h);
g[#3,c_h]=pad;
