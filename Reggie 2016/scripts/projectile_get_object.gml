///projectile_get_object(Type)
/*

*/

switch (argument0) begin

 case PROJECTILE.bullet:
   return obj_projectile_bullet;
  break;
  
 case PROJECTILE.rocket:
   return obj_projectile_rocket;
  break;
  
 case PROJECTILE.flame:
   return obj_projectile_flame;
  break;
  
 case PROJECTILE.grenade:
   return obj_projectile_grenade;
  break;
  
 default:
  break;

end;
