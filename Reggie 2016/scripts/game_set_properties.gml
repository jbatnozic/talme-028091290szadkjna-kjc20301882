///game_set_properties()
/*

*/

enum TEXTBOX {
 main=0,
 code_p=1,
 code_s=2,
 choices=3,
 branches=4,    
 }

enum GUI {
 max_msg=64,   // Maximum number of notification messages at once.
 max_alp=450   // Maximum message alpha (counter).
 }

enum JOURNAL {
 textMinimum=10 // The minimal number of characters needed to be able to
                // finalize a journal entry.
 }

enum GROUP {
 friendly,
 neutral,
 enemy
 }
 
enum PROJECTILE {

 bullet,
 rocket,
 grenade,
 flame

 }

enum PLAYER {

    //Movement:
    topHorzSpeed=4,    // Top walking speed
    topCrawlSpeed=2,   // Top crawling speed
    topSprintSpeed=5,  // Top sprinting speed
    jumpPower=14,      // Jump power
    hMovement=8,       // [10] Horizontal acceleration when sprinting
    hcMovement=5,      // [10] Horizontal acceleration when walking / crawling
    friction=4,        // [100] Normal friction
    slideFriction=1,   // [100] Friction when rolling/sliding
    airControl=4,      // [10] Controlability while airborne (0..10) 
    rollMod=14,        // [10] Roll speed factor
    gravity=10,        // [10] Downward force per step
    climb=10,          // Ability to climb slopes
    topFallSpeed=16,   // Max fall speed from GRAVITY
    rollTapSpeed=15,   // How many 60'ths of a second can pass before a double-
                       // tap is invalid
    rollLength=30,     // How many 60'ths of a second you roll for
    climbSpeed=1,
    
    //Other:
    carryWeight=200,
    interactionRange=2, // The distance (in player widths) that the player must be to interact with an object.
    topHealth=100,      // Maximum health the user can have
    topStamina=200,     // Maximum stamina the user can have
    staminaCPF=15,      // [10] Amount of stamina used per frame (so 60x a second)
    staminaRPF=5,       // [10] Amount of stamina regenerated per frame (so 60x a second)
    staminaUFR=75,      // Stamina used for each roll    
    armourEqTime=180,   // Time (in steps) needed to equip / unequip armour

}

// Enemies: ---------------------------------------------------------------------------------------

/* Turtabomber */
enum ENEMY_TURTA {
     
     //Secondary attack (Turtle):
     tDamageResist=50,   // [100] Damage resist while turtling (100 = 100% resistance)
     tKnockResist=50,    // [100] Knockback resist while turtling (100 = 100% resistance)
     
 }
     
     
// Other: -----------------------------------------------------------------------------------------

enum MORALE {

    flee=250,
    rage=750,
    
    hp=400,
    allies=250,
    comms=350,
    fire=250

 };

enum LIMIT {

    max_vspeed=31,
    max_hspeed=31,
    min_hspeed=10   // [10]

 };

enum HARMFUL_OBJ {

    damage = 20,
    flashDelay = 45
};
