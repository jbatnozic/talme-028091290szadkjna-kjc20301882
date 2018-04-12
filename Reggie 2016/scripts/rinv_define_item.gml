///rinv_define_item(Name, Type, Rarity, Weight, Complex, OWE, OWD, Icon)
/*
THIS SCRIPT PREDEFINES AN ITEM'S STATIC VALUES FOR LATER USE:

argument0 - (String)  Item name.
argument1 - (Integer) Item type.
argument2 - (Integer) Rarity.
argument3 - (Integer) Weight.
argument4 - (Boolean) Complex item? Complex items have their dynamic values and can't stack
argument5 - (Integer) Object when equipped (-1 if can't equip).
argument6 - (Integer) Object / Sprite when dropped  (-1 if can't drop).
argument7 - (Integer) Icon.

Returns nothing.
*/
var grid = global.rinv_def_grid,
    map  = global.rinv_def_map;
    
var h = ds_grid_height(grid);

ds_grid_resize(grid, RINV_STATIC.property_count, h + 1);

// Set properties:
grid[#RINV_STATIC.name,    h] = argument0;
grid[#RINV_STATIC.type,    h] = argument1;
grid[#RINV_STATIC.rarity,  h] = argument2;
grid[#RINV_STATIC.weight,  h] = argument3;
grid[#RINV_STATIC.complex, h] = argument4;
grid[#RINV_STATIC.objwe,   h] = argument5;
grid[#RINV_STATIC.objwd,   h] = argument6;
grid[#RINV_STATIC.desc,    h] = "No description.";
grid[#RINV_STATIC.icon,    h] = argument7;

// Map:
map[?argument0] = h;
