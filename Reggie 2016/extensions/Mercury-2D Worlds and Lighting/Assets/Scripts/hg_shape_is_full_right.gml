///hg_shape_is_full_right(Shape)
/*

 Underlying HG script.

*/

switch (argument0) begin

 case HG_SHAPE.full:
   return true;
  break;
  
 case HG_SHAPE.slopeRight:
   return true;
  break;
  
 case HG_SHAPE.slopeTopRight:
   return true;
  break;
  
 case HG_SHAPE.slabRight:
   return true;
  break;

 case HG_SHAPE.slopeSmElevRight:
   return true;
  break;   
 
 case HG_SHAPE.slopeSmElevTopRight:
   return true;
  break;   

 default:
   return false;
  break;

end;
