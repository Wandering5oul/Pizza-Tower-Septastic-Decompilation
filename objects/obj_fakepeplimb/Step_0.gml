if (room == rm_editor)
    exit;

targetplayer = instance_nearest(x, y, obj_player);

if (ceiling && (state == UnknownEnum.Value_100 || state == UnknownEnum.Value_80))
    grav = 0;
else if (ceiling && state != UnknownEnum.Value_100 && state != UnknownEnum.Value_80)
    grav = 0.5;

switch (state)
{
    case UnknownEnum.Value_126:
        scr_enemy_idle();
        break;
    
    case UnknownEnum.Value_130:
        scr_enemy_turn();
        break;
    
    case UnknownEnum.Value_134:
        ceiling = 0;
        state = UnknownEnum.Value_100;
        grav = 0.5;
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
    
    case UnknownEnum.Value_80:
        hidden = 0;
        cooldown = 100;
        
        if (sprite_index != spr_attack)
        {
            sprite_index = spr_attack;
            image_index = 0;
            
            with (instance_create(x, y, obj_forkhitbox))
            {
                visible = false;
                sprite_index = other.sprite_index;
                other.hitboxID = id;
                ID = other.id;
            }
        }
        else if (floor(image_index) == (image_number - 1))
        {
            image_speed = 0.35;
            state = UnknownEnum.Value_100;
            instance_destroy(hitboxID);
            sprite_index = spr_idle;
        }
        
        break;
    
    case UnknownEnum.Value_100:
        if (hidden)
        {
            sprite_index = spr_hidden;
            
            if (targetplayer.x > (x - 200) && targetplayer.x < (x + 200) && targetplayer.y < (y + 300) && targetplayer.y > (y - 300))
            {
                hidden = 0;
                state = UnknownEnum.Value_80;
            }
        }
        else
        {
            sprite_index = spr_idle;
            
            if (cooldown > 0)
                cooldown--;
            else
                state = UnknownEnum.Value_80;
        }
        
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

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (hidden)
    invincible = 1;
else
    invincible = 0;

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
