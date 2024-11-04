function scr_player_tumble()
{
    var _railinst, _bump;
    
    if (crouchslipbuffer > 0)
        crouchslipbuffer--;
    
    if (!place_meeting(x, y + 1, obj_railparent))
    {
        hsp = xscale * movespeed;
    }
    else
    {
        _railinst = instance_place(x, y + 1, obj_railparent);
        hsp = (xscale * movespeed) + (_railinst.movespeed * _railinst.dir);
    }
    
    move = key_right + key_left;
    mask_index = spr_crouchmask;
    
    if (sprite_index == spr_tumblestart)
        movespeed = 6;
    
    if ((!grounded && !global.option_septmoveset) && (sprite_index == spr_machroll || sprite_index == spr_mach2jump || sprite_index == spr_backslide || sprite_index == spr_backslideland || sprite_index == spr_crouchslip))
    {
        if (!ispeppino)
        {
            sprite_index = spr_playerN_divebomb;
            state = UnknownEnum.Value_306;
            savedmove = xscale;
            vsp = 20;
            movespeed = hsp;
            input_buffer_slap = 0;
            input_buffer_jump = 0;
            image_index = 0;
            exit;
        }
        else
        {
            scr_soundeffect(11);
            vsp = 10;
            sprite_index = spr_dive;
        }
    }
    
    if (sprite_index == spr_dive && grounded)
        sprite_index = spr_machroll;
    
    if (grounded && sprite_index != spr_tumble && global.option_septmoveset)
        movespeed -= 0.05;
    
    if (key_down2 && (sprite_index == spr_mach2jump || sprite_index == spr_machroll))
    {
        sprite_index = spr_bodyslamstart;
        image_index = 0;
        state = UnknownEnum.Value_122;
        scr_soundeffect(209);
        vsp = (character == "P") ? -5 : -7;
    }
    
    if (global.option_septmoveset && key_attack2 && grounded && sprite_index != spr_tumble && !scr_solid(x, y - 16) && !scr_solid(x, y - 32) && sprite_index != spr_player_breakdance)
    {
        with (instance_create(x, y, obj_jumpdust))
            image_xscale = other.xscale;
        // sends to problem thing
        if (movespeed >= 12)
            state = UnknownEnum.Value_121;
        else
            state = UnknownEnum.Value_104;
        
        image_index = 0;
        sprite_index = spr_rollgetup;
    }
    
    if (scr_slope() && hsp != 0 && movespeed < 20 && global.option_septmoveset)
        scr_player_addslopemomentum(global.slopedeccel, global.slopeaccel);
    
    if (!global.option_septmoveset && (place_meeting(x + hsp, y, obj_solid) || scr_solid_slope(x + hsp, y)) && (!place_meeting(x + hsp, y, obj_destructibles) || character == "V") && !place_meeting(x + hsp, y, obj_climbablewall))
    {
        if (sprite_index == spr_tumble)
        {
            state = UnknownEnum.Value_106;
            image_index = 0;
            sprite_index = spr_tumbleend;
            scr_soundeffect(78);
        }
        else if (sprite_index != spr_tumbleend)
        {
            _bump = ledge_bump((vsp >= 0) ? 32 : 22);
            
            if (_bump)
            {
                state = UnknownEnum.Value_106;
                image_index = 0;
                sprite_index = spr_player_wallsplat;
            }
        }
    }
    
    if (sprite_index == spr_dive && (key_jump || !ispeppino) && !global.option_septmoveset)
    {
        if (ispeppino)
        {
            sprite_index = spr_player_poundcancel1;
            image_index = 0;
            state = UnknownEnum.Value_108;
            scr_soundeffect(209);
            dir = xscale;
            vsp = -6;
        }
        else
        {
            sprite_index = spr_playerN_divebomb;
            state = UnknownEnum.Value_306;
            vsp = 20;
            hsp = 0;
            savedmove = xscale;
            movespeed = 0;
            input_buffer_slap = 0;
            input_buffer_jump = 0;
            image_index = 0;
            exit;
        }
    }
    
    if (movespeed <= 2 && sprite_index != spr_player_breakdance && state != UnknownEnum.Value_106)
        state = UnknownEnum.Value_0;
    
    if (!scr_slope() && sprite_index == spr_tumblestart && floor(image_index) < 11)
        image_index = 11;
    
    if (sprite_index == spr_mach2jump && grounded)
    {
        image_index = 0;
        sprite_index = spr_backslideland;
    }
    
    if (sprite_index == spr_mach2jump && grounded)
        sprite_index = spr_machroll;
    
    if (sprite_index == spr_crouchslip && !grounded && global.option_septmoveset)
        sprite_index = spr_player_jumpdive2;
    
    if (sprite_index == spr_player_jumpdive2 && grounded)
        sprite_index = spr_crouchslip;
    
    if (sprite_index == spr_player_machroll && !grounded)
        sprite_index = spr_player_mach2jump;
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_machroll && movespeed >= 12)
        sprite_index = spr_backslideland;
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_backslideland)
        sprite_index = spr_backslide;
    
    if (sprite_index == spr_player_Sjumpcancel && grounded)
        sprite_index = spr_player_Sjumpcancelland;
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_Sjumpcancelland)
        sprite_index = spr_player_Sjumpcancelslide;
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_breakdance)
    {
        particle_set_scale(UnknownEnum.Value_5, xscale, 1);
        create_particle(x, y, UnknownEnum.Value_5, 0);
        movespeed = 12;
        sprite_index = spr_breakdancesuper;
    }
    
    if (sprite_index == spr_tumblestart && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_tumble;
        movespeed = 14;
    }
    
    if (((place_meeting(x + xscale, y, obj_solid) || place_meeting(x + xscale, y, obj_ghostwall)) && !place_meeting(x + hsp, y, obj_rollblock) && !place_meeting(x + hsp, y, obj_rattumble) && !place_meeting(x + hsp, y, obj_destructibles)) || place_meeting(x, y, obj_timedgate))
    {
        hsp = 0;
        movespeed = 0;
    }
    
    if (key_jump)
        input_buffer_jump = 0;
    
    if (!key_jump2 && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
    {
        vsp /= 2;
        jumpstop = 1;
    }
    
    if (grounded && vsp > 0)
        jumpstop = 0;
    
    if (!global.option_septmoveset && !key_down && key_attack && grounded && sprite_index != spr_tumble && !scr_solid(x, y - 16) && !scr_solid(x, y - 32) && sprite_index != spr_player_breakdance)
    {
        if (crouchslipbuffer == 0)
        {
            with (instance_create(x, y, obj_jumpdust))
                image_xscale = other.xscale;
            
            if (movespeed >= 12)
                state = UnknownEnum.Value_121;
            else
                state = UnknownEnum.Value_104;
            
            image_index = 0;
            sprite_index = spr_rollgetup;
        }
    }
    
    if (!global.option_septmoveset && !key_down && !key_attack && grounded && sprite_index != spr_tumble && !scr_solid(x, y - 16) && !scr_solid(x, y - 32) && sprite_index != spr_player_breakdance)
    {
        if (crouchslipbuffer == 0)
        {
            if (movespeed > 6)
            {
                state = 105;
                sprite_index = spr_machslidestart;
                image_index = 0;
            }
            else
            {
                state = UnknownEnum.Value_0;
            }
        }
    }
    
    if (input_buffer_jump < 8 && grounded && hsp != 0 && !key_down && sprite_index != spr_player_breakdance && (sprite_index == spr_tumble || global.option_septmoveset))
    {
        with (instance_create(x, y, obj_highjumpcloud2))
            image_xscale = other.xscale;
        
        vsp = -11;
        image_index = 0;
        
        if (sprite_index != spr_tumble)
        {
            if (movespeed >= 12)
            {
                state = UnknownEnum.Value_121;
                sprite_index = spr_mach3jump;
            }
            else
            {
                state = UnknownEnum.Value_104;
                sprite_index = spr_secondjump1;
            }
        }
    }
    
    if (sprite_index == spr_player_Sjumpcancelslide || sprite_index == spr_breakdancesuper || sprite_index == spr_machroll || sprite_index == spr_tumble || sprite_index == spr_tumblestart || sprite_index == spr_player_machroll || sprite_index == spr_player_mach2jump)
        image_speed = abs(movespeed) / 15;
    else if (floor(image_index) == (image_number - 1) && sprite_index == spr_mach2jump)
        image_speed = 0;
    else if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_Sjumpcancel)
        image_speed = 0;
    else
        image_speed = 0.35;
    
    if (!instance_exists(dashcloudid) && grounded)
    {
        with (instance_create(x, y, obj_dashcloud))
        {
            image_xscale = other.xscale;
            other.dashcloudid = id;
        }
    }
}
