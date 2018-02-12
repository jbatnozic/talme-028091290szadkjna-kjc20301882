///enemy_bb_step()

if _aiState=AI_STATE.hunt and (_lastAttack<_attackSpeed or _grabbedPlayer=1) {

 if _moveMode<>2
  _moveMode=2;

}

if _grabbedPlayer=false {

 def_maxspeed=6;
 def_acceleration=0.8;
 
 }
 else {
 
  def_maxspeed=6*0.5;
  def_acceleration=0.8*0.5;
 
  }
