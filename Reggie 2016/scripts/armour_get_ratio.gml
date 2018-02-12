///armour_get_ratio(Item name)
/*

Returns the HP to protection ratio of the specified armour item.

*/

switch (argument0) begin

 case "Bullet vest":
   return 1;
  break;
  
 default:
   show_error("Armour ratio not defined! ("+argument0+")",true);
  break;
  
end;
