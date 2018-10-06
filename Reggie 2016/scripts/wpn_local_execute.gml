///wpn_local_execute(Group, Activate, ReloadMod, AccuracyMod, [OPT] chkReload, [OPT] chkReloadReleased, [OPT] ChngAmtPress, [OPT] ChngFrmPress);
/*
THIS SCRIPT MAKES THE WEAPON DO... WHAT WEAPONS DO.

Returns: void

*/

// Arguments:
if (argument_count < 4) show_error("weapon_execute() -- Too few arguments!", true);

var __group = argument[0], __fire = argument[1], __reload_mod = argument[2], __acc_mod = argument[3];
var __chk_reload, __chk_reload_rel, __change_amt, __change_frm;

if (argument_count >= 5) {
    __chk_reload = argument[4];
    }
else 
    __chk_reload = false;
    
if (argument_count >= 6) {
    __chk_reload_rel = argument[5];
    }
else 
    __chk_reload_rel = false;   
    
if (argument_count >= 7) {
    __change_amt = argument[6];
    }
else 
    __change_amt = false;
    
if (argument_count >= 8) {
    __change_frm = argument[7];
    }
else 
    __change_frm = false;

///////////////////////////////////////////////////////////////////////////////

// Counters:
if (refiring > 0) refiring -= 1;

if (preparing > 0 && !__fire) preparing -= 1;

if (__chk_reload && unload_counter < 24) unload_counter += 1; // STUB - Magic number

// Changing firing mode:
if (__change_frm) {
  
   mode_current = (mode_current + 1) mod modes_available;
   
   if (s_change != -1) sound_play(s_change);
   
   }
   
// State change:
switch (b_state) {
    
    case WPN_STATE.Regular:
        // Reload:
        if (xammo == 0 ||
            (__chk_reload_rel && unload_counter < 24 && xammo < b_clipsize)) {
            rinv_add_simple(my_inventory, bl_name[ammo_current], xammo);
            xammo   = 0;
            b_state = WPN_STATE.Reloading;
            unload_counter = 0;
            }
        // Manual unload:
        else if (__chk_reload_rel && unload_counter == 24 && xammo > 0) { // STUB - Magic number
            unload_counter = 0;
            rinv_add_simple(my_inventory, bl_name[ammo_current], xammo);
            b_state = WPN_STATE.Unloaded;
            xammo   = 0;
            if (s_unload != -1) sound_play(s_unload);
            }
        // Change ammo type (with unloading):
        else if (__change_amt && ammo_available > 1) {
            rinv_add_simple(my_inventory, bl_name[ammo_current], xammo);
            xammo = 0;
            ammo_current = (ammo_current + 1) % ammo_available;
            b_state = WPN_STATE.Reloading;
            if (s_change != -1) sound_play(s_change);
            }
        break;
        
    case WPN_STATE.Unloaded:
        
        if (__fire || __chk_reload_rel) {
            // Start (re)loading
            b_state = WPN_STATE.Reloading;
            }   
        //break; - Intentionally commented out
        
    case WPN_STATE.Reloading:
        if (__change_amt && ammo_available > 1) {
             //Change ammo type - without unloading
             ammo_current = (ammo_current + 1) mod ammo_available;
             reload_lock  = false;
             if (s_change != -1) sound_play(s_change);
             }
        break;
        
    case WPN_STATE.Disabled:
        // Manual unload:
        if (__chk_reload_rel && unload_counter == 24 && xammo > 0) { // STUB - Magic number
            unload_counter = 0;
            rinv_add_simple(my_inventory, bl_name[ammo_current], xammo);
            xammo   = 0;
            if (s_unload != -1) sound_play(s_unload);
            }
        break;
        
    default:
        break;
        
    }

