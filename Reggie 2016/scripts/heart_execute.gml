///heart_execute()
/*

*/
global.heart_counter+=1;

if global.heart_counter=60 {

 heart_tick();
 global.heart_counter=0;
 
 }
