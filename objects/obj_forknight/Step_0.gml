var player;

if (room == rm_editor)
    exit;

switch (state)
{
    case UnknownEnum.Value_126:
        scr_enemy_idle();
        break;
    
    case 128:
        scr_enemy_charge();
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

if (state == UnknownEnum.Value_138 && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state != UnknownEnum.Value_138)
    birdcreated = 0;

scr_scareenemy();

if (global.stylethreshold >= 3 && ragecooldown == 0)
{
    player = instance_nearest(x, y, obj_player);
    
    if (state == UnknownEnum.Value_134)
    {
        if (player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 60) && y >= (player.y - 60))
        {
            image_xscale = -sign(x - player.x);
            sprite_index = spr_forknight_ragestart;
            image_index = 0;
            flash = 1;
            alarm[4] = 5;
            state = UnknownEnum.Value_125;
            ragedash = 50;
            create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
        }
    }
}

if (ragedash > 0 && state == UnknownEnum.Value_125)
    ragedash--;

if (ragedash == 0 && state == UnknownEnum.Value_125)
{
    state = UnknownEnum.Value_134;
    sprite_index = walkspr;
    ragecooldown = 100;
}

if (ragecooldown > 0)
    ragecooldown--;

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (hitboxcreate == 0 && state == UnknownEnum.Value_134)
{
    hitboxcreate = 1;
    
    with (instance_create(x, y, obj_forkhitbox))
        ID = other.id;
}

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
