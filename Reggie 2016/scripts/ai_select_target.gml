///ai_select_target(Group, Range, PlayerBias)
/*
Selects one visible target for an AI.
*/
var rv, nearest_id, nearest_dist, player_flag, player_dist;

nearest_id=-1;
nearest_dist=argument1+1;
player_flag=0;
player_dist=argument1+1;

//Check possible targets:
with (bodyParObj) {
 
  var d;
 
  if (_group<>argument0) {
 
    if (id<>global.player_obj_id) { //Is not the playes

      d=point_distance(x,y,other.x,other.y);
    
      if (d<nearest_dist and !HG_collision_line(-1,x,y,other.x,other.y-other._eyesY,GLOBAL.precision)) {
   
        nearest_id=id;
        nearest_dist=d;        
   
        }
   
      }
      else { //Is the player
      
        d=point_distance(x,y,other.x,other.y);
        
        if (d<=argument1 and !HG_collision_line(-1,x,y,other.x,other.y-other._eyesY,GLOBAL.precision)) {
        
          player_flag=1;
          player_dist=d;
        
          }
      
        }
   
    }

 }
 
//Finalize:
if (player_flag==0) {

  rv=nearest_id;

  }
  else {
  
    if (player_dist<=nearest_dist or irandom(100)<argument2)
      rv=global.player_obj_id;
      else 
        rv=nearest_id;
  
    }
    
return rv;

/*var __grid, rv;

__grid=ds_grid_create(2,0);

//Gather possible targets:
with (bodyParObj) {
 
 var __d, __c, c_h;
 
 if _group<>argument0 {
 
  __d=point_distance(x,y,other.x,other.y)<=argument1;

  if (__d) {
 
   __c=!HG_collision_line(-1,x,y,other.x,other.y-other._eyesY,GLOBAL.precision);
  
   if (__c) {
  
    c_h=ds_grid_height(__grid);
    ds_grid_resize(__grid,2,c_h+1);
    ds_grid_add(__grid,0,c_h,id);
    ds_grid_add(__grid,1,c_h,__d);
   
    }
   
   }
   
  }

 }
 
if ds_grid_height(__grid)=0
 rv=-1;
 
else if irandom(100)<argument2 { //Player bias

 if ds_grid_value_exists(__grid,0,0,0,ds_grid_height(__grid)-1,global.player_obj_id)
  rv=(global.player_obj_id).id;
 
 }
 else {
 
  ds_grid_sort(__grid,1,true); 
  rv=__grid[#0,0];
  
  }

ds_grid_destroy(__grid);

return rv;*/
