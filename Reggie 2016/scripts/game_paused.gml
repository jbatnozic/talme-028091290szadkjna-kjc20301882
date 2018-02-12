///game_paused()
/*
Returns whether or not to cancel dynamic actions and events.
(Object obj_game_controller calculates this value at the beginning of every step.)
*/
 
return obj_game_controller._dc;
