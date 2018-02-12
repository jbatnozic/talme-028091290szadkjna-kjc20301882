///inv_flush_slot(index)
/*
THIS SCRIPT EMPTIES A SINGLE INVENTORY SLOT.

argument0 - (Integer) Slot index.

Returns nothing.
*/
var i;

i=argument0;

global.inventory_current[i,1]="ZZZZZ";
global.inventory_current[i,2]="";
global.inventory_current[i,3]=0;
global.inventory_current[i,4]=0;
global.inventory_current[i,5]=0;
global.inventory_current[i,6]=0;
global.inventory_current[i,7]=0;
global.inventory_current[i,8]=0;
