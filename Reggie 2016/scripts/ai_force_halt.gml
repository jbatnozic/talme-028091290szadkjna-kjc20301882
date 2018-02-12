///ai_force_halt(ID, Steps, StopAttacking)
/*

*/

with (argument0) begin

 _moveMode=0;
 
 _skipUpdate=argument1;
 
 if argument2=true
  _aiState=AI_STATE.forcedmove;

end;
