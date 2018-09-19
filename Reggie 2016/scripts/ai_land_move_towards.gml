///ai_land_move_towards()
/*

*/
var __left, __right, __down, __jump, __grounded, __ceiling, __sign;

//Deal with trackers & set left/right controls:
if (point_distance(x, y, _tarX, _tarY) < 32) {

  if (tracker > 0 && instance_exists(tracker)) remove(tracker);
 
   __left  = 0;
   __right = 0;
  
  }
else {

  pfd_request();
  
  __left  = (sign(_hspeed) == -1);
  __right = (sign(_hspeed) ==  1);
 
  }

//Controls:
__down = false;
__jump = false;

if (tracker > 0 && instance_exists(tracker)) {
 
  //Down:
  if (tracker._Ystate == 1)
   __down = true;
   
  //Grounded & ceiling check: 
  __grounded = _grounded;
  __ceiling  = place_meeting_terrain(x, y-_jumpPower-cpptern(_moveType==1, _relY, 0), false);
  
  //Left / right:
  if (__grounded=true or _hspeed=0) {
   if tracker._Xstate=1 {
    __right=true;
    __left=false;
    }
    else if tracker._Xstate=-1 {
     __left=true;
     __right=false;
     }
   }
   
  __sign = tracker._Xstate;
  
  //Jump:
  if (__grounded=true and __ceiling=false and _jumpCd<=0) {
      
   if (_vspeed>=0 and tracker._Ystate=-1 and y-tracker.y>8) {  
       // Jump over terrain in front (High - Moving):
    if (HG_collision_rectangle(-1,x+_width*__sign/2,y-_eyesY-_height/4,x+_width*__sign+_hspeed*2,y-_height/4,GLOBAL.precision)=true)
       // Tracker going vertically:
    || (abs(tracker.x-x)<8 and __sign=0)
      
     __jump=true;    
     
    }
    
      // Jump over gaps:
   if __jump=false {
    if (_vspeed>=0 and tracker._Ystate<>1 and
       !HG_collision_rectangle(-1,x,y+_height/2,x+__sign*_width*2,y+_height/2+8,GLOBAL.precision) &&
       collision_line(x,y+_height/2+1,x+__sign*_width*2,y+_height/2+1,platformParObj,false,true)=noone)
     __jump=true;
     }
    
      //Jump over terrain in front (Low and High - Stationary):
   if __jump=false {
    if (abs(x-_xPrevOlder)<0.3 and place_meeting_terrain(x+_width*__sign/2,y,!__down)=true)
     __jump=true;
    }
   
      //Randomization:
   if (_randomGen>100-_eccentricity and tracker._Ystate<>0 and
       _aiState<>AI_STATE.patrol and _aiState<>AI_STATE.hide) {
    __jump=!__jump;
    }
     
   }
   
   //Airborne steering:
   else if (__grounded=false and _aircontrol>0) {
   
    var __dl, __dc, __dr;
    
    __dl=HG_collision_ray(-1,x-_width*0.5,y+_height*0.5,270,GLOBAL.precision,_height*1.5);
    if (__dl[1]<>undefined)
     __dl=(__dl[1]-y)
     else __dl=1000;
    
    __dc=HG_collision_ray(-1,x,y+_height*0.5,270,GLOBAL.precision,_height*1.5);
    if (__dc[1]<>undefined)
     __dc=(__dc[1]-y)
     else __dc=1000;
    
    __dr=HG_collision_ray(-1,x+_width*0.5,y+_height*0.5,270,GLOBAL.precision,_height*1.5);
    if (__dr[1]<>undefined)
     __dr=(__dr[1]-y)
     else __dr=1000;
     
    if (__dl+__dr+__dc<3000) {
    
     if (__dl<__dc and __dl<__dr) {
       __left=true;
       __right=false;
       }
       else if (__dr<__dc and __dr<__dl) {
       __left=false;
       __right=true;
       }
       
      }
    
    }  
   
   //Ladder:
   if (_moveType == AI_MOVE.mt_ladder) {
  
     if (__down=true and _vspeed<_climbSpeed)
      _vspeed+=_climbSpeed*0.01
      else if (tracker._Ystate=-1 and _vspeed>-_climbSpeed)
       _vspeed-=_climbSpeed*0.01;
     _vspeed=clamp(_vspeed,-_climbSpeed,_climbSpeed);
     
     if abs(tracker.x-x)<8 {
      __left=false;
      __right=false;
      }
   
   }


}

//Executing:
movement_execute(__left, __right, __down, __jump, 4);

if (__jump) _jumpCd = _jumpCdMax;





