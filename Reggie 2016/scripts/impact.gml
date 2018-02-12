///impact(Horizontal)
/*
Applies fall / impact damage on a dynamic instance.

Returns nothing.
*/
var damage;

if argument0=true 
 damage=clamp(abs(_hspeed)-_hSpeedTreshold,0,9999)*8
 else
  damage=clamp(abs(_vspeed)-_vSpeedTreshold,0,9999)*8;

if damage>0 {
  
 if (id=global.player_obj_id) {

  player_damage(damage,0,0);
  buf_apply_buff(-1,BUFF_ID.recover,0.5);
  screen_flash(c_red,clamp(0.1-damage/250,0.025,0.1));

  }
  else {
 
   object_damage(-1,damage,0,0);
  
   }
   
 }
