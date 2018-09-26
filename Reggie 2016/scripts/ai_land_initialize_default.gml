///ai_land_initialize_default()
/*

*/

//<MOVEMENT> variables:

  //Output:
  _hspeed   = 0;
  _vspeed   = 0;
  _grounded = 0;
  _climb    = 10;
  
  //Mask:
  _maskDefault = aiDefaultMask;
  _maskCrouch  = aiCrouchMask;
   mask_index  = _maskCrouch;
  _height = sprite_get_height(mask_index);
  _width  = sprite_get_width(mask_index);
  
  //Default variables: (All are Configurable)
  def_maxspeed     = 5;
  def_climbspeed   = 2;
  def_acceleration = 0.8;
  def_jumpPower    = 12;
  def_aircontrol   = 0.4;
  def_abscontrol   = 1;
  def_gravity      = 0.6;
  def_friction     = 1 - 0.005;
  
  //Other:
  _moveMode   = 0;
  _moveType   = 3;
  _moveHeight = 0;
  _jumpCd     = 0;
  _jumpCdMax  = 0;
  
  _allowedLadder = true; // Configurable
  
  _xPrevOlder = x;
  _xPrevOld   = x;
  
  _hSpeedTreshold = 11;   // Configurable
  _vSpeedTreshold = 14;   // Configurable
  
  _KBresist = 0;
  
  _eccentricity   = 1;  // Configurable
  _rangeTolerance = 32; // Configurable
  _prefTolerance  = 0;  // Configurable
  pfd_instance_init();
 
//<BEHAVIOUR> variables:

  _group = GROUP.enemy;

  _scriptIdle = 0; // d
  _scriptHide = 0; // d
  _scriptStep = 0; // d
  
  _skipUpdate = 0;
  
  _isPrimal    = false;
  _isCommander = false;

//<COMBAT> variables:

  //Basic:
  _group = GROUP.enemy;
  
  _maxHealth = 100;     // Configurable
  _health    = _maxHealth;
  _armour    = 0;       // Configurable
  
  _aiState        = AI_STATE.idle;
  _target         = -1;
  _tarX           = -1;
  _tarY           = -1;
  _hiddenTimer    = 0;
  _hiddenTimerMax = 900; // Configurable
  _fleeTimerMax   = 300; // Configurable
  _prefDistPrim   = 0;   // Configurable
  _prefDistSec    = 0;   // Configurable
  _prefDist       = _prefDistPrim;
  _viewRange      = 800; // Configurable - Larger than preferred distance
  _playerBias     = 50;  // Configurable 
  
  //Buffs:
  buf_instance_init();
  
  //Patrol:
  point_1_x = -1;
  point_1_y = -1;
  point_2_x = -1;
  point_2_y = -1;
  _aiPatrol = false;
  _aiPatrolNode = 0;
  
  //Guard:
  _startX     = x;
  _startY     = y;
  _aiGuard    = false;
  _guardRange = 240;
  _guardBody  = -1;
  
  //Morale:
  _moraleBase    = 0; // Configurable
  _moraleCounter = irandom(60);
  _morale        = (MORALE.flee + MORALE.rage) / 2;
  
  //Spawn Point 
  _spawnPointEnabled    = false;
  _allowedSpawnDistance = 100;

//<OTHER> variables:

 _density      = 0.15; // Configurable
 _eyesYDefault = 15;   // Configurable
 _eyesYCrouch  = 7;    // Configurable
 _eyesY        = _eyesYDefault;
 _relY         = sprite_get_height(_maskDefault) - sprite_get_height(_maskCrouch);
 _randomGen    = 0;
 _randomGenCounter = 0;
 _idleType     = 0;
 
 image_speed   = 0;
 
 _bufSave = "";
