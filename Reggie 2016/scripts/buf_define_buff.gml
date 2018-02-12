///buf_define_buff(Buff ID,Additive,HeartStrain,HaChance,Speed,Jump,Acc,Sta,HP,Rel,DR,CarryW,KBRes,stamReg,HACmod,AbsCtrl)
/*
Defines a buff to use later on.

Returns nothing.
*/

c_h=ds_grid_height(global.buff_grid);

ds_grid_resize(global.buff_grid,ds_grid_width(global.buff_grid),c_h+1);

global.buff_grid[#0,c_h]=argument0; //ID
global.buff_grid[#1,c_h]=argument1; //Additive - [true/false]
global.buff_grid[#2,c_h]=argument2; //Heart sec meter add (Player only) - [0..500]
global.buff_grid[#3,c_h]=argument3; //Heart instant Heart attack chance (Player only) - [0..100]
global.buff_grid[#4,c_h]=argument4; //Speed - 1=neutral, >1=better, <1=worse
global.buff_grid[#5,c_h]=argument5; //Jump power - 1=neutral, >1=better, <1=worse
global.buff_grid[#6,c_h]=argument6; //Accuracy (Player only) - 1=neutral, >1=better, <1=worse
global.buff_grid[#7,c_h]=argument7; //Stamina regen - Pending...
global.buff_grid[#8,c_h]=argument8; //HP regen - Pending...
global.buff_grid[#9,c_h]=argument9; //Reload speed (Player only) - 1=neutral, >1=better, <1=worse
global.buff_grid[#10,c_h]=argument10; //Damage resist (Pending) - 1=neutral, >1=worse, <1=better
global.buff_grid[#11,c_h]=argument11; //Carry weight (Player only) - 1=neutral, >1=better, <1=worse
global.buff_grid[#12,c_h]=argument12; //Knockback resist (Pending) - 1=neutral, >1=worse, <1=better
global.buff_grid[#13,c_h]=argument13; //Stamima regen (Player only) - 1=neutral, >1=better, <1=worse
global.buff_grid[#14,c_h]=argument14; //Heart Attack chance mod (Player only) - 1=neutral, >1=worse, <1=better
global.buff_grid[#15,c_h]=argument15; //Absolute control mod - [0..1]

global.buff_grid[#16,c_h]=-1;         //Particles, empty for now
