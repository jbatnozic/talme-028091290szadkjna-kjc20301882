///ai_land_update_default()
/*

*/

/// Update

// Load recovery -- STUB
/*if (res_instance_get_flag() == RES_FLAG.do_recover) {

  //show_message("Enemy recovering");

  buf_instance_recover();
  //buf_instance_init();
  
  res_instance_init();

  }*/

// Calc General Random:
if (_randomGenCounter > 0) {
  _randomGenCounter -= 1;
  }
else {
  _randomGenCounter = 59;
  _randomGen = 1 + irandom(99);
  }

// Save old xPrevious:
_xPrevOlder = _xPrevOld;
_xPrevOld   = xprevious;

//*** MOVEMENT TYPE & HEIGHT: ***
var __ceiling, __ladder;

__ladder = false;

set_mask(_maskDefault);
__ceiling = place_meeting_solid(x, y);

if (__ceiling == false and _allowedLadder == true)
  __ladder = place_meeting_obj(x, y, ladderObj, false);
  
set_mask(_maskCrouch);
if (__ceiling == true and _allowedLadder == true)
  __ladder=place_meeting_obj(x, y, ladderObj, false);

if (_grounded == true) {

 _moveType = AI_MOVE.mt_normal;
 
 //* JUMP COOLDOWN *//
 if (_jumpCd>0)
 
  _jumpCd-=1; 
 
 }
 else {
 
  if (__ladder=true)
   _moveType = AI_MOVE.mt_ladder;
   else
    _moveType = AI_MOVE.mt_airborne;
    
  //* JUMP COOLDOWN *//
  if (_jumpCd>0)
   _jumpCd-=0.5; 
 
  }

if (!__ceiling)
  _moveHeight = AI_MOVE.mh_normal;
 else
  _moveHeight = AI_MOVE.mh_crouch; 

//*** SET EYE LEVEL: ***
if (_moveHeight=1)
 _eyesY=_eyesYCrouch;
 else
  _eyesY=_eyesYDefault;

//*** CALC MORALE: ***
 if _moraleCounter>0 _moraleCounter-=1
  else {
   _moraleCounter=60;
   _morale=ai_calc_morale(_moraleBase);
   }
   
//*** STATE CORRECTION: *** 

