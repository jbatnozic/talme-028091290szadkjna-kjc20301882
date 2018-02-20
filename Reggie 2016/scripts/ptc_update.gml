///ptc_update()
/*

*/
var i;

for (i = 0; i < global.PTC_SYSTEM_COUNT; i += 1) {

  part_system_update(global.PTC_SYSTEM[i]);

  }
