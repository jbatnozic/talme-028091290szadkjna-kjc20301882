///string_trim(String, Header, Footer, Total)
/*

argument0 - (String)  The original string.
argument1 - (String)  Desired header.
argument2 - (String)  Desired footer.
argument3 - (Boolean) Whether to crop header and footer too.

*/
var pos1,pos2,new_str;

if argument3=true
  pos1=string_pos(argument1,argument0)+string_length(argument1)
 else pos1=string_pos(argument1,argument0);

if argument3=true
  pos2=string_pos(argument2,argument0)
 else pos2=string_pos(argument2,argument0)+string_length(argument2);

new_str=string_copy(argument0,pos1,pos2-pos1);

return new_str;
