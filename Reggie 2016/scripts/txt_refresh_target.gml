///txt_refresh_target(Stage, EndOfBranch)
/*

*/
var i,t,a;
 
for (i=argument0+1*(argument1==0); i>1; i-=1) begin

 a=txt_map_get("branches_s"+string(i));
 if a>0
  for (t=1; t<=a; t+=1) begin
  
   if is_undefined( txt_property_get(i,t,0) ) {
   
    txt_map_set("stage",i);
    txt_map_set("branch",t);
    exit;
   
    }    
  
  end;

end;
