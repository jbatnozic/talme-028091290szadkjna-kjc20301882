///res_clear_all_flags()
/*

  TEST!

*/
var i, list, size;

show_error("res_clear_all_flags() - Deprecated functionality", true);

list = global.RES_USER_LIST;

size = ds_list_size(list);

for (i = 0; i < size; i += 1) {

  (list[|i]).res_local_flag = RES_FLAG.do_not_recover;

  }
