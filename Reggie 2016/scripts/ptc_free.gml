///ptc_free()
/*

*/
var i;

for (i=0; i<array_length_1d(global.ptc_type); i+=1) begin

 part_type_destroy(global.ptc_type[i]);

end;

part_system_destroy(global.ptc_system_back);
part_system_destroy(global.ptc_system_fore);
