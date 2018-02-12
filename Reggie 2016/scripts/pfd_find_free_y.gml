///pfd_find_free_y(Current X, Current Y, Search radius)
/*

*/
var i,h,size;

size=global.pfd_size;

h=argument0 div size;

for (i=0; i<=argument2; i+=1) begin

 if mp_grid_get_cell(global.pfd_grid,h,(argument1+i) div size)=0
  return argument1+i;
  
 if i<>0 and mp_grid_get_cell(global.pfd_grid,h,(argument1-i) div size)=0
  return argument1-i;

end;

return argument1;
