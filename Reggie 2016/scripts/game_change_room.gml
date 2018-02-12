///game_change_room(Room)
/*

*/
var r;

if (argument_count==0)
  r=room_next(room);
else
  r=argument[0];
  
obj_game_controller._roomGoto=r;

set_abs_end_action(ABSEND.roomGoto);
