///res_instance_register()
/*

*/
var list;

list = global.RES_USER_LIST;

if (ds_list_find_index(list, id) == -1) {

  ds_list_add(list, id);
  
  //vprint("Instance with ID ", id, " registered to res");
  
  }

res_local_unreg_on_destroy = true;

res_local_flag = RES_FLAG.do_not_recover;
