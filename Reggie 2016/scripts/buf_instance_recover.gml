///buf_instance_recover()
/*
Recovers local_buff_grid after saving / loading for a Body.
*/

if ds_exists(local_buff_grid,ds_type_grid)=false {
 buf_instance_init();
 if _bufSave<>"" ds_grid_read(local_buff_grid,_bufSave);
 }
