///set_mask(Sprite)
/*

*/
var __h1,__h2;

if (mask_index=argument0) exit;

__h1=_height;

mask_index=argument0;

_height=sprite_get_height(mask_index);
_width=sprite_get_width(mask_index);

__h2=_height;

y+=(__h1-__h2)/2;
