function scr_player_chainsawbump()
{
    if (sprite_index == spr_chainsawhit)
        hsp = 0;
    else
        hsp = xscale * movespeed;
    
    move = key_right + key_left;
    
    if (hsp != 0 && movespeed > 0 && (sprite_index == spr_player_chainsawrev || sprite_index == spr_player_chainsawidle) && grounded)
        movespeed--;
    
    if (sprite_index == spr_player_chainsawidle && move != 0)
        xscale = move;
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_chainsawrev)
        sprite_index = spr_player_chainsawidle;
    
    if (!key_slap && sprite_index == spr_player_chainsawidle)
    {
        vsp = -5;
        sprite_index = spr_player_chainsawdashstart;
    }
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_chainsawdashstart)
    {
        with (instance_create(x, y, obj_superdashcloud))
            image_xscale = other.xscale;
        
        particle_set_scale(UnknownEnum.Value_2, xscale, 1);
        create_particle(x, y, UnknownEnum.Value_2, 0);
        image_index = 0;
        sprite_index = spr_chainsawdash;
        
        if (movespeed < 12)
            movespeed = 12;
    }
    
    if (sprite_index == spr_chainsawdash && movespeed < 20)
        movespeed += 0.1;
    
    if (sprite_index == spr_chainsawdash && key_down && grounded)
        sprite_index = spr_chainsawcrouch;
    
    if (sprite_index == spr_chainsawcrouch && (!key_down || !grounded))
    {
        mask_index = spr_player_mask;
        
        if (!place_meeting(x, y, obj_solid))
            sprite_index = spr_chainsawdash;
        else
            mask_index = spr_crouchmask;
    }
    
    if (key_attack && !key_down && grounded && (place_meeting(x + sign(hsp), y - 16, obj_solid) || scr_solid_slope(x + sign(hsp), y - 16)) && !place_meeting(x + hsp, y, obj_destructibles) && (!place_meeting(x + hsp, y, obj_metalblock) || movespeed < 16) && place_meeting(x, y + 1, obj_slope))
    {
        wallspeed = movespeed;
        state = UnknownEnum.Value_37;
        wallspeed += 4;
        grabclimbbuffer = 30;
        sprite_index = spr_chainsawclimbwall;
    }
    else if (key_attack && !grounded && (place_meeting(x + sign(hsp), y, obj_climbablewall) || (!global.option_septmoveset && place_meeting(x + sign(hsp), y, obj_solid))) && !place_meeting(x + sign(hsp), y, obj_destructibles) && (!place_meeting(x + sign(hsp), y, obj_metalblock) || movespeed < 16))
    {
        if (movespeed < 1)
            wallspeed = 1;
        else
            wallspeed = movespeed;
        
        state = UnknownEnum.Value_37;
        wallspeed += 4;
        grabclimbbuffer = 30;
        sprite_index = spr_chainsawclimbwall;
    }
    else if (place_meeting(x + xscale, y, obj_solid) && !place_meeting(x + xscale, y, obj_destructibles))
    {
        if (sprite_index != spr_chainsawhitwall)
        {
            with (obj_camera)
            {
                shake_mag = 10;
                shake_mag_acc = 30 / room_speed;
            }
            
            vsp = -6;
            movespeed = -4;
            sprite_index = spr_chainsawhitwall;
            image_index = 0;
        }
    }
    
    if (key_jump && grounded && sprite_index == spr_chainsawdash)
    {
        jumpstop = 0;
        vsp = -11;
    }
    
    if (!jumpstop)
    {
        if (!key_jump2 && vsp < 0.5 && !stompAnim)
        {
            vsp /= 20;
            jumpstop = 1;
        }
        else if (scr_solid(x, y - 1))
        {
            vsp = grav;
            jumpstop = 1;
        }
        else if (vsp > 0)
        {
            jumpstop = 1;
        }
    }
    
    if (key_slap2 && sprite_index == spr_chainsawdash)
        state = UnknownEnum.Value_104;
    
    if (!instance_exists(obj_chainsawpuff))
        instance_create(x, y, obj_chainsawpuff);
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_chainsawhit)
    {
        if (movespeed < 12)
        {
            sprite_index = spr_chainsawdashstart;
            image_index = 0;
        }
        else
        {
            sprite_index = spr_chainsawdash;
        }
    }
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_chainsawhitwall)
    {
        state = UnknownEnum.Value_0;
        movespeed = 0;
    }
    
    if (sprite_index == spr_chainsawdash)
        image_speed = 0.4 + (movespeed * 0.01);
    else
        image_speed = 0.4;
}