// Main:
switch (b_state) {
    
    case WPN_STATE.Regular:
    
        if (xdur <= 0) {
            xdur = 0;
            b_state = WPN_STATE.Disabled;
            break;
            }
    
        if (__fire) {
    
            if (preparing < b_readytime) {    
                
                image_index += 1; //Loop readying animation
                if (image_index > index_re)
                    image_index = index_rs;
                else if (image_index < index_rs) 
                    image_index = index_rs;
                 
                preparing += 1;
                
                }
            else {
            
                image_index += 1; // Loop shooting animation
                if (image_index > index_se)
                    image_index = index_ss;
                else if (image_index < index_ss) 
                    image_index = index_ss;
                    
                if (refiring == 0) {
                
                    // Create the projectile:
                    var facing, b, xx, yy, son;
                    
                    facing = image_yscale;
                    
                    b = xy_rotated(bullet_xoff, bullet_yoff * facing, image_angle);
                    
                    xx = x + b[0];
                    yy = y + b[1];
                    
                    repeat (bl_number[ammo_current]) {
                    
                        son = instance_create(xx, yy, b_projobj);
                    
                        son._direction  = image_angle + random_range(-bl_scatter[mode_current], bl_scatter[mode_current]) * (1.5 - __acc_mod / 2);
                        son.image_angle = son._direction;
                        son._speed      = bl_speed[ammo_current];
                        son._sprite     = bl_sprite[ammo_current];
                              
                        son.damage     = bl_damage[ammo_current] * min((xdur / b_dur + 0.17) * 2, 1);     
                        son.exp_radius = bl_expradius[ammo_current];
                        son.exp_sprite = bl_expsprite[ammo_current];
                        son.knockback  = bl_knockback[ammo_current];
                        son.dot        = bl_dot[ammo_current];
                        son.dot_type   = bl_dot_type[ammo_current];
                        son.arc        = bl_arc[ammo_current];
                     
                        wpn_projectile_init(son, object_index, ammo_current, __group);
                    
                        }
                     
                    if (b_automatic[mode_current] == false) {
                        // STUB
                        //mouse_clear(userControls[MOUSE.shoot]); !!!!!!!!!!!!!!!!!!!!!!
                        }
                    
                    xammo -= 1;
                    xdur  -= bl_durloss[ammo_current];
                    special_action = true; // STUB
                    
                    // Create muzzle flash:    
                    if (bl_flashsprite[ammo_current] != -1) {
                    
                        son = instance_create(xx, yy, obj_muzzle_flash);
                        son.sprite_index = bl_flashsprite[ammo_current];
                        son.intensity    = bl_flashint[ammo_current];
                        son.image_angle  = image_angle;
                        
                        }
                    
                    // Apply recoil:
                    image_angle += b_recoil[mode_current] * facing * (2 - sqr(__acc_mod));
                    
                    // Other:
                    if (bl_firesound[ammo_current] != -1) 
                        sound_play(bl_firesound[ammo_current]);
                        
                    refiring = b_tbs[mode_current];
                
                    if (xammo == 0) b_state = WPN_STATE.Reloading;
                    
                    }
            
                }
            
            }
        
        break; // Break_regular
        
    case WPN_STATE.Reloading:
    
        if (rinv_count_item(my_inventory, bl_name[ammo_current]) == 0) {
            reloading = 0;
            b_state = WPN_STATE.Disabled;
            break;
            }
        else if (xammo == 0 && reloading == 0) {
        
            // Calculate chance to jam
            var jam_mul;
             
            if (xdur > b_dur * 0.75)
                jam_mul = 1;
            else {
            
                if (random(100) < (75 - (xdur / b_dur) * 100) * b_jam) {
                    jam_mul = 2;
                    if (s_jam != -1) sound_play(s_jam);
                    // STUB - Notify the user that the weapon is jammed !!!!!!!!!!!!!!!!!
                    }
                else 
                    jam_mul = 1;
                    
                }
              
             reloading = jam_mul * b_reloadtime;
        
            }
            
        if (reloading > 0) {
        
            reloading -= 1 * __reload_mod;
            image_index = index_rl;
            
            if (__fire && s_empty != -1) {
                sound_play(s_empty);
                //mouse_clear(userControls[MOUSE.shoot]); !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                }
        
            }
            
        //When "reloading" reaches 1, then the weapon is actually reloaded and ready to use again
        if (reloading <= 1) {
       
            if (rinv_count_item(my_inventory, bl_name[ammo_current]) >= b_clipsize) {
                xammo = b_clipsize;
                rinv_remove_simple(my_inventory, bl_name[ammo_current], b_clipsize);
                }
            else {
                xammo = rinv_count_item(my_inventory, bl_name[ammo_current]);
                rinv_remove_simple(my_inventory, bl_name[ammo_current], 9999999);
                }
          
            if (xammo > 0) { // "xammo > 0" check was added because, in theory, the player
                             // could drop the ammo before the reload finishes
                reloading = 0;
                b_state = WPN_STATE.Regular;  
                if (s_reload != -1) sound_play(s_reload); 
                with (instance_create(0, 0, obj_channel_bar_finished)) { _colour=c_green; } // !!!!!!!!!!!!!!!!!!!!!
            
                }
            else {
            
                reloading = 0;
                b_state = WPN_STATE.Disabled; 
            
                }
          
            }
    
        break; // Break_reloading
        
    case WPN_STATE.Unloaded:
        // Do nothing.
        break; // Break_unloaded
        
    case WPN_STATE.Disabled:
        
        if (xdur > 0 && rinv_count_item(my_inventory, bl_name[ammo_current])) {
            b_state = WPN_STATE.Regular;
            }
        
        if (__fire && s_empty != -1) {
            sound_play(s_empty);
            mouse_clear(userControls[MOUSE.shoot]); // !!!!!!!!!!!!!!!!!!!!!!!!!!!
            }
            
        break; // Break_disabled
        
    default:
        // Do nothing.
        break;

    } // End_switch
