///object_knockback(object, vKnock, hKnock)
/*

Applies knockback to a dynamic object.

*/
  
//Vertical:
if sign(argument1)<>sign(argument0._vspeed)
 argument0._vspeed-=argument1
 else {
  
  if !(abs(argument0._vspeed)>abs(argument1))
   argument0._vspeed=clamp(argument0._vspeed-argument1,-abs(argument1),abs(argument1));
 
  }

//Horisontal:
if sign(argument2)<>sign(argument0._hspeed)
 argument0._hspeed+=argument2
 else {
  
  if !(abs(argument0._hspeed)>abs(argument2))
   argument0._hspeed=clamp(argument0._hspeed+argument2,-abs(argument2),abs(argument2));
 
  }
