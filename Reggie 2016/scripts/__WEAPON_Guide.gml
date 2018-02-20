/*
WELCOME TO SURGEON_'S COMPREHENSIVE GUIDE TO CREATING YOUR OWN WEAPON!
(Note that there are obj_weapon_template and obj_machinegun as examples, as well as the
 following items: Bullet and Machinegun, defined in the inv_inititalise() script. I recommend
 looking at those examples and reading this carefully before creating any weapons.)
 
IMPORTANT: Due to some changes, bullet scatter is now in the weapon_add_firing_mode(...)
           script; this script now also defines the name of the new firing mode as the
           second argument, so you may need to rearrange the arguments; the requested 
           Bullet Number value is now in weapon_add_ammo_type(...) script as the 5th
           argument.

1. Create the weapon object.

2. Call it what you like.

3. Create the corresponding inventory item using inv_item_define (in this function the 6th
   argument, objequipped will be the name of the object you just created, but without
   quotes).
   
4. Create one or more inventory objects that will be used as ammo for the weapon (their
   names will be used as the second argument in the weapon_add_ammo_type(...) script).
   
5. Prepare not to be scared off by the size of the scripts that follow :P

6. In the weapon object's Create event drop a block of code and write the following
   functions:
    weapon_initialise(...),
    weapon_set_basics(...),
    weapon_set_sprite(...),
    weapon_set_sounds(...),
    weapon_add_firing_mode(...),
    weapon_add_ammo_type(...).
   In the fields which require ID, just write "id", but without the quotes.
   For other fields, consult the scripts under Local--> Weapons for detailed explanations.
   
7. In the weapon object's Step event drop a block of code and write exactly the following:
   ///Weapon action
   if !game_paused() begin

   weapon_set_position(id,15,80);
   weapon_execute(id);
   weapon_update(id);
   
   if special_action=true {
    special_action=false;
    }
 
   end;
   
   The only script you can change here is weapon_set_position(...) consult it in the same place
   as other script for details.
   
8. In the weapon object's Draw event drop a block of code and write exactly the following:
   ///Draw self:
   var a;

   if mouse_x>x a=1 else a=-1;

   draw_sprite_ext(sprite_index,image_index,x,y,1,a,image_angle,c_white,1);
   
9. Celebrate, because your work here is done! :D

*IMPORTANT: Some information on how weapons work, regardless of their specs:
  -The damage output of a weapon depends on its condition. A weapon that is repaired
   beyond 75% will deal full damage. If its condition falls below 75% (through use), its
   damage will also decrease towards 33% of its maximum damage, eventually becoming
   completely unusable if its condition reaches 0% (It will need to be repaired before
   it can be used again).
  -The weapon's condition has one more effect: If the weapon is in bad condition (less
   than 75%) there will be a chance for the weapon to jam when Reggie tries to reload it
   (A jammed weapon will take twice as long to reload), and this chance will increase as
   the weapon's condition decreases. See weapon_set_basics(...) script and its 5th argument
   (JamChance) for more info on this.
  -A weapon may have multiple firing modes, added by using the weapon_add_firing_mode(...)
   script. The player may cycle through these modes by pressing M. This control can be
   changed in game_init() script.
  -If a weapon still has ammo in the clip but isn't completely full, it can be manually
   reloaded by pressing R. This control can be changed in game_init() script. This won't
   be possible if the player has no ammo left in his inventory.
  -Holding the reload button will unload all ammo from the weapon. This needs to be done
   before the ammo can be traded with. This is a precaution so the player doesn't 
   accidently sell any ammo that's currently loaded in a weapon. (Any ammo not currently
   loaded in a weapon can be traded with freely, regardless of this) This option will also
   be available through the inventory window.
  -A weapon may accept multiple types of different ammo. These may be added by using the
   weapon_add_ammo_type(...) script, and the player may scroll through them by pressing T.
   This control can be changed in game_init() script. Note that every time the ammo used
   if changed, the weapon will need to be reloaded again (to unload old ammo and add new).
  -A weapon must have at least one firing mode and one accepted ammo type!
  
*** The end ***
