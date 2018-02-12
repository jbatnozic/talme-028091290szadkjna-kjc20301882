///shop_initialise(Index)
/*
THIS SCRIPT INITIALISES A NEW SHOP. THIS IS ONLY REQUIRED WHEN STARING A NEW GAME, OTHERWISE
THE DATA GENERATED THIS WAY WILL BE LOADED FROM A SAVE FILE.    

argument0 - (Integer) Shop index.

Returns nothing.
*/

// One entry is added into the shop's inventory upon its initialisation - The code
// for a default item (empty slot); this will not be visible by any means, but will prevent
// running into errors with the shop_write(...) script.

global.barter_string+="%"+string(argument0)+"b%[ZZZZZ]|[0]\%"+string(argument0)+"e%";
