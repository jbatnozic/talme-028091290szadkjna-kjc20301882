///journal_fill_entry(Name, Writing, Keyword index [1..8])
/*

*/
var i;

//Error checking:
if ds_grid_value_exists(global.journal_grid,0,0,0,ds_grid_height(global.journal_grid)-1,argument0)=false
 show_error("Trying to fill a non-existing journal entry!",true);

//Finding entry:
for (i=0; i<ds_grid_height(global.journal_grid); i+=1) begin
 
 if global.journal_grid[#0,i]=argument0
  break;

end;

//Filling entry:
 //Keyword:
 global.journal_grid[#2,i]=global.journal_grid[#3+argument2,i];
 
 //Desc:
 global.journal_grid[#3,i]=global.journal_grid[#3,i]+"##  "+argument1;

//Awarding the player:
journal_award(argument0);
