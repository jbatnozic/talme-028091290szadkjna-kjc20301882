///weapon_set_position(RSpeed, Smoothness);
/*
THIS SCRIPT REGULATES THE WEAPON'S POSITION AND ANGLE.

argument0 - (Integer) Rotation speed of the weapon (usually about 15 is good, but this may
                      be decreased to simulate "heavy" weapons, or increased to simulate
                      "lighter" ones).
argument1 - (Integer) How smooth the rotation will be (about 80 is optimal).

Returns nothing.
*/

//shoulder_x = (global.player_obj_id).x;
//shoulder_y = (global.player_obj_id).y + (global.player_obj_id)._weaponYOffset;

shoulder_x = (global.player_obj_id).sh_fx;
shoulder_y = (global.player_obj_id).sh_fy;
 
old_yscale = image_yscale;

if (mouse_x > shoulder_x)
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

if (point_distance(x,y,mouse_x,mouse_y) > 4) {

  //Needed angle:
  needed = point_direction(shoulder_x, shoulder_y, mouse_x, mouse_y);
  
  //Angle difference:
  diff = angle_difference(needed, image_angle);
  
  //Speed coefficient:
  fi = min(1,abs(diff)/argument1);
  
  if (diff > 0) image_angle+=argument0*fi else image_angle-=argument0*fi;
  
  if (abs(diff) <= 1) image_angle=needed;
  
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













