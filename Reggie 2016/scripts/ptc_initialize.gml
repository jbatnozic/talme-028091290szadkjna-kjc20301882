///ptc_initialize()
/*

*/
var a, i;

//Systems:
i = 0;

global.PTC_SYSTEM[i++] = part_system_create();
part_system_depth(i-1, +75);

global.PTC_SYSTEM[i++] = part_system_create();
part_system_depth(i-1, +25);

global.PTC_SYSTEM[i++] = part_system_create();
part_system_depth(i-1, +8);

global.PTC_SYSTEM[i++] = part_system_create();
part_system_depth(i-1, -8);

global.PTC_SYSTEM[i++] = part_system_create();
part_system_depth(i-1, -25);

global.PTC_SYSTEM[i++] = part_system_create();
part_system_depth(i-1, -75);

global.PTC_SYSTEM_COUNT = i;

for (i = i - 1; i >= 0; i -= 1) {
  part_system_automatic_update(i, false);
  part_system_draw_order(i, false);
  }
  
enum PTC_SYS {

  back_75,
  back_25,
  back_8,
  
  fore_8,
  fore_25,
  fore_75

  }

//Particle types:
enum PTC_TYPE {

  fire,
  bleed
  
  }

 //Definitions (STUB):
 
  //Fire:
  a=part_type_create();
  part_type_sprite(a,spr_ptc_fire_1,false,true,true);
  part_type_size(a,0.75,1.25,-0.002,0.002);
  part_type_speed(a,1,2,0,0);
  part_type_direction(a,90,90,0,1);
  part_type_orientation(a,0,360,0,5,false);
  
  part_type_colour3(a,c_yellow,c_orange,c_red);
  part_type_alpha3(a,0,1,0);
  part_type_blend(a,1);
  
  part_type_life(a,30,60);
  //part_type_death(SMOKE);
  
  global.ptc_type[PTC_TYPE.fire]=a;
  
  //Bleed: (STUB)

//Effect types:
enum PTC_EFF {

  acid,
  bleed,
  fire,
  poison
  
  }
  
enum PTC_DISTR {

  uniform = 0,
  gauss = 1,
  gauss_inv = -1

  }
