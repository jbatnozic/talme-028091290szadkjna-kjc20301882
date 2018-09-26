///ai_land_move_away_from()
/*

*/
var __left, __right, __down, __jump, __grounded, __ceiling, __sign;

//Deal with trackers:
if (tracker > 0 && instance_exists(tracker)) {
  remove(tracker);
  }
  
//Controls:

 //Down:
 if _tarY+8<y __down=false
  else __down=true;
  
  //Randomization:
  if place_meeting_platform(x,y+1) and _randomGen<35
   __down=!__down;

 //Grounded & ceiling check: 
 __grounded=_grounded;
 __ceiling=place_meeting_terrain(x,y-_jumpPower,false);
 
 //Left & Right, Sign set:
 __sign=0;
 if _tarX>x {
  __left=true;
  __right=false;
  __sign=-1;
  }
  else {
   __left=false;
   __right=true;  
   __sign=1;
   }

 //Jump:
 __jump=false;

 if (__grounded=true and __ceiling=false and _jumpCd<=0) {
     
  if (_vspeed>=0) {
      // Jump over terrain in front (High - Moving):
   if (HG_collision_rectangle(-1,x+_width*__sign/2,y-_height/2,x+_width*__sign+_hspeed*2,y,GLOBAL.precision)=true)
      // Jump over gaps:
   || (HG_collision_line(-1,x,y+_height/2+1,x+__sign*_width*2,y+_height/2+1,GLOBAL.precision)=false &&
       collision_line(x,y+_height/2+1,x+__sign*_width*2,y+_height/2+1,platformParObj,false,true)=noone)
    
    __jump=true;

   }
   
     //Jump over terrain in front (Low and High - Stationary):
  if __jump=false {
   if (abs(x-_xPrevOlder)<0.33 and place_meeting_terrain(x+_width*__sign/2,y,!__down)=true)
    __jump=true;
   }
  
     //Randomization:
  if (_randomGen>100-_eccentricity) {
   __jump=!__jump;
   }
    
  }
  
  //Airborne steering:
  else if (__grounded=false) {
  
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

//Executing:
movement_execute(__left, __right, __down, __jump, 4);

if (__jump) _jumpCd = _jumpCdMax;





