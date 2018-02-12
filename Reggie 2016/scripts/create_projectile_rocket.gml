///create_projectile_rocket(x,y,creator_obj_ind,group,sprite,direction,speed,damage,exp_scale,exp_sprite,knockback,dot,dot_type,arc,type)
/*

Returns the projectile's ID.
*/
var son;

son=instance_create(argument0,argument1,obj_projectile_rocket);
      
son._direction=argument5;
son.image_angle=son._direction;
son._speed=argument6;
son._sprite=argument4;
            
son.damage=argument7;     
son.exp_radius=argument8;
son.exp_sprite=argument9;
son.knockback=argument10;
son.dot=argument11;
son.dot_type=argument12;
son.arc=argument13;

weapon_projectile_init(son,argument2,argument14,argument3);

return son;
