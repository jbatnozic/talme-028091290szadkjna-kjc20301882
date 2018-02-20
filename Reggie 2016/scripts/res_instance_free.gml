///res_instance_free()
/*

*/
var pos;

//show_message("res_instance_free - instance = " + string(id));

if (res_local_free_on_destroy) {

  pos = ds_list_find_index(global.RES_USER_LIST, id);
  
  if (pos == -1) exit;
  
  ds_list_delete(global.RES_USER_LIST, pos);

  }
