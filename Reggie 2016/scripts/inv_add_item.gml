///inv_add_item(name, amount)
/*
THIS SCRIPT ADDS A SPECIFIED AMOUNT OF THE SPECIFIED ITEM INTO THE PLAYER'S INVENTORY:

NOTE: This script will create new inventory slots if necessary.

NOTE: If the item to be added is a weapon, it will be added using inv_add_set_item(...),
      will be given a random amount of ammo and its starting durability will also be 
      randomized. See random_dur(...) and random_ammo(...) scripts.

argument0 - (String)  Name of the item to add.
argument1 - (Integer) Amount.

Returns nothing.
*/
var a,item_maxstack,remaining,difference,qe;

qe=sett_get_value("Auto Equip");

//Check to see if the item being added is a weapon or armour:
if real(inv_item_get_static_value(argument0,0))=INV_TYPE.weapon {
 repeat (argument1) {
 
   a=inv_add_set_item(argument0,1,random_ammo(weapon_max_ammo(argument0)),1,random_dur(weapon_max_dur(argument0)),0,0);
   if qe<>"Off"
    if inv_add_item_to_quick(a)
     player_update_hands();
   
   }
 exit;
 }
if real(inv_item_get_static_value(argument0,0))=INV_TYPE.armour {
 repeat (argument1) {
 
    a=inv_add_set_item(argument0,1,random_dur(armour_max_dur(argument0)),1,0,0,0);
    if qe="All"
     inv_equip_armour(a);
    
    }
 exit;
 }

//Normal adding:
item_maxstack=real(inv_item_get_static_value(argument0,3));
remaining=argument1;

//Adding to existing quick stacks:
if (qe="Most" or qe="All") {
 
 counter=1;
 while (remaining>0 and counter<=5) begin

 if global.inventory_quick[counter,1]=argument0 {
 difference=item_maxstack-global.inventory_quick[counter,3];
 if difference>=remaining {inv_item_add_dynamic_value(counter,true,0,remaining); remaining=0;}
  else {inv_item_add_dynamic_value(counter,true,0,difference); remaining-=difference;}
 }

 counter+=1

end;

 }

//Adding to existing stacks:
counter=1;
while (remaining>0 and counter<=global.inventory_slots) begin

if global.inventory_current[counter,1]=argument0 {
difference=item_maxstack-global.inventory_current[counter,3];
if difference>=remaining {inv_item_add_dynamic_value(counter,false,0,remaining); remaining=0;}
 else {inv_item_add_dynamic_value(counter,false,0,difference); remaining-=difference;}
}

counter+=1

end;

//Creating a new stack:
counter=1;

if remaining>0 {

 while (remaining>0) {

  if counter>global.inventory_slots inv_add_slot();
  
  if global.inventory_current[counter,1]="ZZZZZ" {
   global.inventory_current[counter,1]=argument0;
   global.inventory_current[counter,2]=ds_map_find_value(global.inventory_map,argument0);
   global.inventory_current[counter,3]=0;
  
   difference=item_maxstack-global.inventory_current[counter,3];
   if difference>=remaining {inv_item_add_dynamic_value(counter,false,0,remaining); remaining=0}
    else {inv_item_add_dynamic_value(counter,false,0,difference); remaining-=difference;}
  
   if (qe="Most" or qe="All") {
    //show_message(counter);
    inv_add_item_to_quick(counter);
    }
  
  }

 counter+=1;

 }

}
