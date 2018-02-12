///inv_add_slot()
/*
THIS SCRIPT CREATES ANOTHER INVENTORY SLOT:

No arguments.

Returns nothing.
*/

global.inventory_current[global.inventory_slots+1,1]="ZZZZZ";
global.inventory_current[global.inventory_slots+1,2]="";
global.inventory_current[global.inventory_slots+1,3]=0;

global.inventory_current[global.inventory_slots+1,4]=0;
global.inventory_current[global.inventory_slots+1,5]=0;
global.inventory_current[global.inventory_slots+1,6]=0;
global.inventory_current[global.inventory_slots+1,7]=0;
global.inventory_current[global.inventory_slots+1,8]=0;

global.inventory_slots+=1;
