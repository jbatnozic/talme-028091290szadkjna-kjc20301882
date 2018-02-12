/*
HOW TO DEFINE AN ITEM AS A "REPAIR ITEM" (An item which can be used to repair other items):

1. Open the repair_initialise() script.

2. There's a section named "REPAIR ITEMS". There use the repair_define_repair_item(...) - 
   The first argument is the name of the item which you want to define as a "Repair item",
   the second argument is its potency - how much durability this item restores to a weapon
   or another item being repaired.
   
NOTE: The player will always be able to use items defined in this way to repair other items,
      so long as they have them in their inventory. If you want to make it so that, for
      example, the player needs training from a NPC before they can use a certain item to do
      repairs, this will need to be coded in another way.
      
*** The end ****/
