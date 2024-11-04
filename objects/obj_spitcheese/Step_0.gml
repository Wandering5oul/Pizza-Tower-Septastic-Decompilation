var player;

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

scr_scareenemy();

if (bombreset > 0)
    bombreset--;

player = instance_nearest(x, y, obj_player);

if (player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 60) && y >= (player.y - 60))
{
    if (state != UnknownEnum.Value_125 && bombreset <= 0 && global.stylethreshold >= 3 && state == UnknownEnum.Value_134)
    {
        bombreset = 130;
        ragedash = 5;
        state = UnknownEnum.Value_125;
        sprite_index = spr_spitcheese_rage;
        
        if (x != player.x)
            image_xscale = -sign(x - player.x);
        
        ragebuffer = 100;
        image_index = 0;
        image_speed = 0.4;
        flash = 1;
        alarm[4] = 5;
        create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
    }
    else if (x != player.x && grounded)
    {
        if (state == UnknownEnum.Value_134 && bombreset <= 0)
        {
            if (x != player.x)
                image_xscale = -sign(x - player.x);
            
            image_index = 0;
            state = UnknownEnum.Value_129;
        }
    }
}

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (floor(image_index) == (image_number - 1) && sprite_index == spr_spitcheese_spit)
    sprite_index = spr_spitcheese_idle;

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
