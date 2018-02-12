///collision_line_distance(x1, y1, x2, y2, obj, prec, notme)
/*
    Same as collision_line, however it returns the distance to the collision or noone
    if there wasn't one.
 */
var __col=collision_line(argument0,argument1,argument2,
                         argument3,argument4,argument5,argument6);

if (__col == noone) 
    return noone;
    
var __dis=point_distance(argument0,argument1,argument2,argument3),
    __dir=point_direction(argument0,argument1,argument2,argument3);
for (var i=0; i<=__dis; ++i)
{
    if (collision_point(argument0+cos(rpi*__dir)*i,argument1-sin(rpi*__dir)*i,
                        argument4,argument5,argument6) != noone)
        return i;
}

return noone;
