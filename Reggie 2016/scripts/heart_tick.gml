///heart_tick()
/*

NOTE: Called once a second by heart_execute().

No arguments.

Returns nothing.
*/

if heart_health()=1 {
 global.heart_time_passed=0;
 global.heart_meter_prim=0;
 global.heart_meter_sec=0; 
 exit;
 }

//Time:
global.heart_time_passed+=1;

//Calc prim mod.
global.heart_meter_prim+=(HEART.max_prim_mod-HEART.min_prim_mod)/HEART.period;

global.heart_meter_prim=clamp(global.heart_meter_prim,HEART.min_prim_mod,HEART.max_prim_mod);

//Calc sec mod.
global.heart_meter_sec-=HEART.sec_mod_drop/100;

global.heart_meter_sec=clamp(global.heart_meter_sec,HEART.min_sec_mod,HEART.max_sec_mod);

//Heart attack:
if (heart_get_ha_chance())>random(100) {

 heart_cause_heart_attack(10);
 
 }
