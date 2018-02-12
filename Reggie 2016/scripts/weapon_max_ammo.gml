///weapon_max_ammo(Name)
/*
THIS SCRIPT FETCHES THE CLIP SIZE OF THE INDICATED WEAPON.

NOTE: This is a somewhat cheesy way to fetch this value, so don't use it often, and be
      careful as to only input name of an item which actually is a weapon!

argument0 - (String)  Item name.

Returns - Clip size of the indicated weapon.
*/
var w_obj,son,val;

w_obj=real(inv_item_get_static_value(argument0,4));

son=instance_create((global.player_obj_id).x,(global.player_obj_id).y,w_obj);

val=son.b_clipsize;

remove(son);

return val;
