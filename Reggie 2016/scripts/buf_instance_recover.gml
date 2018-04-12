///buf_instance_recover()
/*
Recovers local_buff_grid after saving / loading for a Body.
*/

if (!ds_exists(local_buff_grid, ds_type_grid))
  local_buff_grid = ds_grid_create(2,0);

if (buf_local_backup_string != "")
  ds_grid_read(local_buff_grid, buf_local_backup_string);

