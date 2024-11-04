var tx, on_place, player;

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
        
        if (totemID != -4)
            state = 188;
        
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
    
    case UnknownEnum.Value_17:
        scr_enemy_ghostpossess();
        break;
}

scr_scareenemy();

if (state == 188 && totemID != -4)
{
    image_speed = 0.35;
    
    if (sprite_index != spr_indiancheese_dance)
    {
        tx = totemID.x + (64 * totemdir);
        on_place = (totemdir > 0) ? (x > tx) : (x < tx);
        
        if (place_meeting(x + image_xscale, y, obj_solid))
            on_place = 1;
        
        hsp = !on_place ? (image_xscale * 3) : 0;
        
        if (grounded && on_place)
        {
            sprite_index = spr_indiancheese_dance;
            image_index = 0;
            hsp = 0;
        }
        
        if (sprite_index == spr_indiancheese_jump && floor(image_index) == (image_number - 1))
            image_index = image_number - 1;
    }
    else
    {
        hsp = 0;
        
        if (floor(image_index) == (image_number - 1))
        {
            totemdir = (x > totemID.x) ? -1 : 1;
            image_xscale = totemdir;
            sprite_index = spr_indiancheese_jump;
            vsp = -11;
        }
    }
}
else if (state == 188 && totemID == -4)
{
    state = UnknownEnum.Value_134;
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

player = instance_nearest(x, y, obj_player);

if (global.stylethreshold >= 3 && ragecooldown > 0)
    ragecooldown--;

if (state == UnknownEnum.Value_134 && sprite_index == walkspr && sprite_index != spr_indiancheese_scared && global.stylethreshold >= 3 && ragecooldown == 0)
{
    if (player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 60) && y >= (player.y - 60))
    {
        image_xscale = -sign(x - player.x);
        state = UnknownEnum.Value_125;
        sprite_index = spr_indiancheese_howl;
        image_index = 0;
        shot = 0;
        ragedash = 50;
        hsp = 0;
        flash = 1;
        alarm[4] = 5;
        create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
    }
}

if (!grounded && sprite_index == spr_indiancheese_jump && floor(image_index) == (image_number - 1))
    image_speed = 0;
else if (image_speed == 0)
    image_speed = 0.35;

if (sprite_index == spr_indiancheese_land && floor(image_index) == (image_number - 1))
    sprite_index = spr_indiancheese_walk;

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
