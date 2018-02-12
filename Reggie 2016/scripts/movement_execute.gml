///movement_execute(cmdLeft, cmdRight, cmdDown, cmdUp, CheckGroundedAt)
/*
Executes movement for a dynamic instance.

NOTE:
 Needed variables:
  _width
  _hspeed -- Output variable
  _vspeed -- Output variable
  _grounded -- Output variable
  _maxspeed
  _acceleration
  _jumpPower
  _aircontrol
  _gravity
  _friction

Returns nothing.
*/
var i;

//HORISONTAL MOVEMENT:
var col_below=place_meeting_terrain(x,y+1,!argument2);

//Input - Right:
if (argument1=true) {

 if (col_below=true) { 
  if _hspeed<_maxspeed _hspeed+=min(_acceleration,_maxspeed-_hspeed);
  }
  else {
   if _hspeed<_maxspeed*_aircontrol _hspeed+=min(_acceleration,_maxspeed-_hspeed)*_aircontrol;
   }
   
 }  
 else 
 //Input - Left:
 if (argument0=true) {
   
   if (col_below=true) {
    if _hspeed>-_maxspeed _hspeed-=min(_acceleration,_maxspeed+_hspeed); 
    }
    else {
     if _hspeed>-_maxspeed*_aircontrol _hspeed-=min(_acceleration,_maxspeed+_hspeed)*_aircontrol;
     }
  
   }
   
   //No input:
   else {
   
    if (col_below=true) or abs(_hspeed)>_maxspeed
     _hspeed*=_friction*0.744;
     else _hspeed*=_friction;
    
    }
   
//Movement correction 1:
if (col_below=true) and abs(_hspeed)>_maxspeed
 _hspeed*=_friction*0.744
    
//Movement correction 2: 
if abs(_hspeed)>LIMIT.max_hspeed {

 _hspeed=sign(_hspeed)*LIMIT.max_hspeed;
 
 }
 else {
 
  if (abs(_hspeed)<LIMIT.min_hspeed/10 and (argument0=true or argument1=true))
   _hspeed=ite(argument1,true,1,-1)*LIMIT.min_hspeed/10;
   
   }
 
//Movement correction 3:
var skipx=false;

if (abs(_hspeed)>0.33 and place_meeting_solid(x+_hspeed,y)) {
  
 //Try to climb slopes:
 for (i=1; i<=_climb; i+=1) begin
  
  if !place_meeting_solid(x+_hspeed/1.20,y-i) {
   
   x+=_hspeed/1.20;
   y-=i;
   
   if _vspeed>-1
    _vspeed=-1;
   
   if abs(_hspeed)>_maxspeed/1.20
    _hspeed=_maxspeed/1.20*sign(_hspeed);
    
   skipx=true;
   
   break; 
  
   }
  
 end;
 
 //Go forward as far as possible:
 if (skipx=false) {

  for (i=1; i<=abs(_hspeed); i+=1) begin
 
   if place_meeting_solid(x+i*sign(_hspeed),y)
    break;
 
  end;
 
  x+=(i-1)*sign(_hspeed);
  impact(true);
  _hspeed=0;
  skipx=true;
   
  }

 }
   
if abs(_hspeed)<=0.33 _hspeed=0;
 
//UPDATING X POSITION:
if (skipx=false)
 x+=_hspeed;
 
//------------------------------------------------------------------------------------------------
    
//VERTICAL MOVEMENT:
var;

//Input - Jump:
if (argument3=true) {
 
 if place_meeting_terrain(x,y+8,!argument2,y+1) {
 
  _vspeed=-_jumpPower;
   
  //***
  if (id=global.player_obj_id)
   heart_cause_strain(HEART.jump_strain);
  //***
    
  }

 }
 
//Apply gravity:
if (_vspeed<LIMIT.max_vspeed)
 _vspeed+=_gravity-_vspeed*0.02;
 
//Movement correction 1:
if (place_meeting_solid(x,y+_vspeed) or ((!argument2 && _vspeed>0) and 
   collision_rectangle(x-_width/2,y+_height/2,x+_width/2,y+_height/2+_vspeed,platformParObj,false,true))) {

 for (i=1; i<=abs(_vspeed); i+=1) begin
 
  if place_meeting_terrain(x,y+i*sign(_vspeed),(!argument2 && _vspeed>0))
   break;
 
 end;
 
 y+=(i-1)*sign(_vspeed);
 impact(false);
 _vspeed=0;

 }
 
//UPDATING Y POSITION:
y+=_vspeed;

//GROUNDED CHECK:
if place_meeting_terrain(x,y+argument4,!argument2,y+1)=true
 _grounded=true
 else
  _grounded=false;
