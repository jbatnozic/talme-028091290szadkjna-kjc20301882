///draw_arm(X1, Y1, X2, Y2, L1, L2, Spr1, Spr2, Facing [-1,1], colour)
/*

*/
//Set up start and finish:
var sx=argument0,
    sy=argument1,
    fx=argument2,
    fy=argument3;

//Set up direction and distance:
var dist,dir,length1,length2;

dir=point_direction(sx,sy,fx,fy);

length1=argument4;
length2=argument5;

dist=point_distance(sx,sy,fx,fy);

 if dist>length1+length2-0.1 {
 
  dist=length1+length2;
  fx=sx+lengthdir_x(length1+length2,dir);
  fy=sy+lengthdir_y(length1+length2,dir);
  
  }
  
//Set up angles:
var angle1,x1,y1;

angle1=(sqr(length2)-sqr(length1)-sqr(dist))/(-2*length1*dist);
 angle1=radtodeg(arccos(angle1))*argument8*(-1);

x1=sx+lengthdir_x(length1,dir+angle1);
y1=sy+lengthdir_y(length1,dir+angle1);

//Temp:
//draw_line(sx,sy,x1,y1);
//draw_line(x1,y1,fx,fy);

//Set up return array:
var rv;

 //Coordinates:
 rv[0]=(sx+x1)*0.5;
 rv[1]=(sy+y1)*0.5;
 rv[2]=(x1+fx)*0.5;
 rv[3]=(y1+fy)*0.5;
 
 rv[4]=fx;
 rv[5]=fy;

 //Angles:
 rv[6]=dir+angle1;
 rv[7]=point_direction(x1,y1,fx,fy);
 
//Temp:
//draw_set_color(c_green);
//draw_circle(rv[0],rv[1],4,true);
//draw_circle(rv[2],rv[3],4,true);

draw_sprite_ext(argument6, 0, rv[0], rv[1], 1, argument8, rv[6], argument9, 1); // Upper arm
draw_sprite_ext(argument7, 0, rv[2], rv[3], 1, argument8, rv[7], argument9, 1); // Forearm

return rv;










