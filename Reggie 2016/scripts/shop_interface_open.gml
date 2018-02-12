///shop_interface_open(Index)
/*
THIS SCRIPT OPENS AN INTERFACE WINDOW FOR THE INDICATED SHOP.

argument0 - (Integer) Index of the shop for which the interface window is being opened.

Returns nothing.
*/
var a;

a=instance_create((global.player_obj_id).x,(global.player_obj_id).y,obj_gui_barter);
a.shop_index=argument0;
