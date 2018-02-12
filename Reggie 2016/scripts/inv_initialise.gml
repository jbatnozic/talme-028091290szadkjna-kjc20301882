///inv_initialise()
/*
THIS SCRIPT INITIALISES THE INVENTORY SYSTEM.

No arguments.

Returns nothing.
*/
var i;

//HERE IT CREATES A DYNAMIC MAP TO STORE ITEM DEFINITIONS:
global.inventory_map=ds_map_create();

//HERE WE DEFINE ITEM TYPES:
enum INV_TYPE {

 bulk=1,        
 weapon=2,
 offensive=2,   
 consumable=3,
 supportive=3,
 ammo=4,
 armour=5,
 defensive=5

}

//HERE WE DEFINE ITEMS TO BE USED LATER ON:
//Temporary items for testing:
inv_item_define("Jar",INV_TYPE.bulk,10,1,60,-1,0,"ABC",spr_item_jar);
inv_item_define("Dirt",INV_TYPE.bulk,10,1,60,-1,0,"DEF",spr_item_dirt);
inv_item_define("Human heart",INV_TYPE.bulk,10,4,15,-1,0,"GHI",spr_item_heart);

//Weapons:
inv_item_define("Machinegun",INV_TYPE.weapon,0,0,1,obj_weapon_machinegun,0,"A machinegun.",spr_item_weapon_default);
inv_item_define("M9",INV_TYPE.weapon,0,0,1,obj_weapon_m9,0,"M9 Berreta Pistol.",spr_item_weapon_default);
inv_item_define("Blunderbuss",INV_TYPE.weapon,0,15,1,obj_weapon_blunderbuss,0,"A Blunderbuss.",spr_item_weapon_default);
inv_item_define("Aarnd Family Rifle",INV_TYPE.weapon,0,0,1,obj_weapon_afr,0,"An Aarnd Family Rifle.",spr_item_weapon_default);
inv_item_define("Acid Flask Launcher",INV_TYPE.weapon,0,0,1,obj_weapon_afl,0,"An Acid Flask Launcher.",spr_item_weapon_default);
inv_item_define("Grenade Launcher",INV_TYPE.weapon,0,0,1,obj_weapon_gren_la,0,"A Grenade Launcher.",spr_item_weapon_default);
inv_item_define("Flamethrower",INV_TYPE.weapon,0,0,1,obj_weapon_flame,0,"A Flamethrower.",spr_item_weapon_default);

//Ammo:
inv_item_define("Bullet",INV_TYPE.ammo,0,0,1000,-1,0,"Ammo",spr_item_ammo_default);
inv_item_define("9mm Bullets",INV_TYPE.ammo,0,0,1000,-1,0,"Ammo for M9",spr_item_ammo_default);
inv_item_define("Blunder Bullets",INV_TYPE.ammo,0,0.1,1000,-1,0,"Ammo for Blunderbuss",spr_item_ammo_default);
inv_item_define("Alpha Bone",INV_TYPE.ammo,0,0,1000,-1,0,"Ammo for Blunderbuss",spr_item_ammo_default);
inv_item_define("Explosive Rounds",INV_TYPE.ammo,0,0,1000,-1,0,"Ammo for Aarnd Family Rifle",spr_item_ammo_default);
inv_item_define("AP Rounds",INV_TYPE.ammo,0,0,1000,-1,0,"Ammo for Aarnd Family Rifle",spr_item_ammo_default);
inv_item_define("Acid Flask",INV_TYPE.ammo,0,0,1000,-1,0,"Ammo for Acid FLask Launcher",spr_item_ammo_default);
inv_item_define("Grenade",INV_TYPE.ammo,0,0,1000,-1,0,"Ammo for Grenade Launcher",spr_item_ammo_default);
inv_item_define("Fuel",INV_TYPE.ammo,0,0,1000,-1,0,"Ammo for Flamethrower",spr_item_ammo_default);

//Consumable:
inv_item_define("Stimpack",INV_TYPE.consumable,0,1,100,-1,0,"A healing chem.",spr_item_consumable_default);
inv_item_define("Relaxer",INV_TYPE.consumable,0,1,100,-1,0,"Relaxer increases accuracy while slightly reducing the chance for a heart attack. The generic brand’s side effect is that it makes the player move slower (both in sprint and regular movement, including jumping and dodging) and slows stamina regen. ",spr_item_consumable_default);
inv_item_define("Jitter",INV_TYPE.consumable,0,1,100,-1,0,"Jitter increases movement speed, acceleration, and reload speed. The generic brand’s side effect is that it makes the player more inaccurate, as well as an even more increased chance (than typical) for a heart attack.",spr_item_consumable_default);
inv_item_define("CTW",INV_TYPE.consumable,0,1,100,-1,0,"Increases carry weight, stamina regen, jump distance, and increased resistance to being knocked away by larger Primals. The generic brand slows stops health natural health regen (in other words, it won’t round up to the nearest 10th) until the drug’s effects wear off completely.",spr_item_consumable_default);

//Bulk:
inv_item_define("Spare parts",INV_TYPE.bulk,0,0,1000,-1,0,"Mr. Fixit's best frend!",spr_item_bulk_default);

//Apparel:
inv_item_define("Bullet vest",INV_TYPE.armour,0,50,1,-1,0,"Defensive item.",spr_item_armour_default);

//HERE THE FIRST 15 INVENTORY SLOTS ARE GENERATED:
//(Others will be automatically added when they are needed.)
global.inventory_slots=0;
repeat (15) inv_add_slot();

//HERE THE global.inventory_list ARRAY IS SET UP (Empty for now):
for (i=1; i<=15; i+=1) begin
global.inventory_list[i]=-1;
end;

//QUICK ITEMS:
for (i=1; i<=5; i+=1) {
 inv_flush_quick(i); }
 
//ARMOUR:
inv_flush_armour();

//ACTIVE ITEM:
global.inventory_active=1;
