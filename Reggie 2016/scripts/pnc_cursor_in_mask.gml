///pnc_cursor_in_mask(h_pad,v_pad)
/*

*/
var mask,x1,y1,x2,y2,h_pad,v_pad;

if (mask_index<>-1)
  mask=mask_index;
  else
    mask=sprite_index;
    
h_pad=argument0;
v_pad=argument1;
    
x1=x+(sprite_get_bbox_left(mask)-sprite_get_xoffset(mask))*image_xscale;
y1=y+(sprite_get_bbox_top(mask)-sprite_get_yoffset(mask))*image_yscale;

x2=x+(sprite_get_bbox_right(mask)-sprite_get_xoffset(mask))*image_xscale;
y2=y+(sprite_get_bbox_bottom(mask)-sprite_get_yoffset(mask))*image_yscale;

return point_in_rectangle(mouse_x,mouse_y,x1-h_pad,y1-v_pad,x2+h_pad,y2+v_pad);
