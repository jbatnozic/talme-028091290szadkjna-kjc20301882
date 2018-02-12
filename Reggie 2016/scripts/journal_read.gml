///journal_read(Part [0..1], String)
/*

*/

switch (argument0) begin

 case 0:
   ds_grid_read(global.journal_grid,argument1);
  break;
  
 case 1:
   ds_list_read(global.journal_list,argument1);
  break;
  
 default:
   show_error("SCRIPT: journal_read; ERROR: Wrong argument;",true);
  break;
  
end;
