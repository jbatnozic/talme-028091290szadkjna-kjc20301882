///buf_initialise()
/*
Initialises the buff system.

No arguments.

Returns nothing.
*/

global.buff_grid=ds_grid_create(17,0);
global.buff_speed=6; // Putting a higher number here will result in better
                     // performance but less accuracy. At 6 the system's window
                     // if mistake is about 100 milliseconds.

//DEFINE BUFFS:

enum BUFF_ID {
 heart_attack_1=0,
 heart_attack_2=1,
 heart_attack_3=2,
 heart_attack_4=3,
 heart_attack_5=4,
 relaxer=5,
 jitter=6,
 ctw=7,
 stimpack=8,
 defibrillate=9,
 recover=10,
 on_fire=11,
 on_acid=12,
 poisoned=13,
 bleeding=14,
 waker_debuff_1=15,
 waker_debuff_2=16,
 waker_debuff_3=17,
 turtling=18,
 };
 
 // Buffs MUST be defined in the same order in which they are stated in the
 // enum BUFF_ID above! Otherwise errors WILL occur. This kind of order
 // saves the system a lot of searching and speeds it up a lot.
 
 //Neutral buff: buf_define_buff(BUFF_ID.abc,false,0,0,1,1,1,0,0,1,1,1,1,1,1,1);
 
 buf_define_buff(BUFF_ID.heart_attack_1,false,0,0,0.80,0.82,0.80,0,0,1,1,1,1,1,1,1);
 buf_define_buff(BUFF_ID.heart_attack_2,false,0,0,0.75,0.80,0.75,0,0,1,1,1,1,1,1,1);
 buf_define_buff(BUFF_ID.heart_attack_3,false,0,0,0.70,0.78,0.70,0,0,1,1,1,1,1,1,1);
 buf_define_buff(BUFF_ID.heart_attack_4,false,0,0,0.65,0.76,0.65,0,0,1,1,1,1,1,1,1);
 buf_define_buff(BUFF_ID.heart_attack_5,false,0,0,0.60,0.74,0.60,0,0,1,1,1,1,1,1,1);
 
 buf_define_buff(BUFF_ID.relaxer,false,0,0,0.9,0.9,1.3,0,0,1,1,1,1,1,0.75,1);
 buf_define_buff(BUFF_ID.jitter,false,0,0,1.25,1,0.85,0,0,1.25,1,1,1,1,1.15,1);
 buf_define_buff(BUFF_ID.ctw,false,0,0,1,1.2,1,0,0,1,1,1.4,0.8,1.25,1,1);
 buf_define_buff(BUFF_ID.stimpack,true,0,0,1,1,1,0,3,1,1,1,1,1,1,1);
 
 buf_define_buff(BUFF_ID.defibrillate,false,0,0,1,1,1,0,0,1,1,1,0,1,1,0);
 buf_define_buff(BUFF_ID.recover,false,0,0,1,1,1,0,0,1,1,1,1,1,1,0);
 
 buf_define_buff(BUFF_ID.on_fire,false,0,0,1,1,1,0,0,1,1,1,1,1,1,0);
  buf_vfx_to_last(PTC_EFF.fire);
 buf_define_buff(BUFF_ID.on_acid,false,0,0,1,1,1,0,0,1,1,1,1,1,1,1);
 buf_define_buff(BUFF_ID.poisoned,false,0,0,1,1,1,0,0,1,1,1,1,1,1,1);
 buf_define_buff(BUFF_ID.bleeding,false,0,0,1,1,1,0,0,1,1,1,1,1,1,1);
 
 buf_define_buff(BUFF_ID.waker_debuff_1,false,0,0,1,1,1,0,0,1,2,1,1,1,1,1); // DR is of importance here
 buf_define_buff(BUFF_ID.waker_debuff_2,false,0,0,1,1,1,0,0,1,3,1,1,1,1,1);
 buf_define_buff(BUFF_ID.waker_debuff_3,false,0,0,1,1,1,0,0,1,4,1,1,1,1,1);
 
 buf_define_buff(BUFF_ID.turtling,false,0,0,1,1,1,0,0,1,ENEMY_TURTA.tDamageResist/100,1,ENEMY_TURTA.tKnockResist/100,1,1,1);
