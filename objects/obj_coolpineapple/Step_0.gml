var player_inst, player_state, _taunt;

if (room == rm_editor)
    exit;

switch (state)
{
    case UnknownEnum.Value_126:
        grav = 0.5;
        scr_enemy_idle();
        break;
    
    case 128:
        grav = 0.5;
        scr_enemy_charge();
        break;
    
    case UnknownEnum.Value_130:
        grav = 0.5;
        scr_enemy_turn();
        break;
    
    case UnknownEnum.Value_134:
        grav = 0.5;
        scr_enemy_walk();
        break;
    
    case UnknownEnum.Value_136:
        grav = 0.5;
        scr_enemy_land();
        break;
    
    case UnknownEnum.Value_137:
        grav = 0.5;
        scr_enemy_hit();
        break;
    
    case UnknownEnum.Value_138:
        grav = 0.5;
        scr_enemy_stun();
        break;
    
    case UnknownEnum.Value_129:
        grav = 0.5;
        scr_pizzagoblin_throw();
        break;
    
    case UnknownEnum.Value_4:
        grav = 0.5;
        scr_enemy_grabbed();
        break;
}

if (inv_timer <= 0)
    scr_scareenemy();

if (state == UnknownEnum.Value_138 && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state != UnknownEnum.Value_138)
    birdcreated = 0;

if (sprite_index == scaredspr)
    inv_timer = 0;

if (inv_timer > 0)
{
    inv_timer--;
    
    if (sprite_index != scaredspr && place_meeting(x, y, obj_player))
    {
        player_inst = instance_place(x, y, obj_player);
        player_state = player_inst.state;
        
        if (player_inst.instakillmove == 1 || player_state == UnknownEnum.Value_42 || player_state == UnknownEnum.Value_43)
        {
            if (state != UnknownEnum.Value_147)
            {
                sprite_index = parryspr;
                movespeed = 0;
                state = UnknownEnum.Value_147;
                image_index = 0;
            }
        }
    }
}
else
{
    invincible = 0;
}

if (state == UnknownEnum.Value_134)
{
    grav = 0.5;
    inv_timer = inv_max;
    invincible = 1;
    killbyenemy = 0;
    
    if (point_in_camera(x, y, view_camera[0]))
    {
        _taunt = 0;
        
        with (obj_player)
        {
            if (state == UnknownEnum.Value_84)
                _taunt = 1;
        }
        
        if (_taunt)
        {
            taunteffect_inst = instance_create(x, y, obj_baddietaunteffect);
            sprite_index = spr_coolpinea_taunt;
            image_speed = 0;
            index = choose(0, 1, 2);
            taunt_count = taunt_max;
            taunt_storedstate = state;
            taunt_storedmovespeed = movespeed;
            taunt_storedhsp = hsp;
            state = UnknownEnum.Value_84;
            hsp = 0;
            vsp = 0;
            grav = 0;
        }
    }
}

if (state != UnknownEnum.Value_84 && instance_exists(taunteffect_inst))
    instance_destroy(taunteffect_inst);

switch (state)
{
    case UnknownEnum.Value_84:
        image_speed = 0;
        image_index = index;
        inv_timer = 0;
        invincible = 0;
        killbyenemy = 1;
        hsp = 0;
        vsp = 0;
        
        if (taunt_count > 0)
        {
            taunt_count--;
        }
        else
        {
            sprite_index = walkspr;
            grav = taunt_storedgrav;
            state = UnknownEnum.Value_134;
            hsp = taunt_storedhsp;
            movespeed = taunt_storedmovespeed;
        }
        
        break;
    
    case UnknownEnum.Value_147:
        image_speed = 0.35;
        
        if (trail_count > 0)
        {
            trail_count--;
        }
        else
        {
            with (create_afterimage(x, y, sprite_index, image_index - 1))
                image_xscale = other.image_xscale;
            
            trail_count = trail_max;
        }
        
        if (instance_exists(taunteffect_inst) && taunteffect_inst.object_index == obj_baddietaunteffect)
        {
            instance_destroy(taunteffect_inst);
            taunteffect_inst = -4;
        }
        
        inv_timer = inv_max;
        invincible = 1;
        killbyenemy = 0;
        
        if (movespeed > 0)
            movespeed -= 0.5;
        else
            movespeed = 0;
        
        hsp = movespeed * -image_xscale;
        
        if (image_index > (image_number - 1))
        {
            sprite_index = walkspr;
            killbyenemy = 1;
            grav = taunt_storedgrav;
            state = taunt_storedstate;
            hsp = taunt_storedhsp;
            cooldown_count = cooldown_max;
            movespeed = taunt_storedmovespeed;
        }
        
        break;
    
    case UnknownEnum.Value_80:
        if (sprite_index == spr_coolpinea_ragestart)
        {
            hsp = 0;
            inv_timer = 0;
            invincible = 0;
            killbyenemy = 1;
            
            if (floor(image_index) == (image_number - 1))
            {
                sprite_index = spr_coolpinea_rage;
                breakdance_movespeed = 10;
                hsp = breakdance_movespeed * image_xscale;
            }
        }
        else
        {
            breakdance_movespeed = Approach(breakdance_movespeed, 0, 0.25);
            hsp = image_xscale * breakdance_movespeed;
            
            if (place_meeting(x + sign(hsp), y, obj_solid))
            {
                image_xscale *= -1;
                
                if (breakdance_movespeed < 3)
                    breakdance_movespeed = 5;
                
                hsp = breakdance_movespeed * image_xscale;
            }
            
            inv_timer = inv_max;
            invincible = 1;
            killbyenemy = 0;
            
            if (trail_count > 0)
            {
                trail_count--;
            }
            else
            {
                with (create_afterimage(x, y, sprite_index, image_index - 1))
                    image_xscale = other.image_xscale;
                
                trail_count = trail_max;
            }
            
            if (breakdance > 0)
            {
                breakdance--;
            }
            else
            {
                sprite_index = walkspr;
                invincible = 0;
                killbyenemy = 1;
                state = UnknownEnum.Value_134;
                breakdanceinst = -4;
            }
        }
        
        break;
}

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
