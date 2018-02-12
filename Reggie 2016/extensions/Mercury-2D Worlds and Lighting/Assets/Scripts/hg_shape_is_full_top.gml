///hg_shape_is_full_top(Shape)
/*

 Underlying HG script.

*/

switch (argument0) begin

 case HG_SHAPE.full:
   return true;
  break;
  
 case HG_SHAPE.slopeTopLeft:
   return true;
  break;
  
 case HG_SHAPE.slopeTopRight:
   return true;
  break;
  
 case HG_SHAPE.slabTop:
   return true;
  break;

 case HG_SHAPE.slopeSmTopRight:
   return true;
  break;
 
 case HG_SHAPE.slopeSmTopLeft:
   return true;
  break;   
  
 case HG_SHAPE.slopeSmElevTopLeft:
   return true;
  break;   
 
 case HG_SHAPE.slopeSmElevTopRight:
   return true;
  break;   
  
 default:
   return false;
  break;

end;
