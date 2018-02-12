///journal_unlocked_entries()
/*
Counts the amount of unlocked entries (filled or not).

*/
counter=0;

if ds_grid_height(global.journal_grid)>0 {

 for (i=0; i<ds_grid_height(global.journal_grid); i+=1) begin
  if global.journal_grid[#1,i]<>-1 counter+=1;
 end;
 
 }

return counter;
