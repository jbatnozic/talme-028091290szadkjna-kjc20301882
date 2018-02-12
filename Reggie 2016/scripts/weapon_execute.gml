///weapon_execute(ReloadMod, AccuracyMod)
/*
THIS SCRIPT MAKES THE WEAPON DO... WHAT WEAPONS DO.



Returns nothing.
*/

if xdur<0 xdur=0;

//Unload counter:
if keyboard_check(userControls[KEYBOARD.reload])=true {
 if unload_counter<24 unload_counter+=1;
 }

 //State correction:
 if ((b_state=0 and xammo=0 and reload_lock=false) 
 or (keyboard_check_released(userControls[KEYBOARD.reload]) and unload_counter<24 and xammo<b_clipsize))
 and inv_count_item(bl_name[ammo_current])>0 {
  inv_add_item(bl_name[ammo_current],xammo);
  xammo=0;
  b_state=1;
  unload_counter=0;
  reload_lock=false;
  }
  else if b_state=0 and keyboard_check_released(userControls[KEYBOARD.reload]) and unload_counter=24 and xammo>0 {
   unload_counter=0;
   inv_add_item(bl_name[ammo_current],xammo);
   reload_lock=true;
   xammo=0;
   if s_unload<>-1 sound_play(s_unload);
   }
   else if b_state=0 and mouse_check_button_pressed(userControls[MOUSE.change_amt])=true and ammo_available>1 {
    //Change ammo type - with unloading
    inv_add_item(bl_name[ammo_current],xammo);
    xammo=0;
    ammo_current+=1;
    if ammo_current>ammo_available ammo_current=1;
    b_state=1;
    reload_lock=false;
    if s_change<>-1 sound_play(s_change);
    }
    else if b_state=1 and mouse_check_button_pressed(userControls[MOUSE.change_amt])=true and ammo_available>1 {
     //Change ammo type - without unloading
     ammo_current+=1;
     reload_lock=false;
     if ammo_current>ammo_available ammo_current=1;
     if s_change<>-1 sound_play(s_change);
     }
 
 //The weapon still has ammo:
 if b_state=0 and xammo>0 {
 
  //Changing firing mode:
  if keyboard_check_pressed(userControls[KEYBOARD.change_frm])=true {
  
   mode_current+=1;
   if mode_current>modes_available mode_current=1;
   if s_change<>-1 sound_play(s_change); }
 
  if mouse_check_button(userControls[MOUSE.shoot])=true {
  
  if xdur>0 {
  
   //The weapon is preparing to shoot:
   if preparing<>b_readytime {    
    //Loop readying animation
    image_speed=1;
    if image_index>index_re image_index=index_rs
     else if image_index<index_rs image_index=index_rs;
     
    preparing+=1;
    }
    
    //The weapon is ready to shoot:
    else {
     //Loop firing animation
     image_speed=1;
     if image_index>index_se image_index=index_ss
      else if image_index<index_ss image_index=index_ss;
      
     if refiring=0 {
      //Create the projectile
      var a,xx,yy,son;
      
      if mouse_x>x a=1 else a=-1;
      
      xx=x+x_rotated(x_offset,y_offset*a,image_angle);
      yy=y+y_rotated(x_offset,y_offset*a,image_angle);
      
      repeat (bl_number[ammo_current]) {
      
       son=instance_create(xx,yy,b_projobj);
      
       son._direction=image_angle+random_range(-bl_scatter[mode_current],bl_scatter[mode_current])*(1.5-argument1/2);
       son.image_angle=son._direction;
       son._speed=bl_speed[ammo_current];
       son._sprite=bl_sprite[ammo_current];
            
       son.damage=bl_damage[ammo_current]*min((xdur/b_dur + 0.17)*2,1);     
       son.exp_radius=bl_expradius[ammo_current];
       son.exp_sprite=bl_expsprite[ammo_current];
       son.knockback=bl_knockback[ammo_current];
       son.dot=bl_dot[ammo_current];
       son.dot_type=bl_dot_type[ammo_current];
       son.arc=bl_arc[ammo_current];
       
       weapon_projectile_init(son,object_index,ammo_current,GROUP.friendly);
      
      }
       
      if b_automatic[mode_current]=0 mouse_clear(userControls[MOUSE.shoot]);
      
      xammo-=1;
      xdur-=bl_durloss[ammo_current];
      special_action=true;
      
      //Create muzzle flash      
      if bl_flashsprite[ammo_current]<>-1 {
       son=instance_create(xx,yy,obj_muzzle_flash);
       son.sprite_index=bl_flashsprite[ammo_current];
       son.intensity=bl_flashint[ammo_current];
       son.image_angle=image_angle;
       }
      
      //Apply recoil     
      image_angle+=b_recoil[mode_current]*a*(2-sqr(argument1));
      
      if bl_firesound[ammo_current]<>-1 sound_play(bl_firesound[ammo_current]);
      refiring=b_tbs[mode_current];
      }
    
     }

   if refiring>0 refiring-=1;
       
    }
    else {
     //STUB - Notify the user the weapon is broken
     }
   
   }
   
   else if preparing>0 {
    preparing-=1;
    }
    
  }

  //The weapon is being reloaded:
  else if b_state=1 {
   
   if inv_count_item(bl_name[ammo_current])=0 reloading=0;
   
   else if (xammo=0 and reloading=0 /*and reload_lock=false*/) {
     //Calculate chance to jam
     var jam;
     
     if xdur>b_dur*0.75 jam=1
      else {
       if random(100)<(75-(xdur/b_dur)*100)*b_jam {
        jam=2;
        if s_jam<>-1 sound_play(s_jam);
        //STUB - Notify the user that the weapon is jammed
        }
        else 
         jam=1;
        }
      
     reloading=jam*b_reloadtime; }

    //Reloading...
    else if reloading>0 {
     reloading-=1*argument0;
     image_speed=0;
     image_index=index_rl;
     if mouse_check_button(userControls[MOUSE.shoot]) and s_empty<>-1 {
      sound_play(s_empty); mouse_clear(userControls[MOUSE.shoot]);
      }
     }
   
   //When "reloading" reaches 1, then the weapon is actually reloaded and ready to use again
   if reloading<=1 {
   
    if inv_count_item(bl_name[ammo_current])>=b_clipsize {
     xammo=b_clipsize;
     inv_remove_item(bl_name[ammo_current],b_clipsize);
     }
     else {
      xammo=inv_count_item(bl_name[ammo_current]);
      inv_remove_item(bl_name[ammo_current],inv_count_item(bl_name[ammo_current]));
      }
      
    if xammo>0 and s_reload<>-1 sound_play(s_reload); //"xammo>0" check was added because, in theory, the player
    if xammo>0 b_state=0;                             //could drop the ammo before the reload finishes
    if xammo>0 reloading=0;
    if xammo>0 with (instance_create(0,0,obj_channel_bar_finished)) { _colour=c_green; }
    //STUB - Maybe notify the player that reloading is finished  
      
    }

   }
