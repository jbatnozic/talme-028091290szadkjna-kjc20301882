///heart_clear()
/*
Clears all counters, heart attacks etc.
*/

//Reset variables:
global.heart_time_passed=0;
global.heart_meter_prim=0;
global.heart_meter_sec=0;

//Clear objects:
with (obj_heart_attack) {instance_destroy();}
with (obj_ha_delayed) {instance_destroy();}

//Clear buffs:
buf_remove_buff((global.player_obj_id),BUFF_ID.heart_attack_1);
buf_remove_buff((global.player_obj_id),BUFF_ID.heart_attack_2);
buf_remove_buff((global.player_obj_id),BUFF_ID.heart_attack_3);
buf_remove_buff((global.player_obj_id),BUFF_ID.heart_attack_4);
buf_remove_buff((global.player_obj_id),BUFF_ID.heart_attack_5);
