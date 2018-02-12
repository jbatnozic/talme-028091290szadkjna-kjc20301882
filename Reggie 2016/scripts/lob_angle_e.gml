///lob_angle_e(x1,y1,x2,y2,e);
/*
Empiric formula.
*/
var d;

if argument2<argument0 {
 
 d=point_direction(argument0,argument1,argument2,argument3);
 d-=abs(angle_difference(d,90))*argument4;
  
 }
 else {
  
  d=point_direction(argument0,argument1,argument2,argument3);
  d+=abs(angle_difference(d,90))*argument4;
  
  }
   
return d;
