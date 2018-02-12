///str_to_mp_grid(string, cellwidth, cellheight)
/*

Creates a mp_grid from a compressed string.

*/
var g,n,p,w,h,xx,yy,flag,work_str;

work_str=argument0;

//Width:
p=string_pos(",",work_str);
w=real(string_copy(work_str,1,p-1));
work_str=string_delete(work_str,1,p);
  
//Height;
p=string_pos(",",work_str);
h=real(string_copy(work_str,1,p-1));
work_str=string_delete(work_str,1,p);

//Create mp_grid:
g=mp_grid_create(0,0,w,h,argument1,argument2);

//First Value;
p=string_pos(",",work_str);
flag=real(string_copy(work_str,1,p-1));
work_str=string_delete(work_str,1,p);

//Read:
xx=0;
yy=0;

while (work_str<>"") {

  p=string_pos(",",work_str);
  n=real(string_copy(work_str,1,p-1));
  work_str=string_delete(work_str,1,p);

  if (flag==0) {
  
    for (i=0; i<n; i+=1) {
      xx+=1;
      if (xx>=w) {
        xx=0;
        yy+=1;
        }
      }
      
    flag=1;
  
    }
    else {
    
      for (i=0; i<n; i+=1) {
        mp_grid_add_cell(g,xx,yy);
        xx+=1;
        if (xx>=w) {
          xx=0;
          yy+=1;
          }
        }
        
      flag=0;
    
      }
  
  }
  
return g;
  
  
  
