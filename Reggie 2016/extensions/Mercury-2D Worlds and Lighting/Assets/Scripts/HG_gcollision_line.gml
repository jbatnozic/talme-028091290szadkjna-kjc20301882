///HG_gcollision_line(World, Group, X1, Y1, X2, Y2, Precision)
/*

 See Mercury's Manual, section "Collisions".

*/
var i,t,dir,dis,cs,ww,wh,msin,mcos,grid,list;
var gx,gy,ogx,ogy,shape,xx,yy;

if argument0=-1
 argument0=global.HG_DEFAULT_WORLD;

if is_string(argument1)
 argument1=global.HG_COLGROUP_MAP[?argument1];

cs=hg_world_get_attribute(argument0,"cellSize");
ww=hg_world_get_attribute(argument0,"width")*cs;
wh=hg_world_get_attribute(argument0,"height")*cs;

grid=ds_map_find_value(argument0,"index");

argument2=clamp(argument2,0,ww-1);
argument3=clamp(argument3,0,wh-1);
argument4=clamp(argument4,0,ww-1);
argument5=clamp(argument5,0,wh-1);

dir=point_direction(argument2,argument3,argument4,argument5);
 msin=dsin(dir);
 mcos=dcos(dir);
dis=point_distance(argument2,argument3,argument4,argument5);

gx=-1;
gy=-1;

for (i=0; i<dis; i+=argument6) begin
  
 //*** Inline Collision point (modified):
  
 ogx=gx;
 ogy=gy;
  
 gx=((argument2+i*mcos) div cs);
 gy=((argument3-i*msin) div cs);  

 if (gx<>ogx or gy<>ogy) {
  list=grid[#gx,gy];  
  shape=list[|HG_TPROP.shape];
  }
    
 if ds_list_find_index(argument1,list)=-1 continue;
   
 switch (shape) begin
  
  case HG_SHAPE.empty:
   break;
   
  case HG_SHAPE.full:
    return true;
   break;
   
  default:
    xx=((argument2+i*mcos) mod cs);
    yy=((argument3-i*msin) mod cs);
    if (hg_point_in_shape(xx,yy,shape,cs)=true)
     return true;
   break;
  
 end; 
   
 //*** End inline;
                       
end;

return false;
