///hg_point_in_shape(X, Y, Shape, CellSize)
/*

 Underlying HG script.

*/
var xx,yy,cs;

xx=argument0;
yy=argument1;
cs=argument3;

switch (argument2) begin
  
 //Basic Slopes:
 case HG_SHAPE.slopeLeft:
  return yy>xx;
  
 case HG_SHAPE.slopeRight:
  return (cs-yy)<=xx; 
  
 case HG_SHAPE.slopeTopLeft:
  return (cs-yy)>xx;
 
 case HG_SHAPE.slopeTopRight:
  return yy<=xx;
  
 //Small Slopes:
 case HG_SHAPE.slopeSmLeft:
  return yy>(xx+cs)/2;
  
 case HG_SHAPE.slopeSmRight:
  return yy>cs-xx/2;
  
 case HG_SHAPE.slopeSmTopLeft:
  return yy<=(cs-xx)/2;
 
 case HG_SHAPE.slopeSmTopRight:
  return yy<=xx/2;
 
 //Basic Slabs: 
 case HG_SHAPE.slabBottom:
  return yy*2>cs;
  
 case HG_SHAPE.slabTop:
  return yy*2<=cs;
  
 case HG_SHAPE.slabLeft:
  return xx*2<=cs;
  
 case HG_SHAPE.slabRight:
  return xx*2>cs;
  
 //Elevated Slopes: 
 case HG_SHAPE.slopeSmElevLeft: 
  return yy>xx/2;
 
 case HG_SHAPE.slopeSmElevRight:
  return yy>(cs-xx)/2;
 
 case HG_SHAPE.slopeSmElevTopLeft: 
  return yy<=cs-xx/2;
 
 case HG_SHAPE.slopeSmElevTopRight:
  return yy<=(xx+cs)/2;
  
 //Basic Shapes:
 /*case HG_SHAPE.empty:
  return 0;
  
 case HG_SHAPE.full:
  return 1;*/
  
 case HG_SHAPE.circle:
  return point_distance(xx,yy,cs*0.5,cs*0.5)<=cs*0.5;
  
 default:
  return 0;
  
end;
