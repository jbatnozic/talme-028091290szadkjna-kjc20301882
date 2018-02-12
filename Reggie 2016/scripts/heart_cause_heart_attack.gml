///heart_cause_heart_attack(Duration [sec])
/*

STUB --

*/
var son;

//Reset everything first:
heart_clear();

//Apply the buffs and the visuals:
son=instance_create((global.player_obj_id).x,(global.player_obj_id).y,obj_heart_attack);
son.duration=argument0*60;
