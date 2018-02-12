///HG_gcollision_point(World, Group, X, Y, Secure, [OPT] CellSize)
/*

 See Mercury's Manual, section "Collisions".

*/
var cs,gx,gy,xx,yy,grid,list,grp;

 if argument[0]=-1
  argument[0]=global.HG_DEFAULT_WORLD;
  
if is_string(argument[1])
 grp=global.HG_COLGROUP_MAP[?argument[1]]
 else
  grp=argument[1];

if argument_count=5
 cs=hg_world_get_attribute(argument[0],"cellSize")
 else cs=argument[5];

gx=(argument[2] div cs);
gy=(argument[3] div cs);

grid=ds_map_find_value(argument[0],"index");

if argument[4]=false {

 var ww,wh;
 
 ww=hg_world_get_attribute(argument[0],"width");
 wh=hg_world_get_attribute(argument[0],"height");

 if !point_in_rectangle(gx,gy,0,0,ww,wh)
  return false;
 
 list=grid[#gx,gy];
  
 }
 else
  list=grid[#gx,gy];

if ds_list_find_index(grp,list)=-1
 return false;

var shape=list[|HG_TPROP.shape];

switch (shape) begin
  
   case HG_SHAPE.empty:
    break;
   
   case HG_SHAPE.full:
     return true;
    break;
   
   default:
     xx=(argument[2] mod cs);
     yy=(argument[3] mod cs);
     if (hg_point_in_shape(xx,yy,shape,cs)=true)
      return true;
    break;
  
  end; 

return false;
