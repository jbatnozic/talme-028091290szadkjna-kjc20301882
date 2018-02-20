/*
>>General notes:
   -- Additional, 'learned', recipes and repair items in Create events of their 
      respective window objects.
   -- The only "globalvar" left is for userControls.

   INTERACTIONS:
   -- pnc_reset in Begin Step (by obj_game_controller)
   -- pnc_set_tooltip in Step (by any object)
   -- pnc_is_target in End Step (by any object)
   
   AI:
   ++_prefTolerance --> Error margin for preferred distance.
   
   OTHER:
   ++Any actions in the Draw GUI End event must be surrounded with if (game_is_initialized()) {...}
   ++Shops' inventories do not increase when The Player sells something, but they
     do decrease when The Player buys something.
     
   ROOM INITIALIZATION ORDER:
   1. obj_initializer
   2. obj_hg_controller
   3. obj_game_controller
   4. obj_aux_controller
   5. obj_camera_foot
     
   OBJECT DEPTHS: [Objects with higher depths go first]
   -150 Finite state machines
   -125 Mercury controller
   -105 GUI window objects
   -100 Main game controller*
   -099 Channel bar
   -098 Bubble text
   ...
   -001 Player object
   ...
   +100 Scenery controller
   
   *-The save/load mechanism depends on the Main game controller being right after
     GUI window objects in execution (because of the secondary initialization).
   *-Any [PnC] interaction code must be after the Step event, with a depth higher
     than 100.
    
>>To do:
  
  Reggie's legs when close to the ground but not quite on the groud
  Fix guns stuff
  Dialogs should pause the game or something
  Capitalize setting names
  Free entire current room in roomGoto ABS_END
  Window size setting
  Enemy animations
  Setting to turn splat surfaces on/off
  Sound (sfx system)
  Fix 'dirs' in obj_gui_load_game
  Forced interpolation when downscaling the UI
  
  -Polish:
   Rewrite screen_shake
   
  -AI commands:
   ai_force_animation()

  -Optimization notes:
   -activating / deactivating
   -In AI parent objects, exchange some collision functions with simple collisions.
   
  ~Can't repair and similar while in combat (player_is_in_combat())
  -Toolbox
  -Crafting/repairing benches/stations.
  ~Impact damage. (Add some particles)
  ~Frame skipping.
  -Sound on repair.
    
  ~Inventory:
   -Drop item.
   -Automatic inv_refresh() when removing items.
   
  -AI:
   -Avoid damaging objects.
   -Enumerate Speeds for different states.
   -Better falling back.
   ~NOTE: Long hidden timers (~20 sec).
   -Change state if isn't moving or attacking.
   -Save old statePrevious for smoothing image.
   ~Fix Morale calculations.

  +Barter.
   -Sounds on trade / craft.
  
  -Weapons:
   -Rebalance random_dur and random_ammo scripts. <-- Discuss with Cory.
