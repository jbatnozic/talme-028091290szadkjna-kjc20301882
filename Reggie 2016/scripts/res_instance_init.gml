///res_instance_init()
/*

*/
var list;

list = global.RES_USER_LIST;

if (ds_list_find_index(list, id) == -1) {

  ds_list_add(global.RES_USER_LIST, id);
  
  //show_message("User with id " +string(id) +" added to RES_USER_LIST");
  
  }

res_local_free_on_destroy = true;

res_local_flag = RES_FLAG.do_not_recover;
