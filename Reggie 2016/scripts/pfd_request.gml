///pfd_request()
/*
Requests a tracker for a dynamic instance.
*/

pfd_r_counter-=1;

if pfd_r_counter=0 {

 pfd_r_counter=global.pfd_r_speed;
 
 if ds_list_find_index(global.pfd_list,id)=-1
  ds_list_add(global.pfd_list,id);
  
 }
