///HG_type_set_visual(Type, Sprite, Alpha, Depth, ShadowStrength, ShadowColour)
/*

 See Mercury's Manual, section "Types".

*/
var list;

if is_string(argument0)
 list=global.HG_TYPE_MAP[?argument0]
 else
  list=argument0;
  
list[|HG_TPROP.sprite]=argument1; 
list[|HG_TPROP.alpha]=argument2; 
list[|HG_TPROP.depth]=argument3;
list[|HG_TPROP.shadowStr]=argument4;
list[|HG_TPROP.shadowCol]=argument5;
