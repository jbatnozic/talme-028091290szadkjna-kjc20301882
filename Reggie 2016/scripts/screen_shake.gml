///screen_shake(min_intensity,intensity, length)
/*
best arguments 4 8 20

*/

remove(obj_screen_shake);

var a=instance_create(0,0,obj_screen_shake);
a._length=argument2;
a._topLength=argument2;
a._max=argument1;
a._min=argument0;
