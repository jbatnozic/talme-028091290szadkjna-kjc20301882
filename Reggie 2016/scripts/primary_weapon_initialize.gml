switch(argument0)
{
case "Rifle" :
_attackRange=320 //ENEMY_HUMAN.attackRangePrim;
_projectileDamage=0;
_projectileSpeed=20;
_projectileKnockback=0;
_bulletDrop=0;
_weaponPrecision=20;
_numberProjectile=1;
_clipReloadTime=10;//in  frames
_clipSizeMax=15;//number of bullet
_attackLength=5;    // custom
_attackSpeed=5 ;//ENEMY_HUMAN.attackCooldown;

//else---------------------------------------------
_clipReload=_clipReloadTime;
_clipSize=_clipSizeMax;
break;
case "Shotgun":
_attackRange=240; //ENEMY_HUMAN.attackRangePrim;
_attackLength=5;    // custom
_projectileDamage=0;
_projectileSpeed=20;
_projectileKnockback=0;
_bulletDrop=0;
_weaponPrecision=40;
_numberProjectile=5;
_clipReloadTime=1;//in  frames*attackSpeed
_attackSpeed=50 ;//ENEMY_HUMAN.attackCooldown;
_clipSizeMax=1;//number of bullet


//else
_clipReload=_clipReloadTime;
_clipSize=_clipSizeMax;
break;
}
