///grid_bin_to_str(grid)
/* first value in grid has to be zero
*/
s="";
g=argument0;
w=ds_grid_width( g );s+=string(w);s+=",";
h=ds_grid_height( g );s+=string(h);
br=0;
flag=0;
for (t=0; t<h; t+=1)
for (i=0; i<w; i+=1) {
 if(g[#i,t]=0)and(flag=0) br+=1; 
 if(g[#i,t]=1)and(flag=1) br+=1; 
    if(g[#i,t]=0)and(flag=1) {
        flag=0;
        s+=",";
        s+=string(br);
        br=0; }
    if(g[#i,t]=1)and(flag=0){
        flag=1;
        s+=",";
        s+=string(br);
        br=0;} 
  }
  return(s);
