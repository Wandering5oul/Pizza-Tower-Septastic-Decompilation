var targetplayer, _dir;

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
_dir = (image_xscale > 0) ? (targetplayer.x > (x + 20)) : (targetplayer.x < (x - 20));

if (cooldown > 0)
    cooldown--;

if (state == UnknownEnum.Value_134 && cooldown <= 0 && _dir && scr_monster_detect(300, room_height, targetplayer) && collision_line(x, y, targetplayer.x, targetplayer.y, obj_solid, false, true) == -4)
{
    state = UnknownEnum.Value_80;
    sprite_index = spr_cheeseslime_rage;
    image_index = 0;
    scr_soundeffect(84);
}

if (state == UnknownEnum.Value_80)
{
    hsp = 0;
    
    if (floor(image_index) == (image_number - 1))
    {
        state = UnknownEnum.Value_134;
        cooldown = 100;
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

if (state != UnknownEnum.Value_4)
    depth = 0;

if (state != UnknownEnum.Value_138)
    thrown = 0;

if (boundbox == 0)
{
    with (instance_create(x, y, obj_baddiecollisionbox))
    {
        sprite_index = other.sprite_index;
        mask_index = other.sprite_index;
        baddieID = other.id;
        other.boundbox = 1;
    }
}
