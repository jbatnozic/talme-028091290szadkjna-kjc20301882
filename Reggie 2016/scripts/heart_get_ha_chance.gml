///heart_get_ha_chance()
/*

*/

return global.heart_admin_mod*
       global.heart_meter_prim*
       global.heart_meter_sec*
       (1.3-HEART.max_ter_mod/100*((global.player_obj_id)._health/PLAYER.topHealth))*
       ite_ext(global.heart_time_passed<=HEART.safe_period,HEART.safe_mod/100,1)*
       (global.player_obj_id).mod_hac/10;
