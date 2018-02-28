///game_paused()
/*
Returns whether or not to cancel dynamic actions and events.
(Object obj_game_controller calculates this value at the beginning of every step.)
*/
 
with (obj_game_controller) {

  return _dc;

  }

return true;
