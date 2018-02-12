///hg_ds_map_find_key(Map, Value)
/*

 Returns one of the keys with the specified value, or undefined if no
 keys have that value.

*/
var i,size,last,key;

size=ds_map_size(argument0);
key=ds_map_find_first(argument0);
last=ds_map_find_last(argument0);

while (true) {
    
 if (argument0[?key]=argument1)
  return key;
  
 if (key<>last)  
  key=ds_map_find_next(argument0,key)
  else
   break;

 }
 
return undefined;
