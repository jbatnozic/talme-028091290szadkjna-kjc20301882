///pspec_rinv_initialize()
/*

*/

rinv_initialize();

var j = rinv_create();

rinv_set_default(j);
rinv_reserve_slots(j, 6);

global.rinv_player_inv  = j;
global.rinv_active_slot = 0;

// ITEM DEFINITIONS:
rinv_define_item("Stimpack", INV_TYPE.consumable, 0, 1, false, -1, -1, spr_item_consumable_default);
rinv_define_item("Relaxer",  INV_TYPE.consumable, 0, 1, false, -1, -1, spr_item_consumable_default);
rinv_define_item("Jitter",   INV_TYPE.consumable, 0, 1, false, -1, -1, spr_item_consumable_default);
rinv_define_item("CTW",      INV_TYPE.consumable, 0, 1, false, -1, -1, spr_item_consumable_default);

var s = "Jitter increases movement speed, acceleration, and reload speed. The generic brand’s side effect is that it makes the player more inaccurate, as well as an even more increased chance (than typical) for a heart attack. ";

rinv_item_desc("Jitter", s+s+s+s+s);

rinv_define_item("Machinegun", RINV_TYPE.weapon, 0, 5, true, obj_weapon_machinegun, -1,spr_item_weapon_default);
  rinv_item_desc_to_last("An automatic firearm.");  

rinv_define_item("Bullet", RINV_TYPE.ammo, 0, 0, false, -1, -1, spr_item_ammo_default);

rinv_define_item("Jar", RINV_TYPE.bulk, 0, 2, true, -1, -1, spr_item_jar);

rinv_define_item("Heart", RINV_TYPE.bulk, 0, 2, true, -1, -1, spr_item_base_new);

rinv_define_item("Spare parts", RINV_TYPE.bulk, 0, 1, false, -1, -1, spr_item_bulk_default);





