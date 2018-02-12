///sett_define_value(Name, Type, Group, P1 / Min, P2 / Max, P3...);
/*

argument0 - (String)  Setting name.
argument1 - (Integer) Setting type.
argument2 - (Integer) Setting group.
argument3 - (   ?   ) Parameter 1.
argument4 - (   ?   ) Parameter 2.
argument5 - (   ?   ) Parameter 3.
argument6 - (   ?   ) Parameter 4.
argument7 - (   ?   ) Parameter 5.
...

*/
var i,c_h;

if ds_grid_value_exists(global.sett_grid,0,0,0,ds_grid_height(global.sett_grid)-1,argument[0])=true
 show_error("Setting with a same name already exists: "+argument[0],true);

//Generate new row:
 c_h=ds_grid_height(global.sett_grid);

 ds_grid_resize(global.sett_grid,18,c_h+1);

//Add data:

 //General:
 global.sett_grid[#0,c_h]=argument[0];
 global.sett_grid[#1,c_h]=argument[1];
 global.sett_grid[#2,c_h]=argument[2];
 global.sett_grid[#3,c_h]="No description.";
 global.sett_grid[#4,c_h]=argument_count-3;
 
 //Parameters:
 for (i=3; i<=15; i+=1) begin
 
  if argument_count>i {
   //if argument[0]="GUI Scale" show_message("Writing to SETT GRID: x="+string(i+2)+"; y="+string(c_h)+"; argument= "+argument[i]);
   global.sett_grid[#i+2,c_h]=argument[i];
   }
   else
    global.sett_grid[#i+2,c_h]="";
   
 end;
