var targetplayer;

if (room == rm_editor)
    exit;

targetplayer = instance_nearest(x, y, obj_player);

if (slide_buffer > 0)
    slide_buffer--;

if (can_flash)
{
    if (flash_count > 0)
    {
        flash_count--;
    }
    else
    {
        flash_count = flash_max;
        flash = !flash;
    }
}
else
{
    flash = 0;
}

if (can_flash_count > 0)
    can_flash_count--;
else
    can_flash = 0;

if (inv_timer > 0)
    inv_timer--;
else
    invincible = 0;

if (state == 128)
{
    if (image_index > (image_number - 1))
    {
        ram_spd = 0;
        sprite_index = spr_tank_charge;
        image_index = 0;
        state = 141;
    }
}

if (state == UnknownEnum.Value_126)
{
    image_speed = 0.35;
    
    if (!patrolling)
    {
        targetplayer = instance_nearest(x, y, obj_player);
        
        if (targetplayer.x > (x - 400) && targetplayer.x < (x + 400) && y <= (targetplayer.y + 20) && y >= (targetplayer.y - 20))
        {
            bombreset = patrolmax;
            patrolling = 1;
            sprite_index = walkspr;
            image_index = 0;
            state = UnknownEnum.Value_134;
        }
    }
}
else if (state == 141)
{
    invincible = 1;
    
    if (ram_spd < ram_spd_max)
        ram_spd += accel;
    else
        ram_spd = ram_spd_max;
    
    hsp = image_xscale * ram_spd;
    
    if (scr_solid(x + sign(hsp), y))
    {
        bombreset = 200;
        invincible = 0;
        sprite_index = spr_tank_hitwall;
        image_index = 0;
        attackmode = 0;
        hsp = -image_xscale * 2;
        state = UnknownEnum.Value_138;
        stunned = 30;
        vsp = -5;
    }
}

switch (state)
{
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

if (state == UnknownEnum.Value_138 && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state != UnknownEnum.Value_138)
    birdcreated = 0;

if (bombreset > 0)
    bombreset--;

if (state == 142)
{
    if (floor(image_index) == 5 && bombreset == 0)
    {
        bombreset = spawnreset;
        
        with (instance_create(x, y - 19, content))
        {
            depth = other.depth - 10;
            important = 1;
            vsp = -8;
            hsp = -other.image_xscale;
            state = UnknownEnum.Value_138;
            stunned = 50;
        }
    }
    
    if (image_index > (image_number - 1))
    {
        sprite_index = walkspr;
        state = UnknownEnum.Value_134;
    }
}

if (state == UnknownEnum.Value_134 && bombreset == 0 && forcespawn == 0)
{
    attackmode = choose(0, 0, 1, 1);
    
    switch (attackmode)
    {
        case 0:
            nextattack = 1;
            sprite_index = spr_tank_shoot;
            image_index = 0;
            
            if (x != targetplayer.x)
                image_xscale = -sign(x - targetplayer.x);
            
            forcespawn = 1;
            state = UnknownEnum.Value_129;
            break;
        
        case 1:
            nextattack = 0;
            
            if (x != targetplayer.x)
                image_xscale = -sign(x - targetplayer.x);
            
            sprite_index = spr_tank_chargestart;
            image_index = 0;
            ram_count = ram_max;
            state = 128;
            forcespawn = 1;
            
            if (slide_buffer <= 0)
                hsp = 0;
            
            break;
    }
}

if (state == UnknownEnum.Value_134 && bombreset == 0 && forcespawn == 1)
{
    nextattack = 2;
    
    if (slide_buffer <= 0)
        hsp = 0;
    
    sprite_index = spr_tank_spawnenemy;
    image_index = 0;
    
    if (x != targetplayer.x)
        image_xscale = -sign(x - targetplayer.x);
    
    state = 142;
    forcespawn = 0;
}

if (state == UnknownEnum.Value_138)
{
    if (sprite_index == spr_tank_hitwall && image_index > (image_number - 1))
        image_index = image_number - 1;
    
    if (sprite_index == spr_tank_stunstart && image_index > (image_number - 1))
    {
        sprite_index = spr_tank_stun;
        image_index = 0;
    }
    
    if (sprite_index != spr_tank_hitwall && sprite_index != spr_tank_stunstart && sprite_index != spr_tank_stun)
    {
        sprite_index = spr_tank_stunstart;
        image_index = 0;
    }
}

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (state != UnknownEnum.Value_4)
    depth = 0;

if (state != UnknownEnum.Value_138)
    thrown = 0;