if _skipUpdate=0 {

switch (_aiState) begin

 case AI_STATE.idle: // ------------------------------------------------------- Idle
   var a;

   //Switch to ret if allowed:
   if _aiGuard=true and (
      point_distance(x,y,_startX,_startY)>_guardRange
      or (_guardBody>0 and point_distance(x,y,_guardBody.x,_guardBody.y)>_guardRange)) {
      
    _aiState=AI_STATE.ret;
    ai_move(_startX, _startY, AI_MOVE.mm_towards);
    
    }
   //Switch to patrol if allowed:
    else if _aiPatrol=true {
     _aiState=AI_STATE.patrol;
     if _aiPatrolNode=0 {
      
      ai_move(point_2_x, point_2_y, AI_MOVE.mm_towards);
      
      }
      else {

       ai_move(point_1_x, point_1_y, AI_MOVE.mm_towards);
       
       }
     }
     else {
      ai_execute_idle(_idleType); 
      
      if (_scriptIdle <> 0)
       script_execute(_scriptIdle);
        
      if (_moveType == AI_MOVE.mt_ladder)
       _moveType = AI_MOVE.mt_normal;
       
      _moveMode = AI_MOVE.mm_inertial;
      }
    
   //Engage in combat if needed:
   ai_engage(40,_viewRange,_playerBias);
  break;
  
 case AI_STATE.patrol:  // ---------------------------------------------------- Patrol
   if _aiPatrol=false
    _aiState=AI_STATE.idle
    else {
     //Change node if needed:
     if _aiPatrolNode=0 {
      if point_distance(x,y,point_2_x,point_2_y)<32
       _aiPatrolNode=1; }
      else {
       if point_distance(x,y,point_1_x,point_1_y)<32
       _aiPatrolNode=0;
       }    
     //Go to node:
     if _aiPatrolNode=0 {

      ai_move(point_2_x, point_2_y, AI_MOVE.mm_towards);
      
      }
      else {
       
       ai_move(point_1_x, point_1_y, AI_MOVE.mm_towards);
       
       }
     //Engage in combat if needed:
     ai_engage(40,_viewRange,_playerBias);
     }
  break;
  
 case AI_STATE.ret: //aka. Guard ---------------------------------------------- Ret / Guard
   var tmode;
   
   if (point_distance(x,y,_tarX,_tarY) > _width+_guardRange)
     tmode = AI_MOVE.mm_towards;
   else
     tmode = AI_MOVE.mm_inertial;
 
   if (_guardBody == -1) {

     ai_move(_startX, _startY, tmode);
    
     }
   else {
     
     ai_move(_guardBody.x, _guardBody.y, tmode);
     
     }
   
   //Engage in combat if needed:
   ai_engage(40, _viewRange, _playerBias);
   
  break;
  
 case AI_STATE.flee:  // ------------------------------------------------------ Flee
   var a;
   
   if irandom(10)>6 {
     a=ai_select_target(_group,max(_viewRange,400),100);
     
     if a>0 {
      _target=a;
      
      ai_move(_target.x, _target.y, AI_MOVE.mm_away_from);
      
      _hiddenTimer = _fleeTimerMax;
      }
       
     }
   
   _hiddenTimer-=1;

   //Stop fleeing if morale changes:
   if _morale>MORALE.flee or _hiddenTimer<0
    _aiState=AI_STATE.idle;
  break;
  
 case AI_STATE.forcedmove: //-------------------------------------------------- Forced move
   // Only used as a surrogate State for forced movements.
   // Ends when updates are no longer skipped. 
   _aiState=AI_STATE.idle;
  break;
  
 case AI_STATE.hide:  // ------------------------------------------------------ Hide
   //Run away while visible:
   if irandom(10)>6 {
    a=ai_select_target(_group,max(_viewRange,400),100);
    
    if a>0 {
      _target=a;
      _tarX=_target.x;
      _tarY=_target.y-_target._eyesY;
      }
      
    }
    
   if (instance_exists(_target) and _target>0)
    _moveMode=2
    else
     _moveMode=0;
     
   //Try crouching:
   var __clc, __clu;
   
   __clc=!HG_collision_line(-1,x,y,_tarX,_tarY,GLOBAL.precision);
   __clu=!HG_collision_line(-1,x,y-_eyesY,_tarX,_tarY,GLOBAL.precision);
   
   if (!__clc and !__clu)
    _target=-1;
   
   if _moveHeight=0 {    
    if (__clc=false and __clu=true)
     _moveHeight=1;   
    }
    
   //Hidden actions:
   if (__clc=false and __clu=false) {
    if _scriptHide<>0
     script_execute(_scriptHide);
    }
    
  break;
  
 case AI_STATE.hunt:  // ------------------------------------------------------ Hunt
   
      //Switch to spawn point ret if allowed:
   if ((_spawnPointEnabled=true) and (point_distance(x,y,_startX,_startY)>_allowedSpawnDistance))
    {
    _aiState=AI_STATE.ret;
    _tarX=_startX;
    _tarY=_startY;
    _moveMode=1;
    }
   //Morale too low:
   if _morale<MORALE.flee 
    _aiState=AI_STATE.flee
    //No target:
    else if !(instance_exists(_target) and _target>0) {
     _aiState=AI_STATE.idle;
     _moveMode=0; 
     _target=-1;
     }
     //Hide:
     else if (_attackMode=-1) {
      _aiState=AI_STATE.hide;
      }
      else {
       var __clf, __pd;
       
       _tarX=_target.x;
       _tarY=_target.y; 
     
       //Keep preferred distance:
       __clf=!HG_collision_line(-1,x,y-_eyesY,_tarX,_tarY,GLOBAL.precision);
       if (_moveHeight=0)
        set_mask(_maskDefault);
       __pd=distance_to_object(_target);
       set_mask(_maskCrouch);
       
       //Reset Player's combat timer:
       if (_target=global.player_obj_id) and __clf=true
        player_reset_combat_timer();

       if (abs(__pd-_prefDist)<=_prefTolerance and __clf=true)
       //or (abs(x-_tarX)<=_rangeTolerance/2 and __pd<=_rangeTolerance)
        _moveMode=0
        else if (__pd>_prefDist or __clf=false)
         _moveMode=1
         else if (__pd<_prefDist and __clf=true)
          _moveMode=2;
          else
           _moveMode=0;
           
       //Adjust hidden timer, change target if needed:
       if __clf=true
        _hiddenTimer=_hiddenTimerMax
        else {
         _hiddenTimer-=1;
         ai_engage(20,_viewRange,_playerBias);
         }
       if _hiddenTimer=0 {
        _aiState=AI_STATE.idle;
        _moveMode=0;
        _target=-1;
        }        
       }
  break;
  
 default:
  break;

end;

}
else
 _skipUpdate-=1;

