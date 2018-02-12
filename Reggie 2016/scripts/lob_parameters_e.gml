///lob_parameters_e(x1,y1,x2,y2,elevation,gravity,speed_multiplier)
/*

*/

var a,
    v,
    s=argument6,
    g=argument5,
    e=argument4,
    r;

a=lob_angle_e(argument0,argument1,argument2,argument3,e);
v=lob_speed_e(argument2-argument0,argument3-argument1,g,a,e);
      
r[0]=a;
r[1]=v*sqrt(s);
r[2]=g*s;

return r;
