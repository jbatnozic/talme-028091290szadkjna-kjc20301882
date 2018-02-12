///keyboard_get_input()
/*

*/
var i,array;

array[0]=-1;
array[1]="No button";

if keyboard_check(vk_nokey)=true
 return array;

//Special buttons:
if keyboard_check(vk_left) {
 array[0]=vk_left;
 array[1]="Left arrow";
 return array;
 }
if keyboard_check(vk_right) {
 array[0]=vk_right;
 array[1]="Right arrow";
 return array;
 }
if keyboard_check(vk_up) {
 array[0]=vk_up;
 array[1]="Up arrow";
 return array;
 }
if keyboard_check(vk_down) {
 array[0]=vk_down;
 array[1]="Down arrow";
 return array;
 }
if keyboard_check(vk_enter) {
 array[0]=vk_enter;
 array[1]="Enter";
 return array;
 }
if keyboard_check(vk_space) {
 array[0]=vk_space;
 array[1]="Space";
 return array;
 }
if keyboard_check(vk_shift) {
 array[0]=vk_shift;
 array[1]="Shift";
 return array;
 }
if keyboard_check(vk_control) {
 array[0]=vk_control;
 array[1]="Control";
 return array;
 }
if keyboard_check(vk_alt) {
 array[0]=vk_alt;
 array[1]="Alt";
 return array;
 }
if keyboard_check(vk_backspace) {
 array[0]=vk_backspace;
 array[1]="Backspace";
 return array;
 }
if keyboard_check(vk_tab) {
 array[0]=vk_tab;
 array[1]="Tab";
 return array;
 }
if keyboard_check(vk_printscreen) {
 array[0]=vk_printscreen;
 array[1]="Prt Scr";
 return array;
 }
if keyboard_check(20) {
 array[0]=20;
 array[1]="Caps Lock";
 return array;
 }
if keyboard_check(vk_escape) {
 array[0]=vk_escape;
 array[1]="Escape";
 return array;
 }

//Character buttons:
for (i=32; i<=96; i+=1) begin

 if keyboard_check(i)=true {
  array[0]=i;
  array[1]=chr(i);
  return array;
  }
  
end;

return array;
