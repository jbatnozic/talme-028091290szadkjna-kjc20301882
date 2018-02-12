///set_behavior_values_human1(skill)
/*
skill argument goes from 1 to 10 , 1 is least skilled, 10 most skilled
if skill is less than 3 enemy cant climb ladder!! 
Sets all behavior and combat variables for AI: Basic Primal
*/

//******************//
//***  MANUAL:   ***//
//******************//

    //Movement:
    def_maxspeed=4+(argument0/5);     // Pixels per step
    def_climbspeed=3+(argument0/7.5);
    def_acceleration=0.8;
    def_aircontrol=0.2;       // In % [0..100]
    def_gravity=0.8;
    def_friction=1-(6)/1000;  // Integer: 0,1,2... 
    def_jumpPower=10 + (argument0/2.5);
    
    _jumpCdMax=45-(argument0*2);
        
    //Mask:
    _maskDefault=aiDefaultMask; //*
    _maskCrouch=aiCrouchMask;   //*
    
    //Combat:    
    _maxHealth=75+(argument0*5);   
    _moraleBase=0;
    _hideTime=600-(argument0*30)
    _hiddenTimerMax=900;                   //*How long to try before giving up if can't reach the player
    _fleeTimerMax=300 - (argument0 *15);  
    _viewRange=500 + ( argument0 * 15);    // How far away the player needs to be to start hunting
    _KBresist=0 + (argument0*10);          // Knockback resist, 0=0%, 100=100% etc.
    
    //Attacks:
    //---

    //Other:
     
    _density=0.15;       // How hard this creature pushes out other out of itself
    _playerBias=50;      // [0..100] How likely it is to choose the player over other targets
    _allowedLadder=(argument0>2); // 1=yes, 0=no
    _hSpeedTreshold=18;  //*
    _vSpeedTreshold=18;
    _eccentricity=max(1,(argument0/2)); // Amount of "randomness" in movement
    
    //Developer vars:
    _prefTolerance=24;
    _eyesYDefault=24;
    _eyesYCrouch=12; 
    
    //Spawn Point Retreat
    _spawnPointEnabled=false;
    _allowedSpawnDistance=500;

    
//******************//
//*** AUTOMATIC: ***//
//******************//
 
//<MOVEMENT> variables:
 
 //Default variables: 
 def_abscontrol=1; 

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
 _jumpCd=0;
 _xPrevOlder=x;
 _xPrevOld=x;
 _skipUpdate=0;
 
 //Pathfinding:
 pfd_instance_init(); 

//<COMBAT> variables:

 //Basic:

 _health=_maxHealth;
 _pastHealth=_maxHealth // used to check if health has changed
 _currentHideTime=_hideTime
 _armour=0;

 _aiState=AI_STATE.idle;
 _target=-1;
 _tarX=-1;
 _tarY=-1;
 _hiddenTimer=0;
 
 //Morale:
 _moraleCounter=irandom(60);
 _morale=(MORALE.flee+MORALE.rage)/2;
 
 //Buffs:
 buf_instance_init();
 
//<BEHAVIOUR> variables:
 _scriptIdle=0; //*
 _scriptHide=0; //*
 _scriptStep=0; //*

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

//<OTHER> variables:
 _eyesY=0;
 _relY=sprite_get_height(_maskDefault)-sprite_get_height(_maskCrouch);
 _randomGen=0;
 _randomGenCounter=0;
 _idleType=0;
 _bufSave="";
 _aiStage=0;






