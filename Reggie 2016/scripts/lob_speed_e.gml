///lob_speed_e(X,Y,Gravity,Angle,Elevation);
/*
Empiric formula.
*/
var xx,yy,g,fi,e,v;

xx=argument0;
yy=argument1;
g=argument2;
fi=argument3;
e=argument4;

v=sqrt(point_distance(0,0,xx,yy))*(logn(e*10,g*2)+dsin(fi));

return abs(v);
