///inv_flush_quick(index)
/*
THIS SCRIPT FLUSHES THE INDICATED QUICK ITEM SLOT.

argument0 - (Integer) Quick slot index.

Return nothng.
*/
var i;

i=argument0;

global.inventory_quick[i,1]="ZZZZZ";
global.inventory_quick[i,2]="";
global.inventory_quick[i,3]=0;
global.inventory_quick[i,4]=0;
global.inventory_quick[i,5]=0;
global.inventory_quick[i,6]=0;
global.inventory_quick[i,7]=0;
global.inventory_quick[i,8]=0;
