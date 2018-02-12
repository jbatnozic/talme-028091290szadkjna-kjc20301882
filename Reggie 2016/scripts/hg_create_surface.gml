///hg_create_surface(Width, Height)
/*

 Underlying HG script.

 A more secure way to create surfaces.

*/
var t,mt,surf;

mt=global.HG_SC_MAX_TIME;

t=get_timer();

surf=surface_create(argument0,argument1);

if surface_exists(surf)
  return surf;

while (true) begin

 surf=surface_create(argument0,argument1);
 
 if surface_exists(surf)
  return surf;
  
 if (get_timer()-t)>=mt
  return -1;

end;
