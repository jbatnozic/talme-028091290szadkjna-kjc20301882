///journal_define_entry(Name, Description, Keyword 1, Keyword 2, ...)
/*

argument0 - Name
argument1 - Desc

argument2 - Keyword 1
argument3 - Keyword 2
...

Returns nothing.
*/
var i,c_h;

if ds_grid_value_exists(global.journal_grid,0,0,0,ds_grid_height(global.journal_grid)-1,argument[0])=true
 show_error("Entry with a same name already exists: "+argument[0],true);

//Generate new row:
 c_h=ds_grid_height(global.journal_grid);

 ds_grid_resize(global.journal_grid,12,c_h+1);

//Add data:

 //General:
 global.journal_grid[#0,c_h]=argument[0];
 global.journal_grid[#1,c_h]=-1;
 global.journal_grid[#2,c_h]="";
 global.journal_grid[#3,c_h]=argument[1];
 
 //Possible keyowrds:
 for (i=1; i<=8; i+=1) begin
 
  if argument_count>=i+2
   global.journal_grid[#i+3,c_h]=argument[i+1];
   else
    global.journal_grid[#i+3,c_h]="";
   
 end;
