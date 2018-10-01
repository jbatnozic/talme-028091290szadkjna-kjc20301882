///res_instance_unreg()
/*

*/
var pos;

//vprint("Instance with ID ", id, " unregistered from res");

if (res_local_unreg_on_destroy) {

  pos = ds_list_find_index(global.RES_USER_LIST, id);
  
  if (pos == -1) exit;
  
  ds_list_delete(global.RES_USER_LIST, pos);

  }
