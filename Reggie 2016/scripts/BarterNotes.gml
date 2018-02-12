/*
THE SYSTEM USES THESE GLOBAL BARIABLES FOR MANAGING BARTERING:

global.barter_list - Handle of the ds_list used to store other ds_lists which then hold
                     various bartering combinations, or -1 if shops are closed.
global.barter_map -  Handle of the ds_map used to temporarly store the shop's inventory
                     or -1 if shops are closed.

global.barter_string - A very long string which will hold the inventories of all shops.
                       (Format: %1b%[Name]|[Amount]\...[Name]|[Amount]\%1e%%2b%... )
                       
SHOP CREATION:
1. Create a new enumerator.
2. shop_initialise(...) to the game_init();
