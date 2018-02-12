///object_move_to(Object, X, Y, Increment, MaxMove)
/*

Move the target dynamic instance as close as possible to the target location.

*/
var i,s;

with (argument0) {

 //Both coords fit:
 if place_meeting_terrain(argument1,argument2,false)=false {
  x=argument1;
  y=argument2;
  exit;
  }
  //Y fits:
  else if place_meeting_terrain(x,argument2,false)=false {
   
   y=argument2;
   s=ite_ext(x>argument1,-1,1);
   
   for (i=1; i<=argument4; i+=argument3) begin
   
    if place_meeting_terrain(x+s*i,y,false)=false {
     x=x+s*i;
     exit;
     }
   
   end;
   
   }
   //X fits:
   else if place_meeting_terrain(argument1,y,false)=false {
       
    x=argument1;
    s=ite_ext(y>argument2,-1,1);
   
    for (i=1; i<=argument4; i+=argument3) begin
    
     if place_meeting_terrain(x,y+s*i,false)=false {
      y=y+s*i;
      exit;
      }
   
    end;
   
    }
    //None fit:
    else {
     //Seems this part is not needed...
     exit;
     }

 }
