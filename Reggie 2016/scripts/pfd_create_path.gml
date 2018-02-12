///pfd_create_path(Goal X, Goal Y)
/*

*/

if path_exists(pfd_path)
 path_delete(pfd_path);
 
pfd_path=path_add();

mp_grid_path(global.pfd_grid,pfd_path,x,y,argument0,argument1,true);
