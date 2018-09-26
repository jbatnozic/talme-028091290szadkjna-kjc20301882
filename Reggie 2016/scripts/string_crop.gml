///string_crop(string)
/*

*/

var i, t, len;

len = string_length(argument0);

for (i = 1; i <= len; i += 1) {

  var c = string_char_at(argument0, i);

  if (c != " " && c != chr(9)/*TAB*/) break;

  }
  
for (t = len; t >= 1; t -= 1) {

  var c = string_char_at(argument0, t);

  if (c != " " && c != chr(9)/*TAB*/) break;

  }
  
return string_copy(argument0, i, t - i + 1);
