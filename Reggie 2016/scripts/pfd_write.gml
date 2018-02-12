///pfd_write()
/*

*/
var w,h;
var size=GLOBAL.pfd_size;

w=ceil(room_width/size);
h=ceil(room_height/size);

return mp_grid_to_str(global.pfd_grid,w,h);
