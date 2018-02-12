///ptc_create_efect(X, Y, Effect ID)
/*
Creates a predefined particle effect on the specified location.
*/

if argument2=PTC_EFF.fire {
 ptc_create_particles(argument0,argument1,32,32,PTC_TYPE.fire,4,0,1);
 exit;
 }
 
//Pending:
if argument2=PTC_EFF.acid {
 exit;
 }
 
if argument2=PTC_EFF.bleed {
 exit;
 }
 
if argument2=PTC_EFF.poison {
 exit;
 }
