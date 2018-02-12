///armour_get_streq(Item name)
/*

Returns the stamina requirement increase (modifier) given by wearing a suit of armour.

*/

switch (argument0) begin

 case "Bullet vest":
   return 1.15;
  break;
  
 default:
   show_error("Armour streq not defined! ("+argument0+")",true);
  break;
  
end;
