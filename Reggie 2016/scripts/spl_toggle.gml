///spl_toggle(Bool)
/*

*/

switch (argument0) {

  case 0:
    spl_free();
    global.SPLAT_ENABLED=0;
    break;
    
  case 1:
    global.SPLAT_ENABLED=1;
    break;
    
  default:
    break;

  }
