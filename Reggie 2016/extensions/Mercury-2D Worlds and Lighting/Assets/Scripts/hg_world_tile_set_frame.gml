///hg_world_tile_set_frame(World, X, Y, Type, Frame, CellSize)
/*

 Underlying HG script.

*/
var type,tilemap,key,tile,frame,sep,cs;

type=argument3;
frame=argument4;
cs=argument5;

tilemap=hg_world_get_attribute(argument0,"tileMap");
key="tile_"+string(argument1)+"_"+string(argument2);

if !ds_map_exists(tilemap,key) exit;

//Delete old tile:
hg_tilemap_delete_tile(tilemap,argument1,argument2);

//Create new tile:
var bck=type[|HG_TPROP.tileBck],
    bw=background_get_width(bck),
    pad=type[|HG_TPROP.padding],
    sep=type[|HG_TPROP.sep],
    left=type[|HG_TPROP.tileL]+pad,
    top=type[|HG_TPROP.tileT]+pad,
    width=type[|HG_TPROP.tileW],
    height=type[|HG_TPROP.tileH],
    dpth=type[|HG_TPROP.depth],
    alp=type[|HG_TPROP.alpha];

left+=(width+sep)*frame;

while (left>background_get_width(bck)-1) {

 left-=(bw+sep);
 top+=height+sep;

 }
    
width=type[|HG_TPROP.tileW]-2*pad;
height=type[|HG_TPROP.tileH]-2*pad;
  
tile=tile_add(bck,left,top,width,height,argument1*(cs),argument2*(cs),dpth);
tile_set_alpha(tile,alp);

tilemap[?key]=tile;
