///HG_collision_point(World, X, Y, Secure, [OPT] CellSize)
/*

 See Mercury's Manual, section "Collisions".

*/
var cs,gx,gy,xx,yy,grid,list;

 if argument[0]=-1
  argument[0]=global.HG_DEFAULT_WORLD;

if argument_count=4
 cs=hg_world_get_attribute(argument[0],"cellSize")
 else cs=argument[4];

gx=(argument[1] div cs);
gy=(argument[2] div cs);

grid=hg_world_get_attribute(argument[0],"colGrid");

if argument[3]=false {

 var ww,wh;
 
 ww=hg_world_get_attribute(argument[0],"width");
 wh=hg_world_get_attribute(argument[0],"height");

 if !point_in_rectangle(gx,gy,0,0,ww,wh)
  return false;
  
 }

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
