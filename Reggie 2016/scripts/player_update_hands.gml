///player_update_hands()
/*

*/

with (global.player_obj_id) {

    if (instance_exists(_weaponInstanceId)) {
    
        remove(_weaponInstanceId);
        _weaponInstanceId = noone;
    
        }
    
    var ras = global.rinv_active_slot;   
    
    var wid = wpn_instance_create( x
                                 , y - 20
                                 , rinv_get_default()
                                 , ras);
            
    _weaponInstanceId = wid;
                                        
    }
