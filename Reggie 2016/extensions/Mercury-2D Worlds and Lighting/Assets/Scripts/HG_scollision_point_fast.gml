///HG_scollision_point_fast(ColGrid, X, Y, CellSize)
/*

 See Mercury's Manual, section "Collisions".

*/
var cs,gx,gy,xx,yy,grid;

grid=argument[0];

cs=argument[3];

gx=(argument[1] div cs);
gy=(argument[2] div cs);

var shape=grid[#gx,gy];

switch (shape) begin
  
 case HG_SHAPE.empty:
  break;
   
 default:
   return true;
  break;
  
end; 

return false;
