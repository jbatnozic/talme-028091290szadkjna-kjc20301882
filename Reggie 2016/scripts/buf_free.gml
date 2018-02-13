///buf_free(free locals)
/*

*/

if (argument0 == true) {

  var i, size = ds_list_size(global.buff_user_list);

  for (i = 0; i < size; i += 1) {
  
    if ds_exists(global.buff_user_list[|i].local_buff_grid, ds_type_grid) {
    
      ds_grid_destroy(global.buff_user_list[|i].local_buff_grid);
      global.buff_user_list[|i].local_buff_grid = -1;
    
      }
  
    }

  }

ds_grid_destroy(global.buff_grid);
ds_list_destroy(global.buff_user_list);


