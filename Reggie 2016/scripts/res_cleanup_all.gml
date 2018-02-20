///cust_cleanup_all()
/*

*/
var i, list, size;

list = global.RES_USER_LIST;

size = ds_list_size(list);

for (i = 0; i < size; i += 1) {

  instance_activate_object(list[|i]);

  with (list[|i]) {
  
    res_local_free_on_destroy = false;
  
    event_perform(ev_destroy, 0);
    
    }

  }
  
ds_list_clear(list);


