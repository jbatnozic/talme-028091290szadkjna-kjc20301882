///heart_cause_strain(Amount [0..500])
/*
Causes some strain (secondary modifier) to the heart. Strain applied is
increased if the heart is already strained.

Returns nothing.
*/

if argument0=0 exit;

global.heart_meter_sec+=(argument0/100)*(1+global.heart_meter_sec/HEART.max_sec_mod);
