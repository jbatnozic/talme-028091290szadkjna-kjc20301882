//pfd_initialise()
/*
Initializes the Pathfinding engine.
*/
var grid,size=8;

//Set up grid:
grid=mp_grid_create(0,0,ceil(room_width/size),ceil(room_height/size),size,size);

with (staticParObj) {
 image_xscale+=size/16;
 image_yscale+=size/16;
 }

mp_grid_add_instances(grid,staticParObj,true);

with (staticParObj) {
 image_xscale-=size/16;
 image_yscale-=size/16;
 }
 
//Set up list & speed:
global.pfd_list=ds_list_create();
global.pfd_speed=1;
global.pfd_counter=1;
global.pfd_r_speed=16;

//Other:
global.pfd_grid=grid;
global.pfd_size=size;
