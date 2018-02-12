///armour_get_speed(Item name)
/*

Returns the speed penalty (modifier) given by wearing a suit of armour.

*/

switch (argument0) begin

 case "Bullet vest":
   return 0.9;
  break;
  
 default:
   show_error("Armour speed not defined! ("+argument0+")",true);
  break;
  
end;
