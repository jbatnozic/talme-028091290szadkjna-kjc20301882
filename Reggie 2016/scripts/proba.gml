
 //Mask:
 _maskDefault=aiDefaultMask; //*
 _maskCrouch=aiCrouchMask;   //*
 
 
 
 //Default variables: //*
 def_maxspeed=ENEMY_BASIC.moveSpeed;
 def_climbspeed=ENEMY_BASIC.climbSpeed;
 def_acceleration=ENEMY_BASIC.moveAccel/10;
 def_jumpPower=ENEMY_BASIC.jumpPower;
 def_aircontrol=ENEMY_BASIC.airControl/100;
 def_abscontrol=1;
 def_gravity=ENEMY_BASIC.gravity/10;
 def_friction=1-ENEMY_BASIC.friction/1000;

 
 //Other:
 _allowedLadder=ENEMY_BASIC.allowedLadder; //*
 _hSpeedTreshold=ENEMY_BASIC.hSpeedTreshold; //*
 _vSpeedTreshold=ENEMY_BASIC.vSpeedTreshold; //*
 
 _KBresist=ENEMY_BASIC.KBresist; //*
 
 _eccentricity=ENEMY_BASIC.eccentricity;  //*
 _prefTolerance=ENEMY_BASIC.prefTolerance; //*
 
 //<BEHAVIOUR> variables:
_scriptIdle=0; // d *
_scriptHide=0; // d *
_scriptStep=0; // d *


//<COMBAT> variables:

 //Basic:
 _group=ENEMY_BASIC.group; //*
 _maxHealth=ENEMY_BASIC.health; //*
 _hiddenTimerMax=ENEMY_BASIC.hiddenTimer; //*
 _fleeTimerMax=ENEMY_BASIC.fleeTimer; //*
 _prefDistPrim=ENEMY_BASIC.prefDistPrim; //*

 _viewRange=ENEMY_BASIC.viewRange;   // Larger than preferred distance *
 _playerBias=ENEMY_BASIC.playerBias; //*
 //Morale:
  _moraleBase=ENEMY_BASIC.moraleBase;  //*
 
//<OTHER> variables :
 _density=ENEMY_BASIC.density/100;  //*
 _eyesYDefault=ENEMY_BASIC.eyesYDefault; //*
 _eyesYCrouch=ENEMY_BASIC.eyesYCrouch;  //*
 
 //(NOT IMPORTANT)----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


 //Output:
 _hspeed=0;
 _vspeed=0;
 _grounded=0;
 _climb=10;

 //Mask:

  mask_index=_maskCrouch;
 _height=sprite_get_height(mask_index);
 _width=sprite_get_width(mask_index);


 //Other:
 _moveMode=0;
 _moveType=3;
 _moveHeight=0;
 _xPrevOlder=x;
 _xPrevOld=x;
 

 pfd_instance_init();
 


_skipUpdate=0;

//<COMBAT> variables:

 //Basic:

 _health=_maxHealth;
 _armour=0;
 _prefDistSec=0;
 _prefDist=_prefDistPrim;
 _aiState=AI_STATE.idle;
 _target=-1;
 _tarX=-1;
 _tarY=-1;
 _hiddenTimer=0;

 
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
 _moraleCounter=irandom(60);
 _morale=(MORALE.flee+MORALE.rage)/2;

//<OTHER> variables:


 _eyesY=0;
 _relY=sprite_get_height(_maskDefault)-sprite_get_height(_maskCrouch);
 _randomGen=0;
 _randomGenCounter=0;
 _idleType=0;
 _bufSave="";
