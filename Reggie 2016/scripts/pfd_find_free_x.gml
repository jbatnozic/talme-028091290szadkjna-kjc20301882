///pfd_find_free_x(Current X, Current Y, Search radius)
/*

*/
var i,v,size;

size=global.pfd_size;

v=argument1 div size;

for (i=0; i<=argument2; i+=1) begin

 if mp_grid_get_cell(global.pfd_grid,(argument0+i) div size,v)=0
  return argument0+i;
  
 if i<>0 and mp_grid_get_cell(global.pfd_grid,(argument0-i) div size,v)=0
  return argument0-i;

end;

return argument0;
