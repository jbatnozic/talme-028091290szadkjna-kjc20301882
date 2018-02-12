///set_behavior_values_turta()
/*
Sets all behavior and combat variables for AI: Turta
*/

//******************//
//***  MANUAL:   ***//
//******************//

    //Movement:
var __movespeed=3,      // Pixels per step
    __climbspeed=3,   
    __acceleration=0.8,
    __aircontrol=20,    // In % [0..100]
    __gravity=0.8,
    __friction=4,       // Integer: 0,1,2... 
    __jumpPower=12,
    
    __jumpCd=60,        // Jump cooldown in steps 
        
    //Mask:
    __maskDefault=aiCrouchMask,
    __maskCrouch=aiCrouchMask,
    
    //Combat:    
    __health=250,
    __moraleBase=0,
    
    __hiddenTimer=900,  // How long to try before giving up if can't reach the player
    __fleeTimer=300,
    __viewRange=420,    // How far away the player needs to be to start hunting
    __KBresist=40,      // Knockback resist, 0=0%, 100=100% etc.
    
    //Attacks:
    //(Attacks are set up separately)
    
    //Other:
    __density=15,         // How hard this creature pushes out other out of itself
    __playerBias=50,      // [0..100] How likely it is to choose the player over other targets
    __allowedLadder=0,    // 1=yes, 0=no
    __hSpeedTreshold=18,
    __vSpeedTreshold=18,
    __eccentricity=1,     // Integer: 0,1,2... - Amount of "randomness" in movement
    
    //Developer vars:
    __prefTolerance=16,
    __eyesYDefault=24,
    __eyesYCrouch=12,
    
    __scriptIdle=0,
    __scriptHide=0,
    __scriptStep=0;


//******************//
//*** AUTOMATIC: ***//
//******************//
 
//<MOVEMENT> variables:
 
 //Default variables: //*
 def_maxspeed=__movespeed;
 def_climbspeed=__climbspeed;
 def_acceleration=__acceleration;
 def_jumpPower=__jumpPower;
 def_aircontrol=__aircontrol/100;
 def_abscontrol=1;
 def_gravity=__gravity;
 def_friction=1-__friction/1000;
 
 //Other:
 _allowedLadder=__allowedLadder;   //*
 _hSpeedTreshold=__hSpeedTreshold; //*
 _vSpeedTreshold=__vSpeedTreshold; //*
 
 _KBresist=__KBresist;             //*
 
 _eccentricity=__eccentricity;     //*
 _prefTolerance=__prefTolerance;   //*

 //Output:
 _hspeed=0;
 _vspeed=0;
 _grounded=0;
 _climb=10;

 //Mask:
 _maskDefault=__maskDefault; //*
 _maskCrouch=__maskCrouch;   //*
  mask_index=_maskCrouch;
 _height=sprite_get_height(mask_index);
 _width=sprite_get_width(mask_index);

 //Other:
 _moveMode=0;
 _moveType=3;
 _moveHeight=0;
 _jumpCd=0;
 _jumpCdMax=__jumpCd;
 _xPrevOlder=x;
 _xPrevOld=x;
 _skipUpdate=0;
 
 //Pathfinding:
 pfd_instance_init(); 

//<COMBAT> variables:

 //Basic:
 _maxHealth=__health;           //*
 _hiddenTimerMax=__hiddenTimer; //*
 _fleeTimerMax=__fleeTimer;     //*
 _viewRange=__viewRange;        //*
 _playerBias=__playerBias;      //*
 _health=_maxHealth;
 _armour=0;
 _aiState=AI_STATE.idle;
 _target=-1;
 _tarX=-1;
 _tarY=-1;
 _hiddenTimer=0;
 
 //Morale:
 _moraleBase=__moraleBase;       //*   
 _moraleCounter=irandom(60);
 _morale=(MORALE.flee+MORALE.rage)/2;
 
 //Buffs:
 buf_instance_init();
 
//<BEHAVIOUR> variables:
 _scriptIdle=__scriptIdle; //*
 _scriptHide=__scriptHide; //*
 _scriptStep=__scriptStep; //*

 //Patrol:
 point_1_x=-1;
 point_1_y=-1;
 point_2_x=-1;
 point_2_y=-1;
 _aiPatrol=false;
 _aiPatrolNode=0;
 
 //Spawn Point Retreat
 _spawnPointEnabled=false;
 _allowedSpawnDistance=0;

 //Guard:
 _startX=x;
 _startY=y;
 _aiGuard=false;
 _guardRange=240;
 _guardBody=-1;

//<OTHER> variables:
 _density=__density/100;       //*
 _eyesYDefault=__eyesYDefault; //*
 _eyesYCrouch=__eyesYCrouch;   //*

 _eyesY=0;
 _relY=sprite_get_height(_maskDefault)-sprite_get_height(_maskCrouch);
 _randomGen=0;
 _randomGenCounter=0;
 _idleType=0;
 _bufSave="";






