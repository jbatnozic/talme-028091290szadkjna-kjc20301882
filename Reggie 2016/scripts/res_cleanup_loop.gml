///res_cleanup_loop()
/*

*/
var i, list, size;

list = global.RES_USER_LIST;

size = ds_list_size(list);

//vprint("res_cleanup_loop() called, size = ", size);

for (i = 0; i < size; i += 1) {

  //vprint("id = ", list[|i]);

  if (is_undefined(list[|i])) {
    show_error("undefined value in cleanup list!", false);
    continue;
    }
  
  instance_activate_object(list[|i]);

  with (list[|i]) {
  
    res_local_unreg_on_destroy = false;
  
    event_perform(ev_destroy, 0);
    
    //vprint("Variables: ", variable_instance_get_names(id));
    
    }

  }
  
ds_list_clear(list);


