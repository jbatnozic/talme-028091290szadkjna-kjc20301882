///buf_instance_free()
/*

Destroys the calling instance's buff system (thus removing its ability to receive buffs,
so it should be called only when the instance is destroyed).

*/

/*var index = ds_list_find_index(global.buff_user_list, id);

if (index != -1)
  ds_list_delete(global.buff_user_list, index);
else
  show_error("buf_instance_free() error", true);*/

if (ds_exists(local_buff_grid, ds_type_grid))
  ds_grid_destroy(local_buff_grid);
  
local_buff_grid = -1;