//*** SET VARIABLES: ***

switch (_aiState) begin

  case AI_STATE.idle:
     _maxspeed     = def_maxspeed;
     _climbSpeed   = def_climbspeed;
     _acceleration = def_acceleration;
     _jumpPower    = def_jumpPower;
     _aircontrol   = def_aircontrol;
     _abscontrol   = def_abscontrol;
     _gravity      = def_gravity;
     _friction     = def_friction;
    break;
  
  case AI_STATE.patrol:
     _maxspeed     = def_maxspeed / 2.0;
     _climbSpeed   = def_climbspeed;
     _acceleration = def_acceleration / 2.0;
     _jumpPower    = def_jumpPower;
     _aircontrol   = def_aircontrol;
     _abscontrol   = def_abscontrol;
     _gravity      = def_gravity;
     _friction     = def_friction;
    break;
  
  case AI_STATE.ret:
     _maxspeed     = def_maxspeed;
     _climbSpeed   = def_climbspeed;
     _acceleration = def_acceleration;
     _jumpPower    = def_jumpPower;
     _aircontrol   = def_aircontrol;
     _abscontrol   = def_abscontrol;
     _gravity      = def_gravity;
     _friction     = def_friction;
    break;
  
  case AI_STATE.flee:
     _maxspeed     = def_maxspeed * 1.0;
     _climbSpeed   = def_climbspeed;
     _acceleration = def_acceleration;
     _jumpPower    = def_jumpPower;
     _aircontrol   = def_aircontrol;
     _abscontrol   = def_abscontrol;
     _gravity      = def_gravity;
     _friction     = def_friction;
    break;
  
  case AI_STATE.hide:
     _maxspeed     = def_maxspeed;
     _climbSpeed   = def_climbspeed;
     _acceleration = def_acceleration;
     _jumpPower    = def_jumpPower;
     _aircontrol   = def_aircontrol;
     _abscontrol   = def_abscontrol;
     _gravity      = def_gravity;
     _friction     = def_friction;
    break;
  
  case AI_STATE.forcedmove:
     _maxspeed     = def_maxspeed;
     _climbSpeed   = def_climbspeed;
     _acceleration = def_acceleration;
     _jumpPower    = def_jumpPower;
     _aircontrol   = def_aircontrol;
     _abscontrol   = def_abscontrol;
     _gravity      = def_gravity;
     _friction     = def_friction;
    break;
  
  case AI_STATE.hunt:
     _maxspeed     = def_maxspeed;
     _climbSpeed   = def_climbspeed;
     _acceleration = def_acceleration;
     _jumpPower    = def_jumpPower;
     _aircontrol   = def_aircontrol;
     _abscontrol   = def_abscontrol;
     _gravity      = def_gravity;
     _friction     = def_friction;
    break;
  
  default:
    break;

end;

//*** APPLY MOVE TYPE & HEIGHT: ***
if _moveHeight=1 { // Crouch:
 _maxspeed=def_maxspeed/2;
 _acceleration=def_acceleration/2;
 }
 
if _moveType=1 { // Ladder:
 _gravity=0;
 _aircontrol=1;
 _maxspeed=def_maxspeed/8;
 _friction=0.95;
 }  

//*** MORALE BUFFS: *** (STUB) 

//*** BUFFS: ***
buf_execute();
buf_execute_vfx();

_maxspeed     *= mod_speed;
_climbSpeed   *= mod_speed;
_acceleration *= mod_speed;
_jumpPower    *= mod_jump;

_health += mod_hp / 60;





