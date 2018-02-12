///hg_free_vertex_chunks(World, ViewX, ViewY, Tolerance)
/*

 Underlying HG script.

*/
var i,cs,cw,ch,dw,dh,str,xx,yy,radius,tol,last;
var chunkmap,lightlist_d,lightlist_s,list;

chunkmap=hg_world_get_attribute(argument0,"lightVertexChunks");

 if ds_map_size(chunkmap)=0
  exit;

lightlist_d=hg_world_get_attribute(argument0,"lightListDynamic");
lightlist_s=hg_world_get_attribute(argument0,"lightListStatic");

cs=hg_world_get_attribute(argument0,"cellSize");
cw=hg_world_get_attribute(argument0,"lightChunkWidth");
ch=hg_world_get_attribute(argument0,"lightChunkHeight");
dw=hg_world_get_attribute(argument0,"drawWidth");
dh=hg_world_get_attribute(argument0,"drawHeight");

radius=sqrt(sqr(cw)+sqr(ch))/2;

tol=hg_world_get_attribute(argument0,"lightTrunc")*cs-argument3;

current=ds_map_find_first(chunkmap);
last=ds_map_find_last(chunkmap);

while (true) begin

 free=true;
 
 //Determine x and y:
 str=string_delete(current,1,string_pos("_",current));
 xx=real(string_copy(str,1,string_pos("_",str)-1));
 str=string_delete(str,1,string_pos("_",str));
 yy=real(str);
 
  xx=(xx+cw/2)*cs;
  yy=(yy+ch/2)*cs;
 
 //In view: 
 var t=cs/2;
 if point_in_rectangle(xx,yy,argument1-cw*t,argument2-ch*t,argument1+dw+cw*t,argument2+dh+ch*t) {
  free=false;
  }
  
 //Dynamic lights:
 if (free=true) {
 
  for (i=0; i<ds_list_size(lightlist_d); i+=1) begin
 
   list=lightlist_d[|i];
 
   if (point_distance(list[|HG_LPROP.xPos],list[|HG_LPROP.yPos],xx,yy)<
      (sprite_get_width(list[|HG_LPROP.sprite])*list[|HG_LPROP.scale]/2+radius-tol)) {
      
    free=false;
    break; 
       
    }
 
  end;
  
  } 
  
 //Static lights:
 if (free=true) {
 
  for (i=0; i<ds_list_size(lightlist_s); i+=1) begin
 
   list=lightlist_s[|i];
 
   if (point_distance(list[|HG_LPROP.xPos],list[|HG_LPROP.yPos],xx,yy)<
      (sprite_get_width(list[|HG_LPROP.sprite])*list[|HG_LPROP.scale]/2+radius+tol)) {
      
    free=false;
    break; 
       
    }
 
  end;
  
  }
 
 //Find next & free:
 var u=current;
 
 if (current<>last)
  current=ds_map_find_next(chunkmap,current);
   
 if (free=true) {
  ds_list_destroy(chunkmap[?u]);
  ds_map_delete(chunkmap,u);
  }
  
 if (current=last)
  break;

end;
