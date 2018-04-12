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

//Temporary items for testing:
rinv_define_item("Jar",         RINV_TYPE.bulk, 0, 1, false, -1, -1, spr_item_jar);
rinv_define_item("Dirt",        RINV_TYPE.bulk, 0, 1, false, -1, -1, spr_item_dirt);
rinv_define_item("Human heart", RINV_TYPE.bulk, 0, 4, false, -1, -1, spr_item_heart);

// Consumables:
rinv_define_item("Stimpack", RINV_TYPE.consumable, 0, 1, false, -1, RINV_SPR(spr_med_box), spr_item_consumable_default);
rinv_define_item("Relaxer",  RINV_TYPE.consumable, 0, 1, false, -1, RINV_SPR(spr_med_box), spr_item_consumable_default);
rinv_define_item("Jitter",   RINV_TYPE.consumable, 0, 1, false, -1, RINV_SPR(spr_med_box), spr_item_consumable_default);
rinv_define_item("CTW",      RINV_TYPE.consumable, 0, 1, false, -1, RINV_SPR(spr_med_box), spr_item_consumable_default);

// Temp:
var s = "Jitter increases movement speed, acceleration, and reload speed. The generic brand’s side effect is that it makes the player more inaccurate, as well as an even more increased chance (than typical) for a heart attack. ";

rinv_item_desc("Jitter", s + s + s + s + s);

//Weapons:
rinv_define_item("Machinegun",          RINV_TYPE.weapon, 0, 15, true, RINV_OBJ(obj_weapon_machinegun),  RINV_SPR(spr_weapon_box), spr_item_weapon_default);
rinv_define_item("M9",                  RINV_TYPE.weapon, 0, 15, true, RINV_OBJ(obj_weapon_m9),          RINV_SPR(spr_weapon_box), spr_item_weapon_default);
rinv_define_item("Blunderbuss",         RINV_TYPE.weapon, 0, 15, true, RINV_OBJ(obj_weapon_blunderbuss), RINV_SPR(spr_weapon_box), spr_item_weapon_default);
rinv_define_item("Aarnd Family Rifle",  RINV_TYPE.weapon, 0, 15, true, RINV_OBJ(obj_weapon_afr),         RINV_SPR(spr_weapon_box), spr_item_weapon_default);
rinv_define_item("Acid Flask Launcher", RINV_TYPE.weapon, 0, 15, true, RINV_OBJ(obj_weapon_afl),         RINV_SPR(spr_weapon_box), spr_item_weapon_default);
rinv_define_item("Grenade Launcher",    RINV_TYPE.weapon, 0, 15, true, RINV_OBJ(obj_weapon_gren_la),     RINV_SPR(spr_weapon_box), spr_item_weapon_default);
rinv_define_item("Flamethrower",        RINV_TYPE.weapon, 0, 15, true, RINV_OBJ(obj_weapon_flame),       RINV_SPR(spr_weapon_box), spr_item_weapon_default);
rinv_define_item("Revolver",            RINV_TYPE.weapon, 0, 5,  true, RINV_OBJ(obj_weapon_revolver),    RINV_SPR(spr_weapon_box), spr_item_weapon_default);
rinv_define_item("Bolt Action Rifle",   RINV_TYPE.weapon, 0, 15, true, RINV_OBJ(obj_weapon_bolt_action), RINV_SPR(spr_weapon_box), spr_item_weapon_default);
rinv_define_item("Assault Rifle",       RINV_TYPE.weapon, 0, 15, true, RINV_OBJ(obj_weapon_assault),     RINV_SPR(spr_weapon_box), spr_item_weapon_default);

rinv_item_desc("Machinegun", "An automatic firearm.");

//Ammo:
rinv_define_item("Bullet",           RINV_TYPE.ammo, 0, 0.1, false, -1, RINV_SPR(spr_ammo_box), spr_item_ammo_default);
rinv_define_item("9mm Bullets",      RINV_TYPE.ammo, 0, 0.1, false, -1, RINV_SPR(spr_ammo_box), spr_item_ammo_default);
rinv_define_item("Blunder Bullets",  RINV_TYPE.ammo, 0, 0.1, false, -1, RINV_SPR(spr_ammo_box), spr_item_ammo_default);
rinv_define_item("Alpha Bone",       RINV_TYPE.ammo, 0, 0.1, false, -1, RINV_SPR(spr_ammo_box), spr_item_ammo_default);
rinv_define_item("Explosive Rounds", RINV_TYPE.ammo, 0, 0.1, false, -1, RINV_SPR(spr_ammo_box), spr_item_ammo_default);
rinv_define_item("AP Rounds",        RINV_TYPE.ammo, 0, 0.1, false, -1, RINV_SPR(spr_ammo_box), spr_item_ammo_default);
rinv_define_item("Acid Flask",       RINV_TYPE.ammo, 0, 0.1, false, -1, RINV_SPR(spr_ammo_box), spr_item_ammo_default);
rinv_define_item("Grenade",          RINV_TYPE.ammo, 0, 0.1, false, -1, RINV_SPR(spr_ammo_box), spr_item_ammo_default);
rinv_define_item("Fuel",             RINV_TYPE.ammo, 0, 0.1, false, -1, RINV_SPR(spr_ammo_box), spr_item_ammo_default);

//Bulk:
rinv_define_item("Spare parts", RINV_TYPE.bulk, 0, 1, false, -1, -1, spr_item_bulk_default);

//Apparel:
rinv_define_item("Bullet vest", RINV_TYPE.armour, 0, 40, true, -1, -1, spr_item_armour_default);





