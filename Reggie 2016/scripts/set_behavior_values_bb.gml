///set_behavior_values_bb()
/*
Sets all behavior and combat variables for AI: BatBird
*/

//<MOVEMENT> variables:

 //Output:
 _hspeed=0;
 _vspeed=0;
 _grounded=0;
 _climb=10;

 //Mask:
  mask_index=aiCrouchMask;
 _height=sprite_get_height(mask_index);
 _width=sprite_get_width(mask_index);

 //Default variables:
 def_maxspeed=6;
 def_climbspeed=0;
 def_acceleration=0.8;
 def_jumpPower=0;
 def_aircontrol=1;
 def_abscontrol=1;
 def_gravity=0.0;
 def_friction=1-5/1000;

 //Other:
 _moveMode=0;

 _xPrevOlder=x;
 _xPrevOld=x;
 
 _hSpeedTreshold=12;
 _vSpeedTreshold=12;
 
 _KBresist=0;

 _prefTolerance=0;
 pfd_instance_init();
 
//<BEHAVIOUR> variables:
_scriptIdle=0; // d
_scriptHide=0; // d
_scriptStep=asset_get_index("enemy_bb_step"); // d

_skipUpdate=0;

//<COMBAT> variables:

 //Basic:
 _group=GROUP.enemy;

 _maxHealth=100;
 _health=_maxHealth;
 _armour=0;

 _aiState=AI_STATE.idle;
 _target=-1;
 _tarX=-1;
 _tarY=-1;
 _hiddenTimer=0;
 _hiddenTimerMax=900;
 _fleeTimerMax=300;
 _prefDistPrim=0;
 _prefDistSec=0;
 _prefDist=_prefDistPrim;
 _viewRange=800;
 _playerBias=50;
 
 //Buffs:
 buf_instance_init();

 //Patrol:
 point_1_x=-1;
 point_1_y=-1;
 point_2_x=-1;
 point_2_y=-1;
 _aiPatrol=false;
 _aiPatrolNode=0;
 
 //Guard:
 _startX=x;
 _startY=y;
 _aiGuard=false;
 _guardRange=240;
 _guardBody=-1;
 
 //Morale:
 _moraleBase=1000;
 _moraleCounter=irandom(60);
 _morale=(MORALE.flee+MORALE.rage)/2;
 
  //Spawn Point Retreat
 _spawnPointEnabled=false;
_allowedSpawnDistance=0;



//<OTHER> variables:

 _density=15/100;
 _eyesY=15;
 _randomGen=0;
 _randomGenCounter=0;
 _idleType=0;
 sprite_index=choose(spr_enemy_fsm);
 
 _bufSave="";
