var t;

event_inherited();
dmg = 40;
t = 245;

if (global.coop)
    t = instance_nearest(x, y, obj_player);

direction = point_direction(x, y, t.x, t.y) + irandom_range(-4, 4);
parryable = 1;
parried = 0;

function parry()
{
    var prevparried;
    
    prevparried = parried;
    SUPER_parry();
    
    if (prevparried != parried)
    {
        direction *= -1;
        dmg = 100;
        spd = 30;
    }
}
