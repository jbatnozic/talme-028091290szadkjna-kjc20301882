///journal_entry_filled(Entry name OR Entry index)
/*

argument0 - Entry name OR Entry index.

*/
var i;

if is_string(argument0)=true {

 //Error checking:
 if ds_grid_value_exists(global.journal_grid,0,0,0,ds_grid_height(global.journal_grid)-1,argument0)=false
  show_error("Trying to check a non-existing journal entry! (name not found)",true);

 //Finding entry:
 for (i=0; i<ds_grid_height(global.journal_grid); i+=1) begin
 
  if global.journal_grid[#0,i]=argument0
   break;
 
 end;

 //Returning value:
 if global.journal_grid[#2,i]<>""
  return true
  else
   return false;
  
 }
 else {
 
  //Error checking:
  if argument0>ds_grid_height(global.journal_grid)-1
   show_error("Trying to check a non-existing journal entry! (index too high)",true);
  
  //Returning value:
  if global.journal_grid[#2,argument0]<>""
   return true
   else
    return false;
 
  }
