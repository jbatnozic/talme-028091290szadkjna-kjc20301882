///gui_show_message(Message, Colour, ManualCall)
/*
Displays a message for the user.
*/
var i;

for (i=GUI.max_msg; i>1 i-=1) begin

 obj_game_controller._infoMsg[i,0]=obj_game_controller._infoMsg[i-1,0];
 obj_game_controller._infoMsg[i,1]=obj_game_controller._infoMsg[i-1,1];

end;

obj_game_controller._infoMsg[1,0]=argument0;
obj_game_controller._infoMsg[1,1]=argument1;

if argument2=true {
 sound_play(-1);
 obj_game_controller._infoA=GUI.max_alp;
 }
