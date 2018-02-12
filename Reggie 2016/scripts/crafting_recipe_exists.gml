///crafting_recipe_exists(List ID)
/*
Checks whether a specific recipe is already available to the player.
*/
var i,t,l;

l=global.crafting_recipes;

for (i=0; i<ds_list_size(l); i+=1) begin

 if ds_list_size(l[|i])=ds_list_size(argument0) {
 
  for (t=0; t<ds_list_size(argument0); t+=1) begin
  
   if ds_list_find_value(l[|i],t)=argument0[|t] {
   
    if t=ds_list_size(argument0)-1
     return true;
   
    }
    else {
    
     break;
     
     }
  
  end;
 
  }

end;

return false;
