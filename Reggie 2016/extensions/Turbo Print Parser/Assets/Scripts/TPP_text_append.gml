///TPP_text_append(Grid ID, String)
/*

Appends text to an already parsed text / grid. Will start
in a new line and use settings from the previous
preparations. This is a very slow function.

Returns: n/a

*/
var i,g,l,t,target,c_h;

target=argument0;
l=target[#0,0];

g=TPP_text_parse(argument1,0,0,l[|TPP_LIST.def_font],0,l[|TPP_LIST.def_width],l[|TPP_LIST.def_sep],l[|TPP_LIST.def_just]);

for (i=1; i<ds_grid_height(g); i+=1) {

  c_h=ds_grid_height(target);
  ds_grid_resize(target,4,c_h+1);
  
  target[#0,c_h]=g[#0,i];
  target[#1,c_h]=g[#1,i];
  target[#2,c_h]=g[#2,i];
  target[#3,c_h]=g[#3,i];

  }

t=g[#0,0];
l[|TPP_LIST.maxheight]+=t[|TPP_LIST.maxheight];

TPP_text_free(g);
