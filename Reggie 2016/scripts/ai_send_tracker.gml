///ai_send_tracker(tarX, tarY, Speed)
/*

*/
var a;

a=instance_create( pfd_find_free_x(x,y,6) , pfd_find_free_y(x,y,6) ,obj_tracker);

a._tarX=argument0;
a._tarY=argument1;
a._speed=argument2;

return a;
