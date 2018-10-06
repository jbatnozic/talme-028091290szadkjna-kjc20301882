///wpn_local_set_position(Sh_Fx, Sh_Fy, Tar_x, Tar_y);
/*
THIS SCRIPT REGULATES THE WEAPON'S POSITION AND ANGLE.

argument0 - (Real)    Shoulder (front) X coordinate;

argument1 - (Real)    Shoulder (front) Y coordinate;

argument2 - (Real)    Target X coordinate;

argument3 - (Real)    Target Y coordinate;

Returns: void

Output variables:
    fore_hand_x (absolute coordinate)
    fore_hand_y (absolute coordinate)
    back_hand_x (absolute coordinate)
    back_hand_y (absolute coordinate)
    
*/

shoulder_x = argument0;
shoulder_y = argument1;

var tar_x  = argument2, tar_y  = argument3;
 
old_yscale = image_yscale;

if (tar_x > shoulder_x)
  image_yscale = +1;
else
  image_yscale = -1;

// Temp:
if (image_yscale * old_yscale == -1 && 
    sign(shoulder_x - x) == image_yscale) {
    
    x += 2 * (shoulder_x - x);
    
    image_angle = point_direction(shoulder_x, shoulder_y, x, y);
    
    }
  
// Angle:
var needed, diff, fi;

if (point_distance(x, y, tar_x, tar_y) > 4) {

  //Needed angle:
  needed = point_direction(shoulder_x, shoulder_y, tar_x, tar_y);
  
  //Angle difference:
  diff = angle_difference(needed, image_angle);
  
  //Speed coefficient:
  fi = min(1, abs(diff) / b_smoothness);
  
  if (diff > 0)
    image_angle += b_rspeed * fi;
  else
    image_angle -= b_rspeed * fi;
  
  if (abs(diff) <= 1) image_angle = needed;
  
  //Angle correction:
  if (image_angle > 360) image_angle -= 360;
  if (image_angle < 0)   image_angle += 360;
  
  }
  
// X, Y:
var a = xy_rotated(x_offset, y_offset * image_yscale, image_angle);

x = shoulder_x + a[0];
y = shoulder_y + a[1];

// Hand positions:
var a = xy_rotated(fore_hand_xoff, fore_hand_yoff * image_yscale, image_angle);

fore_hand_x = x + a[0];
fore_hand_y = y + a[1];

var a = xy_rotated(back_hand_xoff, back_hand_yoff * image_yscale, image_angle);

back_hand_x = x + a[0];
back_hand_y = y + a[1];












