///res_backup_all()
/*

*/
var i, list, size;

list = global.RES_USER_LIST;

size = ds_list_size(list);

for (i = 0; i < size; i += 1) {

  instance_activate_object(list[|i]);

  with (list[|i]) {
  
    event_user(0);
    
    res_instance_set_flag(RES_FLAG.do_recover);
    
    }

  }


