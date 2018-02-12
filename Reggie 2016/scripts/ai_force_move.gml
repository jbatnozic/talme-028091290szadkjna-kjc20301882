///ai_force_move(ID, X, Y, Steps, StopAttacking)
/*

*/

with (argument0) begin

 _tarX=argument1;
 _tarY=argument2;

 _moveMode=1;
 
 _skipUpdate=argument3;
 if argument4=true
  _aiState=AI_STATE.forcedmove;

end;
