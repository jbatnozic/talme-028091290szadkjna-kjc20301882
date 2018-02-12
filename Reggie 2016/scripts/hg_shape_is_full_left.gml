///hg_shape_is_full_left(Shape)
/*

 Underlying HG script.

*/

switch (argument0) begin

 case HG_SHAPE.full:
   return true;
  break;
  
 case HG_SHAPE.slopeLeft:
   return true;
  break;
  
 case HG_SHAPE.slopeTopLeft:
   return true;
  break;
  
 case HG_SHAPE.slabLeft:
   return true;
  break;

 case HG_SHAPE.slopeSmElevLeft:
   return true;
  break;   
 
 case HG_SHAPE.slopeSmElevTopLeft:
   return true;
  break;   

 default:
   return false;
  break;

end;
