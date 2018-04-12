///xy_rotated(X offset, Y offset, Rotation)
/*
argument0 - (Integer) Original x offset
argument1 - (Integer) Original y offset
argument2 - (Integer) Rotation (In degrees)

Returns the x and y coordinates of a rotated point.
*/
var r,fi,s;

r=sqrt(sqr(argument0) + sqr(argument1));
fi=point_direction(0,0,argument0,argument1);

s[0]=+r*dcos(argument2+fi);
s[1]=-r*dsin(argument2+fi);

return s;
