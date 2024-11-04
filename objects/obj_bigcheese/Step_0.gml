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

if (state == UnknownEnum.Value_134)
{
    hsp = 0;
}
else if (state == UnknownEnum.Value_74)
{
    hsp = 0;
    
    if (floor(image_index) == (image_number - 1))
    {
        state = UnknownEnum.Value_134;
        sprite_index = spr_bigcheese_idle;
    }
    
    if (floor(image_index) > 2 && !shot)
    {
        shot = 1;
        
        if (!pizzaball)
        {
            with (playerid)
            {
                xscale = other.image_xscale;
                movespeed = 12;
                vsp = -14;
            }
        }
        else
        {
            with (golfid)
            {
                image_xscale = other.image_xscale;
                movespeed = 12;
                jspd = 14;
                vsp = -jspd;
                thrown = 1;
            }
        }
    }
    
    if (!shot)
    {
        if (!pizzaball)
        {
            with (playerid)
            {
                xscale = other.image_xscale;
                hsp = 0;
                vsp = 0;
                x = other.x;
                y = other.y;
            }
        }
        else
        {
            with (golfid)
            {
                image_xscale = other.image_xscale;
                x = other.x - hsp;
                y = other.y - vsp;
                hsp = 0;
                vsp = 0;
                hsp_carry = 0;
                scr_collision_init();
            }
        }
    }
}

if (state == UnknownEnum.Value_138 && stunned > 40 && birdcreated == 0)
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
