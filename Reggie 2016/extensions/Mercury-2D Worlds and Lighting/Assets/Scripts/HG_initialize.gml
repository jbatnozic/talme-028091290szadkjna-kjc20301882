///HG_initialize()
/*

 See Mercury's Manual, section "Initialization".

*/

global.HG_TYPE_MAP=ds_map_create();
global.HG_GCVAL_MAP=ds_map_create();
global.HG_WORLD_LIST=ds_list_create();
global.HG_COLGROUP_MAP=ds_map_create();

global.HG_DEFAULT_WORLD=-1;    // DS numeric handle
global.HG_SC_MAX_TIME=100;     // Maximum time for surface creation in microseconds
global.HG_CHUNK_TOLERANCE=256; // In pixels
global.HG_CHUNK_TIMER=60;      // In steps

hg_set_vertex_arrays(1);

global.HG_VERTEX_SCALE=1;
global.HG_VERTEX_TYPE=0;

//Type properties:
enum HG_TPROP {

 shape,
 shadowStr,
 shadowCol,
 sprite,
 tileBck,
 tileL,
 tileT,
 tileW,
 tileH,
 padding,
 sep,
 frames,
 speed,
 depth,
 phased,
 alpha,
 atList,
 custv1

 }
 
//Autotile lists:
enum HG_ATL {

 at_0000,
 at_0001,
 at_0010,
 at_0011,
 
 at_0100,
 at_0101,
 at_0110,
 at_0111,
 
 at_1000,
 at_1001,
 at_1010,
 at_1011,
 
 at_1100,
 at_1101,
 at_1110,
 at_1111

 }
 
//Cell shapes:
enum HG_SHAPE {

 empty,
 full,
 circle,
 slopeLeft,
 slopeRight,
 slopeTopLeft,
 slopeTopRight,
 slabLeft,
 slabRight,
 slabTop,
 slabBottom,
 slopeSmLeft,
 slopeSmRight,
 slopeSmTopLeft,
 slopeSmTopRight, 
 slopeSmElevLeft,
 slopeSmElevRight,
 slopeSmElevTopLeft,
 slopeSmElevTopRight

 } 
 
//Light properties:
enum HG_LPROP {
 
 sprite, 
 colour,
 scale,
 alpha,
 angle,
 xPos,
 yPos,
 update,
 turnedoff,
 surf1,
 surf2,

 }
 
//Light types:
enum HG_LTYPE {

 dynamic,
 static,
 simple

 }

//Vertex format for lighting:
vertex_format_begin();
vertex_format_add_position();
vertex_format_add_colour();

global.HG_V_FORMAT=vertex_format_end();
global.HG_V_BUFF=vertex_create_buffer();

