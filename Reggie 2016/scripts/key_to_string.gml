///key_to_string(Key)
/*

*/
var rv;

if is_string(argument0)
 return argument0;

if argument0=-1
 return "";

if argument0>32 and argument0<=96
 return chr(argument0);
 
if argument0=(vk_left) {
 rv="Left arrow";
 return rv;
 }
if argument0=(vk_right) {
 rv="Right arrow";
 return rv;
 }
if argument0=(vk_up) {
 rv="Up arrow";
 return rv;
 }
if argument0=(vk_down) {
 rv="Down arrow";
 return rv;
 }
if argument0=(vk_enter) {
 rv="Enter";
 return rv;
 }
if argument0=(vk_space) {
 rv="Space";
 return rv;
 }
if argument0=(vk_shift) {
 rv="Shift";
 return rv;
 }
if argument0=(vk_control) {
 rv="Control";
 return rv;
 }
if argument0=(vk_alt) {
 rv="Alt";
 return rv;
 }
if argument0=(vk_backspace) {
 rv="Backspace";
 return rv;
 }
if argument0=(vk_tab) {
 rv="Tab";
 return rv;
 }
if argument0=(vk_printscreen) {
 rv="Prt Scr";
 return rv;
 }
if argument0=(20) {
 rv="Caps Lock";
 return rv;
 }
if argument0=(vk_escape) {
 rv="Escape";
 return rv;
 }
