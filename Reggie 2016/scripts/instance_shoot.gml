///instance_shoot(shooter_x,shooter_y,target_x,target_y,bullet_object,bullet_shrapnel,bullet_speed,bullet_weight,bullet_demage,bullet_precision)
/*
target_x,target_y -> where is bullet going
bullet_precision -> [1..10] 10 least precise
bullet_speed -> pixels per frame
bullet_weight -> how much is bullet falling, 0 = for no fall
bullet_object -> chosen frome enemy_bullet group
bullet_shrapnel -> number of object created 1...
*/

for(i=0;i<argument5;i++)
{bullet[i]=instance_create(argument0,argument1,argument4);
bullet[i]._speed=argument6;
bullet[i]._weight=argument7;
bullet[i]._demage=argument8;
bullet[i]._posx=argument2;
bullet[i]._posy=argument3+irandom_range(-argument9,argument9);
}

