///HG_collision_point_fast(ColGrid, X, Y, CellSize)
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
   
 case HG_SHAPE.full:
   return true;
  break;
   
 default:
   xx=(argument[1] mod cs);
   yy=(argument[2] mod cs);
   if (hg_point_in_shape(xx,yy,shape,cs)=true)
    return true;
  break;
  
end; 

return false;
