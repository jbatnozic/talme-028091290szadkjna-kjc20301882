///place_meeting_terrain(X, Y, usePlat, [OPT] AltPlatY)
/*
Returns whether the calling instance would collide with any terrain objects at the
specified position.

argument0 - x to check
argument1 - y to check
argument2 - Whether to use platofrms.
argument3 - Y coordinate for platform check.
    
Returns true/false.
*/
 
var __bbl,__bbr,__bbt,__bbb,__col1,__col2;

__bbl=-_width/2;
__bbr=+_width/2;
__bbt=-_height/2;
__bbb=+_height/2;

__col1=HG_collision_rectangle(-1,argument[0]+__bbl,argument[1]+__bbt,argument[0]+__bbr,argument[1]+__bbb,GLOBAL.precision);

if argument[2]=true {
 if argument_count=4
  __col2=collision_line(argument[0]+__bbl,argument[3]+__bbb,argument[0]+__bbr,argument[3]+__bbb,platformParObj,false,true)<>noone
  else
   __col2=collision_line(argument[0]+__bbl,argument[1]+__bbb,argument[0]+__bbr,argument[1]+__bbb,platformParObj,false,true)<>noone;
 }
 else
  __col2=false;

if (__col1=true or __col2=true)
 return true
 else
  return false;
