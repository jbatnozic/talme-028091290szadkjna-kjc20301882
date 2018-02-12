///game_save_checkpoint(Name)
/*

*/

instance_activate_all();

with (bodyParObj) {

 _bufSave=ds_grid_write(local_buff_grid);
 
 }

global.sl_string=argument0;
 
game_save(argument0+"_save_state");
game_save_systems(argument0);

global.sl_string="";
