///ptc_free()
/*

*/
var i;

for (i=0; i<array_length_1d(global.ptc_type); i+=1) begin

 part_type_destroy(global.ptc_type[i]);

end;

for (i = 0; i < global.PTC_SYSTEM_COUNT; i += 1) {

  part_system_destroy(global.PTC_SYSTEM[i]);

  }
  
global.PTC_SYSTEM_COUNT = 0;
