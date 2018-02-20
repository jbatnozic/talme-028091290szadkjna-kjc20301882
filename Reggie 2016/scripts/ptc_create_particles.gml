///ptc_create_particles(x, y, w, h, type, n, [PTC_DISTR enum] distro, [PTC_SYS enum] system)
/*

*/
var type, xx, yy, system, dist;

type = argument4;

system = global.PTC_SYSTEM[argument7];
  
switch (argument6) begin

 case PTC_DISTR.uniform: //Random dispersion
  repeat (argument5) {

   xx=argument0+choose(0.5,-0.5)*random(argument2);
   yy=argument1+choose(0.5,-0.5)*random(argument3);
 
   part_particles_create(system,xx,yy,global.ptc_type[type],1);
 
   }
  exit;
 
 case PTC_DISTR.gauss: //Gaussian dispersion
  repeat (argument5) {
  
   dist=bias_0();

   xx=argument0+choose(0.5,-0.5)*argument2*dist;
   yy=argument1+choose(0.5,-0.5)*argument3*dist;
 
   part_particles_create(system,xx,yy,global.ptc_type[type],1);
 
   }
  exit;
 
 case PTC_DISTR.gauss_inv: //Inverse-Gaussian dispersion
  repeat (argument5) {
  
   dist=bias_1();

   xx=argument0+choose(0.5,-0.5)*argument2*dist;
   yy=argument1+choose(0.5,-0.5)*argument3*dist;
 
   part_particles_create(system,xx,yy,global.ptc_type[type],1);
 
   }
  exit;
 
 default:
  exit;
  
end;
