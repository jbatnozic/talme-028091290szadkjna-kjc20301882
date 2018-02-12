///armour_max_dur(Item name)
/*

*/

switch (argument0) begin

 case "Bullet vest":
   return 50;
  break;
  
 default:
   show_error("Armour max_dur not defined! ("+argument0+")",true);
  break;
  
end;
