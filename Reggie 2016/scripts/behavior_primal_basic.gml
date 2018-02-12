
 //Mask:
 _maskDefault=aiDefaultMask; //*
 _maskCrouch=aiCrouchMask;   //*
 
 
 
 //Default variables: //*
 def_maxspeed=argument0.moveSpeed;
 def_climbspeed=argument0.climbSpeed;
 def_acceleration=argument0.moveAccel/10;
 def_jumpPower=argument0.jumpPower;
 def_aircontrol=argument0.airControl/100;
 def_abscontrol=1;
 def_gravity=argument0.gravity/10;
 def_friction=1-argument0.friction/1000;

 
 //Other:
 _allowedLadder=argument0.allowedLadder; //*
 _hSpeedTreshold=argument0.hSpeedTreshold; //*
 _vSpeedTreshold=argument0.vSpeedTreshold; //*
 
 _KBresist=argument0.KBresist; //*
 
 _eccentricity=argument0.eccentricity;  //*
 _prefTolerance=argument0.prefTolerance; //*
 
 //<BEHAVIOUR> variables:
_scriptIdle=0; // d *
_scriptHide=0; // d *
_scriptStep=0; // d *


//<COMBAT> variables:

 //Basic:
 _group=argument0.group; //*
 _maxHealth=argument0.health; //*
 _hiddenTimerMax=argument0.hiddenTimer; //*
 _fleeTimerMax=argument0.fleeTimer; //*
 _prefDistPrim=argument0.prefDistPrim; //*

 _viewRange=argument0.viewRange;   // Larger than preferred distance *
 _playerBias=argument0.playerBias; //*
 //Morale:
  _moraleBase=argument0.moraleBase;  //*
 
//<OTHER> variables :
 _density=argument0.density/100;  //*
 _eyesYDefault=argument0.eyesYDefault; //*
 _eyesYCrouch=argument0.eyesYCrouch;  //*
 
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
