///ptc_create_particles(x,y,w,h,type,n,distribution,system depth)
/*

*/
var type,xx,yy,system,dist;

type=argument4;

if argument7=1
 system=global.ptc_system_back
 else if argument7=-1
  system=global.ptc_system_fore;

switch (argument6) begin

 case 0: //Random dispersion
  repeat (argument5) {

   xx=argument0+choose(0.5,-0.5)*random(argument2);
   yy=argument1+choose(0.5,-0.5)*random(argument3);
 
   part_particles_create(system,xx,yy,global.ptc_type[type],1);
 
   }
  exit;
 
 case 1: //Gaussian dispersion
  repeat (argument5) {
  
   dist=bias_0();

   xx=argument0+choose(0.5,-0.5)*argument2*dist;
   yy=argument1+choose(0.5,-0.5)*argument3*dist;
 
   part_particles_create(system,xx,yy,global.ptc_type[type],1);
 
   }
  exit;
 
 case -1: //Inverse-Gaussian dispersion
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
