///weapon_projectile_init(Target, WeaponObject, AmmoType, Group)
/*

*/

with (argument0) begin

 //BASIC SETUP:
 _hspeed=_speed*dcos(_direction);
 _vspeed=-_speed*dsin(_direction);
 image_angle=_direction;

 _group=argument3;
 patron_type=argument1;
 ammo_type=argument2;
 
 image_xscale=_speed*0.2;
 image_yscale=(sprite_get_bbox_bottom(_sprite)-sprite_get_bbox_top(_sprite))*0.2;
 
 //SPECIAL PROPERTIES: 
 switch (argument1) begin
 
  case obj_weapon_flame:
    image_yscale/=2;
    image_xscale=image_yscale;
    depth=-1;
   break;
  
  default:
   break;
 
 end;

end;
