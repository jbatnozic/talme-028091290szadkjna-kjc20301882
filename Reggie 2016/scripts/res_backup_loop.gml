///res_backup_loop()
/*

*/
var i, list, size;

show_error("res_backup_loop() - Deprecated functionality", true);

list = global.RES_USER_LIST;

size = ds_list_size(list);

for (i = 0; i < size; i += 1) {

  //instance_activate_object(list[|i]);

  with (list[|i]) {
  
    event_user(EVENT_BACKUP);
    
    res_instance_set_flag(RES_FLAG.do_recover);
    
    }

  }


