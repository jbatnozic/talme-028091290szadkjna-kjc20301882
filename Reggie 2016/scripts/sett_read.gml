///sett_read(String)
/*

*/
var k,l,setmap,auxmap;

setmap=global.sett_map;
auxmap=ds_map_create();

ds_map_read(auxmap,argument0);

k=ds_map_find_first(auxmap);
l=ds_map_find_last(auxmap);

while (true) {
  
  setmap[?k]=auxmap[?k];
  
  if (k==l)
    break;
    else {
      k=ds_map_find_next(auxmap,k);
      }

  }
  
ds_map_destroy(auxmap);
