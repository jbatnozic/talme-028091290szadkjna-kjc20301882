///mp_grid_to_str(mp_grid id, width, height)
/*

Converts a mp_grid to a compressed string.

*/
var i,t,c,s,g,w,h,br,flag;

g=argument0;
w=argument1;
h=argument2;

br=0;
flag=(mp_grid_get_cell(g,0,0)<>0);

s=string(w)+","+string(h)+","+string(flag);

for (t=0; t<h; t+=1)
  for (i=0; i<w; i+=1) {
    
    c=mp_grid_get_cell(g,i,t);
  
    if ((c<>0)==flag) {
      br+=1;
      continue;
      }
      
    if ((c==0) and (flag==1)) {
      flag=0;
      s+=",";
      s+=string(br);
      br=1; 
      continue;
      }
        
    if ((c==-1) and (flag==0)) {
      flag=1;
      s+=",";
      s+=string(br);
      br=1;
      continue;
      } 
      
  }

s+=","+string(br)+",";

return s;





