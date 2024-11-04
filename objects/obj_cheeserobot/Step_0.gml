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
}

if (state == UnknownEnum.Value_138 && stunned > 40 && birdcreated == 0)
{
    birdcreated = 1;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state != UnknownEnum.Value_138)
    birdcreated = 0;

idlespr = spr_cheeserobot_idle;
stunfallspr = spr_cheeserobot_stun;
walkspr = spr_cheeserobot_walk;
stunspr = spr_cheeserobot_stun;
grabbedspr = spr_cheeserobot_stun;

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (hp <= 0)
    instance_destroy();

if (state != UnknownEnum.Value_4)
    depth = 0;

if (state != UnknownEnum.Value_138)
    thrown = 0;

if (bombreset > 0)
    bombreset--;

if (x != obj_player.x && state != UnknownEnum.Value_129 && bombreset == 0)
{
    if (obj_player.x > (x - 400) && obj_player.x < (x + 400) && y <= (obj_player.y + 20) && y >= (obj_player.y - 20))
    {
        if (state == UnknownEnum.Value_134 || state == UnknownEnum.Value_126)
        {
            image_index = 0;
            image_xscale = -sign(x - obj_player.x);
            state = UnknownEnum.Value_129;
        }
    }
}
