///player_update_hands()
/*

*/

remove(weaponHoldingPar);

var ras = global.rinv_active_slot;

if (rinv_item_is_null(-1, ras)) exit;

var static_id = rinv_local_to_static(-1, ras);

if (rinv_item_get_static_value(static_id, RINV_STATIC.type) != RINV_TYPE.weapon) exit;

var obj_id = rinv_item_get_static_value(static_id, RINV_STATIC.objwe);

weapon_create((global.player_obj_id).x,
              (global.player_obj_id).y - 20,
              obj_id, ras);
