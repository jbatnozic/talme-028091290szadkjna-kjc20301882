///pfd_serve()
/*
Deals with tracker requests.
*/
var client;

//Count etc...
global.pfd_counter-=1;

if global.pfd_counter>0 exit;

global.pfd_counter=global.pfd_speed;

if ds_list_size(global.pfd_list)=0 exit;

while ds_list_size(global.pfd_list)>0 and !instance_exists(global.pfd_list[|0])
 ds_list_delete(global.pfd_list,0);
 
if ds_list_size(global.pfd_list)=0 exit;

//Serve the client:
client=global.pfd_list[|0];
ds_list_delete(global.pfd_list,0);

with (client) begin

if instance_exists(tracker) && tracker>0
 remove(tracker);
 
tracker=ai_send_tracker(_tarX,_tarY,def_maxspeed*1.42);

end;
