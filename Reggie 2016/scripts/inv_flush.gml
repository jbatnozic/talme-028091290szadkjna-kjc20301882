///inv_flush()
/*
THIS SCRIPT EMPTIES THE WHOLE INVENTORY.

No arguments.

Returns nothing.
*/
var i;

for (i=1; i<=global.inventory_slots; i+=1) begin

global.inventory_current[i,1]="ZZZZZ";
global.inventory_current[i,2]="";
global.inventory_current[i,3]=0;
global.inventory_current[i,4]=0;
global.inventory_current[i,5]=0;
global.inventory_current[i,6]=0;
global.inventory_current[i,7]=0;
global.inventory_current[i,8]=0;

end;
