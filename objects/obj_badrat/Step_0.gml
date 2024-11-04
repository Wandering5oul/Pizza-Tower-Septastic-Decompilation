var targetplayer;

if (room == rm_editor)
    exit;

switch (state)
{
    case UnknownEnum.Value_126:
        scr_enemy_idle();
        break;
    
    case UnknownEnum.Value_130:
        scr_enemy_turn();
        break;
    
    case UnknownEnum.Value_134:
        scr_enemy_walk();
        break;
    
    case UnknownEnum.Value_136:
        scr_enemy_land();
        break;
    
    case UnknownEnum.Value_137:
        scr_enemy_hit();
        break;
    
    case UnknownEnum.Value_138:
        scr_enemy_stun();
        break;
    
    case UnknownEnum.Value_129:
        scr_pizzagoblin_throw();
        break;
    
    case UnknownEnum.Value_4:
        scr_enemy_grabbed();
        break;
    
    case UnknownEnum.Value_154:
        scr_enemy_pummel();
        break;
    
    case UnknownEnum.Value_155:
        scr_enemy_staggered();
        break;
    
    case UnknownEnum.Value_125:
        scr_enemy_rage();
        break;
    
    case UnknownEnum.Value_17:
        scr_enemy_ghostpossess();
        break;
}

targetplayer = instance_nearest(x, y, obj_player);

if (cooldown > 0)
    cooldown--;

if (state == UnknownEnum.Value_134 && cooldown <= 0)
{
    if (targetplayer.x > (x - 200) && targetplayer.x < (x + 200) && targetplayer.y > (y - 200) && targetplayer.y < (y + 200))
    {
        state = UnknownEnum.Value_80;
        sprite_index = spr_player_ratmountattack;
        image_index = 0;
        
        if (x != targetplayer.x)
            image_xscale = sign(targetplayer.x - x);
    }
}

if (state == UnknownEnum.Value_80)
{
    image_speed = 0.35;
    hsp = image_xscale * 5;
    vsp = 0;
    
    if (!instance_exists(hitboxID))
    {
        hitboxID = instance_create(x, y, obj_forkhitbox);
        hitboxID.ID = id;
    }
    
    if (floor(image_index) == (image_number - 1))
    {
        sprite_index = walkspr;
        state = UnknownEnum.Value_134;
        instance_destroy(hitboxID);
        cooldown = 80;
    }
}

if (state == UnknownEnum.Value_138 && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state != UnknownEnum.Value_138)
    birdcreated = 0;

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

scr_scareenemy();
scr_ratblock_destroy();

if (state != UnknownEnum.Value_4)
    depth = 0;

if (state != UnknownEnum.Value_138)
    thrown = 0;
