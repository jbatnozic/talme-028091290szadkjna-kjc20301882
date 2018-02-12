///hg_shape_is_full_bottom(Shape)
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
  
 case HG_SHAPE.slopeRight:
   return true;
  break;
  
 case HG_SHAPE.slabBottom:
   return true;
  break;

 case HG_SHAPE.slopeSmRight:
   return true;
  break;
 
 case HG_SHAPE.slopeSmLeft:
   return true;
  break;  
  
 case HG_SHAPE.slopeSmElevLeft:
   return true;
  break;   
 
 case HG_SHAPE.slopeSmElevRight:
   return true;
  break;   
  
 default:
   return false;
  break;

end;
