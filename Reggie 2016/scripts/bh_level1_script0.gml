///bh_level_1_script_0()
/*
Primal runs away from a burning tree unless engaged by the Player.
*/

if _runAway=true {

 if (distance_to_object(global.player_obj_id)<=_minDist or _health<_maxHealth)
  _runAway=false
  else
   ai_force_move(id,4480,840,1,true);
  
 }
