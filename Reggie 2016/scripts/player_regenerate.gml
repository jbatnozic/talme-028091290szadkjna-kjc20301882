///player_regenerate()
/*

*/

//CTW stops health regen:
if buf_instance_has_buff(id,BUFF_ID.ctw)
 exit;

if (floor(abs(_health)) mod 10) <> 0
 _health+=1/room_speed;
