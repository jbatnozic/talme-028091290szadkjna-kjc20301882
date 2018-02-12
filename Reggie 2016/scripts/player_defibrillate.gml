///player_defibrillate()
/*

*/

with (global.player_obj_id) {

 _defib-=1;
 heart_clear();
 screen_flash(c_black,0.02);
 buf_apply_buff(-1,BUFF_ID.defibrillate,2);
 
 }
