///heart_cause_delayed_heart_attack(Delay [sec], Duration [sec])
/*

*/
var son;

with (obj_ha_delayed) {instance_destroy();}

son=instance_create((global.player_obj_id).x,(global.player_obj_id).y,obj_ha_delayed);
son.delay=argument0;
son.hadur=argument1;
