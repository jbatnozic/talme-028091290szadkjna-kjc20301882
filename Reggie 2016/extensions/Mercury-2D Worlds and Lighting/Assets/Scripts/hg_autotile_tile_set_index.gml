///hg_autotile_tile_set_index(World, X, Y, Type, Index, CellSize)
/*

 Underlying HG script.

*/
var type,tilemap,key,tile,index,cs;

type=argument3;
index=argument4;
cs=argument5;

tilemap=hg_world_get_attribute(argument0,"tileMap");
key="tile_"+string(argument1)+"_"+string(argument2);

if !ds_map_exists(tilemap,key) exit;

//Delete old tile:
hg_tilemap_delete_tile(tilemap,argument1,argument2);

//Create new tile:  
var bck=type[|HG_TPROP.tileBck],
    pad=type[|HG_TPROP.padding],
    width=type[|HG_TPROP.tileW],
    height=type[|HG_TPROP.tileH],
    sep=type[|HG_TPROP.sep],
    tx=floor((background_get_width(bck)+sep)/(width+sep)),
    xx=index mod tx,
    yy=index div tx,
    left=xx*(width+sep)+pad,
    top=yy*(height+sep)+pad,
    dpth=type[|HG_TPROP.depth],
    alp=type[|HG_TPROP.alpha];

width-=2*pad;
height-=2*pad;
    
tile=tile_add(bck,left,top,width,height,argument1*(cs),argument2*(cs),dpth);
tile_set_alpha(tile,alp);

tilemap[?key]=tile;
