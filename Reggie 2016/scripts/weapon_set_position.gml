///weapon_set_position(RSpeed, Smoothness);
/*
THIS SCRIPT REGULATES THE WEAPON'S POSITION AND ANGLE.

argument0 - (Integer) Rotation speed of the weapon (usually about 15 is good, but this may
                      be decreased to simulate "heavy" weapons, or increased to simulate
                      "lighter" ones).
argument1 - (Integer) How smooth the rotation will be (about 80 is optimal).

Returns nothing.
*/

 x=(global.player_obj_id).x; //STUB
 y=(global.player_obj_id).y-10; 

var n,d,f;

if point_distance(x,y,mouse_x,mouse_y)>15 {

 //Needed angle:
 n=point_direction(x,y,mouse_x,mouse_y);
 
 //Angle difference:
 d=angle_difference(n,image_angle);
 
 //Speed coefficient:
 f=min(1,abs(d)/argument1);

 if d>0 image_angle+=argument0*f else image_angle-=argument0*f;

 if abs(d) <= 1 image_angle=n;
 
 //Angle correction:
 if image_angle>360 image_angle-=360;
 if image_angle<0   image_angle=360;

 }
