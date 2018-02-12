///weapon_amt_name(Name, Index)
/*

*/
var w_obj,son,val;

w_obj=real(inv_item_get_static_value(argument0,4));

son=instance_create((global.player_obj_id).x,(global.player_obj_id).y,w_obj);

val=son.bl_name[argument1];

remove(son);

return val;
