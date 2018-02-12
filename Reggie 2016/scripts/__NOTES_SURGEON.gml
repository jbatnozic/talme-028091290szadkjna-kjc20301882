/*
>>General notes:
   -- Additional, 'learned', recipes and repair items in Create events of their 
      respective window objects.
   -- The only "globalvar" left is for userControls.

   AI:
   ++_prefTolerance --> Error margin for preferred distance.
   
   OTHER:
   ++Save / Load actions MUST be in the Draw GUI event (because of the order of events).
   ++Shops' inventories do not increase when The Player sells something, but they
     do decrease when The Player buys something.
     
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
  
  Capitalize setting names
  Free entire current room in roomGoto ABS_END
  Window size setting
  Enemy animations
  Setting to turn splat surfaces on/off
  Sound (sfx system)
  
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
