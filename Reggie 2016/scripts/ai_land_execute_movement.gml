///ai_land_execute_movement()
/*

*/

switch (_moveMode) {

  case AI_MOVE.mm_inertial:
    ai_land_move_inertially();
    break;
  
  case AI_MOVE.mm_towards:
    ai_land_move_towards();
    break;
  
  case AI_MOVE.mm_away_from:
    ai_land_move_away_from();
    break;

  }
  
// Mask correction:
if (_moveHeight == AI_MOVE.mh_normal && mask_index != _maskDefault) {

  set_mask(_maskDefault);
  
  }
else if (_moveHeight = AI_MOVE.mh_crouch && mask_index != _maskCrouch) {

  set_mask(_maskCrouch);
  
  }
