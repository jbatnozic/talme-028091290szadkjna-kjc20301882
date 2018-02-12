///draw_bbox(Angle,Colour)
/*
NOTE: This function is very unoptimized and should be used only for debugging.
*/
var x1,x2,y1,y2;

x1=(-sprite_get_xoffset(sprite_index)+sprite_get_bbox_left(sprite_index))*image_xscale;
x2=(-sprite_get_xoffset(sprite_index)+sprite_get_bbox_right(sprite_index))*image_xscale;

y1=(-sprite_get_yoffset(sprite_index)+sprite_get_bbox_top(sprite_index))*image_yscale;
y2=(-sprite_get_yoffset(sprite_index)+sprite_get_bbox_bottom(sprite_index))*image_yscale;

draw_set_colour(argument1);

draw_line(x+x_rotated(x1,y1,argument0),y+y_rotated(x1,y1,argument0),x+x_rotated(x2,y1,argument0),y+y_rotated(x2,y1,argument0));
draw_line(x+x_rotated(x2,y1,argument0),y+y_rotated(x2,y1,argument0),x+x_rotated(x2,y2,argument0),y+y_rotated(x2,y2,argument0));
draw_line(x+x_rotated(x2,y2,argument0),y+y_rotated(x2,y2,argument0),x+x_rotated(x1,y2,argument0),y+y_rotated(x1,y2,argument0));
draw_line(x+x_rotated(x1,y2,argument0),y+y_rotated(x1,y2,argument0),x+x_rotated(x1,y1,argument0),y+y_rotated(x1,y1,argument0));
