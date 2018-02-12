///hg_vertex_chunk_jumping_fill(World, Chunk List, Chunk Grid, X Pointer, Y Pointer, Original SX, Original SY)
/*

 Underlying HG script.

*/
var i,t,a,d,sx,sy,px,py,xx,yy,osx,osy,lq,cs,cw,ch,cx,cy;
var list,grid;

//GATHER DATA:

 lq=hg_world_get_attribute(argument0,"lightQuality");
 cs=hg_world_get_attribute(argument0,"cellSize")*lq;
 cw=hg_world_get_attribute(argument0,"lightChunkWidth");
 ch=hg_world_get_attribute(argument0,"lightChunkHeight");

list=argument1;
grid=argument2;

px=argument3;
py=argument4;

osx=argument5;
osy=argument6;

//DEBUG:

//Set starting position: (First point with free paths that is not px,py or osx,osy)
sx=-1;
sy=-1;
for (t=0; t<ds_grid_height(grid); t+=1) begin

 if (sx<>-1 and sy<>-1) break;

 for (i=0; i<ds_grid_width(grid); i+=1) begin
 
  if (string_count("f",grid[#i,t])>0 and 
     (i<>osx or t<>osy) and (i<>px or t<>py)) {
   sx=i;
   sy=t;
   break;
   }
 
 end;
end;

if (sx=-1 or sy=-1) {
 //STUB - FINISH HERE
 exit;
 }

//Start adding vertices to the list:
var bonds_added=0,
    path_grid,
    first,
    current_direction=90;

cx=cw*cs/2; //Center
cy=ch*cs/2; //Center    

ds_list_add(list,"\");

px=sx; //Pointer
py=sy; //Pointer

first=true;
while (true) begin

 if (px=sx and py=sy and first=false) {
  
  //Add start again:
  xx=sx*cs/2-cx;
  yy=sy*cs/2-cy;
 
  ds_list_add(list,xx,yy);
  
  a[0]=bonds_added;
  a[1]=sx;
  a[2]=sy;
  
  return a;

  }
  
 first=false;
  
 xx=px*cs/2-cx;
 yy=py*cs/2-cy;
 
 ds_list_add(list,xx,yy);
 
 path_grid=ds_grid_create(3,0);
 
 //Populating the path grid:
 var str=grid[#px,py],
     c_h,char;
     
 while (string_length(str)>0) begin
 
  char="";
  for (i=1; i<=string_length(str); i+=1) begin
  
   char=string_copy(str,i,1);
   if (char="f" or char="t")
    break;  
  
   end;
 
  if char="t" {
   str=string_delete(str,1,i);
   continue;
   }
   
  c_h=ds_grid_height(path_grid);
  ds_grid_resize(path_grid,ds_grid_width(path_grid),c_h+1);
  
  path_grid[#0,c_h]=real(string_copy(str,1,string_pos(",",str)-1));
  str=string_delete(str,1,string_pos(",",str));
  
  path_grid[#1,c_h]=real(string_copy(str,1,string_pos("f",str)-1));
  str=string_delete(str,1,string_pos("f",str));
    
  if (path_grid[#0,c_h]=sx and path_grid[#1,c_h]=sy and string_count("f",grid[#sx,sy])=1)
  or (string_count("f",grid[#path_grid[#0,c_h],path_grid[#1,c_h]])=0)
   path_grid[#2,c_h]=0
   else
    path_grid[#2,c_h]=1;
 
 end;
 
 //One path grid entry:
 if ds_grid_height(path_grid)=1 {
  
  current_direction=point_direction(px,py,path_grid[#0,0],path_grid[#1,0]);
  
  var substr=string(path_grid[#0,0])+","+string(path_grid[#1,0]);
 
  grid[#px,py]=string_replace(grid[#px,py],substr+"f",substr+"t");
 
  px=path_grid[#0,0];
  py=path_grid[#1,0];
  
  bonds_added+=1;
  
  ds_grid_destroy(path_grid);
  
  continue;
  }
  
 //Multiple path grid entries:
 
  // 1. Mark taken points:
  for (i=0; i<ds_grid_height(path_grid); i+=1) begin
  
   if string_count("t",grid[#path_grid[#0,i],path_grid[#1,i]])>0
    path_grid[#2,i]+=1*sign(path_grid[#2,i]);
  
  end;
  
  if hg_grid_column_has_um(path_grid,2)=true {
  
   var mp=path_grid[#2,0];
   
   t=0;
  
   for (i=1; i<ds_grid_height(path_grid); i+=1) begin
   
    if path_grid[#2,i]>mp
     t=i; 
   
   end;   
   
   current_direction=point_direction(px,py,path_grid[#0,t],path_grid[#1,t]);
  
   var substr=string(path_grid[#0,t])+","+string(path_grid[#1,t]);
 
   grid[#px,py]=string_replace(grid[#px,py],substr+"f",substr+"t");
 
   px=path_grid[#0,t];
   py=path_grid[#1,t];
  
   bonds_added+=1;
  
   ds_grid_destroy(path_grid);
  
   continue;
  
   }
   
  // 2. Add distance from center to priority:
  for (i=0; i<ds_grid_height(path_grid); i+=1) begin
  
   d=point_distance(path_grid[#0,i],path_grid[#1,i],cx,cy);
   path_grid[#2,i]+=d*sign(path_grid[#2,i]);
  
  end;
  
  if hg_grid_column_has_um(path_grid,2)=true {
   
   var mp=path_grid[#2,0];
   
   t=0;
  
   for (i=1; i<ds_grid_height(path_grid); i+=1) begin
   
    if path_grid[#2,i]>mp
     t=i; 
   
   end;
   
   current_direction=point_direction(px,py,path_grid[#0,t],path_grid[#1,t]);
  
   var substr=string(path_grid[#0,t])+","+string(path_grid[#1,t]);
 
   grid[#px,py]=string_replace(grid[#px,py],substr+"f",substr+"t");
 
   px=path_grid[#0,t];
   py=path_grid[#1,t];
  
   bonds_added+=1;
  
   ds_grid_destroy(path_grid);
  
   continue;  
  
   }
   
  // 3. Add priority according to angle:
  for (i=0; i<ds_grid_height(path_grid); i+=1) begin
  
   d=angle_difference(current_direction,point_direction(px,py,path_grid[#0,i],path_grid[#1,i]));
   path_grid[#2,i]+=(180-round(d))*sign(path_grid[#2,i]);
  
  end;

  if hg_grid_column_has_um(path_grid,2)=true {
  
   var mp=path_grid[#2,0];
   
   t=0;
  
   for (i=1; i<ds_grid_height(path_grid); i+=1) begin
   
    if path_grid[#2,i]>mp
     t=i; 
   
   end;
   
   current_direction=point_direction(px,py,path_grid[#0,t],path_grid[#1,t]);
  
   var substr=string(path_grid[#0,t])+","+string(path_grid[#1,t]);
 
   grid[#px,py]=string_replace(grid[#px,py],substr+"f",substr+"t");
 
   px=path_grid[#0,t];
   py=path_grid[#1,t];
  
   bonds_added+=1;
  
   ds_grid_destroy(path_grid);
  
   continue;
  
   }
  
 ds_grid_destroy(path_grid);
 
 continue;
 
end;
