///y_rotated(X offset, Y offset, Rotation)
/*
argument0 - (Integer) Original x offset.
argument1 - (Integer) Original y offset.
argument2 - (Integer) Rotation (In degrees).

Returns the y coordinate of the rotated point.
*/
var r,fi,yy;

r=sqrt(sqr(argument0) + sqr(argument1));
fi=point_direction(0,0,argument0,argument1);

yy=-r*dsin(argument2+fi);

return yy;
