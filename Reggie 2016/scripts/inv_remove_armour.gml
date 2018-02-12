///inv_remove_armour()
/*

*/

inv_add_set_item(global.inventory_armour[1],
                 global.inventory_armour[3],
                 global.inventory_armour[4],
                 global.inventory_armour[5],
                 global.inventory_armour[6],
                 global.inventory_armour[7],
                 global.inventory_armour[8]);
                 
inv_flush_armour();

(global.player_obj_id)._armour=0;
