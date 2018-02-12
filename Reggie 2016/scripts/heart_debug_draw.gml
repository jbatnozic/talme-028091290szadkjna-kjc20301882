///heart_debug_draw(X, Y)
/*

Draws Heart parameters at the specified location.

*/
var chance;

draw_set_colour(c_white);
draw_set_alpha(0.5);
 draw_rectangle(argument0-8,argument1-8,argument0+96+16,argument1+170+8,false);
draw_set_alpha(1);

draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_colour(c_maroon);

draw_rectangle(argument0,argument1,argument0+(global.heart_meter_prim/HEART.max_prim_mod)*96,argument1+16,false);
 draw_text(argument0,argument1+32,"I:  "+string(global.heart_meter_prim/10)+"%");

draw_rectangle(argument0,argument1+35,argument0+(global.heart_meter_sec/HEART.max_sec_mod)*96,argument1+51,false);
 draw_text(argument0,argument1+67,"II: "+string(global.heart_meter_sec));

chance=(global.heart_meter_prim*global.heart_meter_sec)/(HEART.max_prim_mod*HEART.max_sec_mod);
draw_rectangle(argument0,argument1+70,argument1+(chance)*96,argument1+86,false);
 draw_text(argument0,argument1+102,"Chance: "+string(heart_get_ha_chance())+"%");
 
draw_set_colour(c_white);

draw_rectangle(argument0,argument1,argument0+96,argument1+16,true);
draw_rectangle(argument0,argument1+35,argument0+96,argument1+51,true);
draw_rectangle(argument0,argument1+70,argument1+96,argument1+86,true);

draw_line(argument0,argument1+105,argument0+96,argument1+105);

draw_set_colour(c_maroon);
draw_set_valign(fa_top);

draw_text(argument0,argument1+108,"Admin mod: "+string(global.heart_admin_mod)+
                                  "#Counter: "+string(global.heart_time_passed)+
                                  "#Safe period: "+ite_ext(global.heart_time_passed<=HEART.safe_period,"Yes","No")+
                                  "#Damage mod: "+string(30-HEART.max_ter_mod*((global.player_obj_id)._health/PLAYER.topHealth))+"%"
                                  );
