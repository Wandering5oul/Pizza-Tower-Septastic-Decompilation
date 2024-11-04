var old_substate, player;

if (room == rm_editor)
    exit;

if (bombreset > 0)
    bombreset--;

switch (state)
{
    case UnknownEnum.Value_134:
        if (substate_buffer > 0)
        {
            substate_buffer--;
        }
        else
        {
            substate_buffer = substate_max;
            old_substate = substate;
            
            while (substate == old_substate)
                substate = choose(UnknownEnum.Value_134, UnknownEnum.Value_126, UnknownEnum.Value_130, UnknownEnum.Value_129);
            
            if (substate == UnknownEnum.Value_134)
            {
                image_xscale = choose(-1, 1);
            }
            else if (substate == UnknownEnum.Value_130)
            {
                sprite_index = spr_pizzaslug_turn;
                image_index = 0;
                hsp = 0;
            }
        }
        
        switch (substate)
        {
            case UnknownEnum.Value_134:
                image_speed = 0.35;
                
                if (sprite_index != spr_pizzaslug_walk)
                {
                    image_index = 0;
                    sprite_index = spr_pizzaslug_walk;
                }
                
                scr_enemy_walk();
                break;
            
            case UnknownEnum.Value_126:
                image_speed = 0.35;
                hsp = 0;
                sprite_index = spr_pizzaslug_idle;
                break;
            
            case UnknownEnum.Value_130:
                image_speed = 0.35;
                substate_buffer = 5;
                
                if (sprite_index == spr_pizzaslug_turn && floor(image_index) == (image_number - 1))
                {
                    image_xscale *= -1;
                    substate_buffer = substate_max;
                    substate = UnknownEnum.Value_126;
                    sprite_index = spr_pizzaslug_idle;
                }
                
                break;
            
            case UnknownEnum.Value_129:
                state = UnknownEnum.Value_129;
                substate_buffer = 0;
                image_index = 0;
                sprite_index = spr_pizzaslug_cough;
                break;
        }
        
        break;
    
    case UnknownEnum.Value_126:
        scr_enemy_idle();
        break;
    
    case UnknownEnum.Value_130:
        scr_enemy_turn();
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
    
    case UnknownEnum.Value_125:
        scr_enemy_rage();
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

if (global.stylethreshold >= 3 && ragecooldown == 0)
{
    player = instance_nearest(x, y, obj_player);
    
    if (state == UnknownEnum.Value_134)
    {
        if (player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 60) && y >= (player.y - 60))
        {
            if (x != player.x)
                image_xscale = -sign(x - player.x);
            
            image_speed = 0.6;
            hsp = 0;
            shot = 0;
            sprite_index = spr_pizzaslug_rage;
            image_index = 0;
            state = UnknownEnum.Value_125;
            flash = 1;
            alarm[4] = 5;
            create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
        }
    }
}

if (ragecooldown > 0)
    ragecooldown--;

scr_scareenemy();

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
