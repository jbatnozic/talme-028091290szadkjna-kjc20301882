///object_damage(object, damage, vKnock, hKnock)
/*
Removes the specified amount of health from the target object and knocks them back.    
*/
var a,damage;

if (!instance_exists(argument0)) exit;

//Knockback:
a=argument0.mod_kbrs*(1-argument0._KBresist/100);
object_knockback(argument0,argument2*a,argument3*a);

//Armour damage:
damage=argument1;

if argument0._armour>=damage {
 argument0._armour-=damage;
 exit;
 }

damage-=argument0._armour;
argument0._armour=0;
 
//Health damage:
argument0._health -= argument1*argument0.mod_dr;
