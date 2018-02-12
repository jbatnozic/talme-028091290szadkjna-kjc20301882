///shop_close()
/*
THIS SCRIPT WILL CLOSE THE CURRENTLY OPENED SHOP AND FREE THE MEMORY USED BY IT.

NOTE: This script will NOT save the current state of the shop! Use shop_write(...) before
      calling this script!

No arguments.

Returns nothing.
*/
var i;

if ds_list_size(global.barter_list)>0 {

 for (i=1; i<=ds_list_size(global.barter_list); i+=1) begin

  ds_list_destroy( global.barter_list[|i-1] );

 end;
 
 }

ds_list_destroy(global.barter_list);
ds_map_destroy(global.barter_map);

global.barter_list=-1;
global.barter_map=-1;
