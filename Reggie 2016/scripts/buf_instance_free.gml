///buf_instance_free()
/*
Destroys the calling instance's buff system (thus removing its ability to receive buffs,
so it should be called only when the instance is destroyed).

*/

ds_grid_destroy(local_buff_grid);
