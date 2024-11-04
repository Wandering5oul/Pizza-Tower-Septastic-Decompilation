function scr_player_handstandjump()
{
    var attackdash, airattackdash, airattackdashstart, _bump;
    
    landAnim = 0;
    hsp = xscale * movespeed;
    move = key_left + key_right;
    momemtum = 1;
    dir = xscale;
    
    if (global.attackstyle != 3)
    {
        if (movespeed < 10)
        {
            if ((sprite_index == spr_player_pistolshot || sprite_index == spr_shotgun_shot) && movespeed < 8)
                movespeed += 0.25;
            else if (sprite_index == spr_player_lunge && movespeed < 12)
                movespeed += 0.8;
            else if (movespeed < 10)
                movespeed += 0.5;
        }
    }
    else
    {
        if (movespeed < 10)
        {
            if ((sprite_index == spr_player_pistolshot || sprite_index == spr_shotgun_shot) && movespeed < 8)
                movespeed += 0.25;
            else if (movespeed < 10)
                movespeed += 0.5;
        }
        
        if (global.pummeltest && !instance_exists(lungeattackID))
        {
            with (instance_create(x, y, obj_lungehitbox))
            {
                playerid = other.id;
                other.lungeattackID = id;
            }
        }
    }
    
    if (shotgunAnim == 1)
        attackdash = spr_shotgunsuplexdash;
    else if (shoot == 1)
        attackdash = 1698;
    else if (shotgunAnim == 1)
        attackdash = spr_shotgunshoot;
    else
        attackdash = spr_suplexdash;
    
    if (sprite_index == spr_player_lungestart && floor(image_index) == (image_number - 1))
        sprite_index = spr_player_lunge;
    
    airattackdash = spr_suplexdashjump;
    airattackdashstart = spr_suplexdashjumpstart;
    
    if (global.attackstyle == 2)
        vsp = 0;
    
    if (!key_jump2 && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
    {
        vsp /= 20;
        jumpstop = 1;
    }
    
    if (key_jump && grounded && !key_down && global.attackstyle != 2)
    {
        jumpstop = 0;
        image_index = 0;
        vsp = -11;
        
        if (movespeed < 10)
            movespeed = 10;
        
        state = UnknownEnum.Value_5;
        
        if (!global.option_septmoveset)
            state = UnknownEnum.Value_104;
        
        sprite_index = spr_player_longjump;
    }
    
    if (grounded && sprite_index == airattackdash && (!key_attack || character == "N") && global.attackstyle != 2)
    {
        if (global.attackstyle != 3)
        {
            state = UnknownEnum.Value_0;
        }
        else
        {
            sprite_index = attackdash;
            image_index = image_number - 6;
        }
    }
    
    if (grounded && sprite_index == airattackdash && key_attack && character != "N" && global.attackstyle != 2)
        state = UnknownEnum.Value_104;
    
    if (floor(image_index) == (image_number - 1))
        state = UnknownEnum.Value_0;
    
    if (floor(image_index) == (image_number - 1) && sprite_index == airattackdashstart)
        sprite_index = airattackdash;
    
    if (floor(image_index) == (image_number - 1) && key_attack)
    {
        image_speed = 0.35;
        state = UnknownEnum.Value_104;
        grav = 0.5;
    }
    
    if (key_jump && doublejump == 0 && global.mort == 1 && !grounded)
    {
        state = UnknownEnum.Value_92;
        
        repeat (6)
            create_debris(x, y, 1297);
        
        scr_soundeffect(127);
        sprite_index = spr_mortdoublejump;
        image_index = 0;
        grav = 0.25;
        
        with (instance_create(x, y, obj_highjumpcloud2))
            image_xscale = other.xscale;
        
        mort = 1;
    }
    
    if (key_down && grounded && global.attackstyle != 2)
    {
        grav = 0.5;
        sprite_index = spr_crouchslip;
        image_index = 0;
        machhitAnim = 0;
        state = UnknownEnum.Value_5;
        
        if (!global.option_septmoveset)
        {
            movespeed = 12;
            crouchslipbuffer = 25;
        }
    }
    
    if ((grounded || global.option_septmoveset) && scr_solid(x + xscale, y) && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)) && !place_meeting(x + xscale, y, obj_destructibles))
    {
        _bump = ledge_bump((vsp >= 0) ? 32 : 22);
        
        if (_bump)
        {
            jumpstop = 1;
            state = UnknownEnum.Value_92;
            vsp = -4;
            sprite_index = spr_suplexbump;
            instance_create(x + (xscale * 10), y + 10, obj_bumpeffect);
        }
    }
    
    if ((!grounded && !global.option_septmoveset) && (place_meeting(x + sign(hsp), y, obj_climbablewall) || place_meeting(x + sign(hsp), y, obj_solid)) && !place_meeting(x + sign(hsp), y, obj_destructibles))
    {
        wallspeed = 6;
        grabclimbbuffer = 10;
        state = UnknownEnum.Value_37;
    }
    
    if (!instance_exists(obj_slidecloud) && grounded && movespeed > 5)
    {
        with (instance_create(x, y, obj_slidecloud))
            image_xscale = other.xscale;
    }
    
    if (character == "S")
    {
        if (key_attack)
        {
            hsp = 0;
            
            if (movespeed < 20)
                movespeed += 0.5;
            
            if (movespeed == 20)
                sprite_index = spr_snick_superpeelout;
            else if (movespeed < 20 && movespeed > 12)
                sprite_index = spr_snick_mach3;
            else if (movespeed < 12 && movespeed > 8)
                sprite_index = spr_snick_mach2;
            else
                sprite_index = spr_snick_walk;
        }
        else if (movespeed >= 12)
        {
            state = UnknownEnum.Value_121;
        }
        else
        {
            state = UnknownEnum.Value_0;
            movespeed = 0;
        }
        
        if (!instance_exists(obj_dashcloud2) && grounded && movespeed > 5)
        {
            with (instance_create(x, y, obj_dashcloud2))
                image_xscale = other.xscale;
        }
    }
    
    image_speed = 0.35;
    
    if (state != UnknownEnum.Value_106 && move != xscale && move != 0)
    {
        image_index = 0;
        
        if (!grounded)
        {
            sprite_index = spr_suplexcancel;
            jumpAnim = 1;
            grav = 0.5;
            state = UnknownEnum.Value_92;
        }
        else
        {
            state = UnknownEnum.Value_0;
            grav = 0.5;
        }
    }
}
