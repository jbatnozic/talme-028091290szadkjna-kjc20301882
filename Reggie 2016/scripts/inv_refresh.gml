///inv_refresh()
/*
THIS SCRIPT SETS THE ITEMS WHOSE AMOUNTS REACH ZERO TO EMPTY AND CALLS inv_compress(),
WHICH MOVES ALL ITEMS SO THAT THERE ARE NO EMPTY SLOTS IN BETWEEN.

No arguments.

Returns nothing.
*/

var i;

for(i=1; i<=global.inventory_slots; i+=1) begin

if global.inventory_current[i,3]<1 {

global.inventory_current[i,1]="ZZZZZ";
global.inventory_current[i,2]="";
global.inventory_current[i,3]=0;
global.inventory_current[i,4]=0;
global.inventory_current[i,5]=0;
global.inventory_current[i,6]=0;
global.inventory_current[i,7]=0;
global.inventory_current[i,8]=0;

}

end;

for(i=1; i<=5; i+=1) begin

if global.inventory_quick[i,3]<1 {

global.inventory_quick[i,1]="ZZZZZ";
global.inventory_quick[i,2]="";
global.inventory_quick[i,3]=0;
global.inventory_quick[i,4]=0;
global.inventory_quick[i,5]=0;
global.inventory_quick[i,6]=0;
global.inventory_quick[i,7]=0;
global.inventory_quick[i,8]=0;

}

end;

inv_compress();
