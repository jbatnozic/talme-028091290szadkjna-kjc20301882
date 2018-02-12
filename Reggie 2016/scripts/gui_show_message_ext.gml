///gui_show_message_ext(Message, Colour)
/*
Displays a message for the user. This script is slower than gui_show_message(...),
but can display very long messages properly.
*/
var i,array;

array=string_cut_to_array(argument0,150);

for (i=0; i<array_length_1d(array); i+=1) begin

 gui_show_message(array[i],argument1,false);
 
end;

obj_game_controller._infoA=GUI.max_alp;
//sound_play(-1);
