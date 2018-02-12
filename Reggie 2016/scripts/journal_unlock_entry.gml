///journal_unlock_entry(Name)
/*

argument0 - Entry name

Returns nothing.
*/
var i;

//Error checking:
if ds_grid_value_exists(global.journal_grid,0,0,0,ds_grid_height(global.journal_grid)-1,argument0)=false
 show_error("Trying to unlock a non-existing journal entry!",true);

//Finding entry:
for (i=0; i<ds_grid_height(global.journal_grid); i+=1) begin
 
 if global.journal_grid[#0,i]=argument0
  break;

end;

if global.journal_grid[#1,i]<>-1 exit;

//Adjusting counter:
global.journal_grid[#1,i]=global.journal_counter;

global.journal_counter+=1;
