///heart_initialise()
/*
Initialises the Heart system.

No arguments.

Returns nothing.
*/

//Enumeration:
  // NOTE: Values which have [10] next to them represent ten times the actual value (for
  // example, if you write 4 that's 0.4 etc. Values which have [100] next to them represent
  // a hundred times the actual value (100 --> 1) and so on... That's because enumerators
  // can't hold any values other than integers.
  
enum HEART {

 min_prim_mod=4, // [10] A primary heart attack chance which increases over time. This is
                 // the starting value.
 max_prim_mod=24,// [10] This is the maximum value for the primary heart attack chance.
 
 period=300,     // Time (in seconds) it takes for the primary heart attack chance to reach
                 // its maximum value.
 
 safe_period=60, // Duration of the safe period (it occurs only after a heart attack).
 safe_mod=50,    // [100] Heart attack chance multiplier coming from the safe period. If
                 // you put 50, heart attack chance will be halved, with 0 you'll never get
                 // a heart attack and so on...
 
 min_sec_mod=1,  // Minimum secondary heart attack modifier (It multiplies the primary heart
                 // attack chance, it's increased by sprinting, rolling, getting damaged...
                 // and it slowly decreases over time).
 max_sec_mod=5,  // Maximum secondary heart attack multiplier.
 sec_mod_drop=5, // [100] How much the secondary heart attack modifier drains every second.

 max_ter_mod=30, // Maximum HA increase in percents from losing health. (30 theoretically 
                 // gives 30% chance increase at 0 HP, 50 gives 25% chance increase at half
                 // HP and so on...)
 
 roll_strain=10,   // [100] How much to add to the secondary heart attack modifier upon rolling.
 jump_strain=10,   // [100] How much to add to the secondary heart attack modifier upon jumping.
 sprint_strain=30, // [100] Strain per second when sprinting.

 admin_mod=65,  // [100] A global modifier for the chance to get a heart attack and it will
                // always be in effect.
 
 };
 
//Underlying setup: -- Don't touch this!
global.heart_counter=0;
global.heart_time_passed=0;

global.heart_meter_prim=0;
global.heart_meter_sec=0;

global.heart_admin_mod=HEART.admin_mod/100;
