///cha_draw_channel_bar(Text, Percentage)
/*

*/
var xx,yy,col;

xx=gui_width()/2;
yy=32;
col=c_blue;

draw_sprite(spr_channel_bar,0,xx,yy);

var w=sprite_get_width(spr_channel_bar);
var h=sprite_get_height(spr_channel_bar);
draw_sprite_part_ext(spr_channel_bar,1,0,0,w*argument1,h,xx-w/2,yy-h/2,1,1,col,1);

draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_color(c_white);
draw_set_alpha(1);

draw_text(xx,yy,argument0);
