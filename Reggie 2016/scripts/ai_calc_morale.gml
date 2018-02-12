///ai_calc_morale(BaseMorale)
/*

*/
var a,c,allyCount,commCount,counter;

 // -------------------------------------------------
 // Current HP               -  MORALE.hp       |  y
 // Proximity of allies      -  MORALE.allies   |  y
 // Proximity of commanders  -  MORALE.comms    |  y
 // Proximity of fire        -  MORALE.fire     |  n
 // -------------------------------------------------
 
//Count allies and commanders:
a=0;
c=0;
with (bodyParObj) {

 if (_group=other._group and id<>other.id and object_index<>obj_player /*<-STUB*/) {
 
  if (_morale>MORALE.flee and point_distance(x,y,other.x,other.y)<640
      and true /*LoS*/) {
  
   if (_isCommander=true and other._isCommander=false)
    c+=1
    else
     a+=1;
 
   } 
     
  }
  
 }
 
allyCount=a;
commCount=c;

//Calculate:
counter=argument0;

 //Current HP:
 counter+=MORALE.hp*_health/_maxHealth;
 
 //Allies:
 counter+=MORALE.allies*0.2*gp_sum(1,0.95,allyCount);
 
 //Commanders:
 counter+=MORALE.comms*gp_sum(1,0.5,commCount);
 
 //Fire:
 if (_isPrimal=true) {
  //STUB
  //Count fireDecoParObj
  //Count obj_projectile_flame
  }
 
return counter;
