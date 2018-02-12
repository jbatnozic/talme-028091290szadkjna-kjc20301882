///journal_write(Part [0..1])
/*

*/

switch (argument0) begin

 case 0:
   return ds_grid_write(global.journal_grid);
  break;
  
 case 1:
   return ds_list_write(global.journal_list);
  break;
  
 default:
   show_error("SCRIPT: journal_write; ERROR: Wrong argument;",true);
  break;
  
end;
