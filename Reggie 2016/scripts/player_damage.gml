///player_damage(damage, vKnock, hKnock)
/*
Removes the specified amount of health from the player and knocks them back in the
direction they are facing.
*/
var damage,player;

player=global.player_obj_id;

if (!instance_exists(player)) exit;

damage=argument0;

//Reset combat timer:
player_reset_combat_timer();

//Interrupt channeling:
cha_interrupt();

//Knockback:
object_knockback(player,(argument1 * player.mod_kbrs),(argument2 * sign(player.x-x) * player.mod_kbrs));

//Armour damage:
if player._armour>=damage {
 player._armour-=damage;
 exit;
 }

//Health damage:
damage-=player._armour;
player._armour=0;
player._health=clamp(player._health-damage*player.mod_dr,-100,PLAYER.topHealth);
