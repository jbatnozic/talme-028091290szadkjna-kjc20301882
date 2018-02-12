/*
THE SYSTEM USES THESE GLOBAL VARIABLES FOR MANAGING INVENTORY:

global.inventory_map     - ds_map which stores predefined items.
global.inventory_list    - A one-dimensional array which holds the inventory indexes
                           of up to 20 items of a certain type.
global.inventory_slots   - Integer which shows how many slots are currently in use.
                           (Empty or occupied.)
global.inventory_quick   - A two-dimensional array which holds quick items.
global.inventory_active  - Index [1..5] of the currently held and active item in quick
                           items.
global.inventory_current - A two-dimensional array which holds the player's current
                           inventory (look below).

global.inventory_current[a,1]: Item name 
global.inventory_current[a,2]: Item code (the item's static values)
global.inventory_current[a,3]: Current stack
global.inventory_current[a,4]: Custom (dynamic) value 1
global.inventory_current[a,5]: Custom (dynamic) value 2 ...

A Dynamic value must be either a real number or a string starting with %.

The name of an empty slot is now ZZZZZ, because it makes sorting the inventory much easier.
