function scr_player_noisejetpack()
{
    var i;
    
    hsp = xscale * movespeed;
    move = key_left + key_right;
    
    if (chainsawcutscene)
    {
        sprite_index = spr_chainsawfireass;
    }
    else if (key_jump2 && jetpackfuel > 0)
    {
        jetpackfuel--;
        vsp = -6;
        sprite_index = spr_playerN_doublejump;
    }
    else
    {
        sprite_index = spr_playerN_doublejumpfall;
    }
    
    if (move != 0)
    {
        if (xscale != move)
        {
            movespeed = Approach(movespeed, 0, 0.5);
            
            if (movespeed <= 0)
            {
                movespeed = 0;
                xscale = move;
            }
        }
        else if (movespeed < 8)
        {
            movespeed = Approach(movespeed, 8, 0.5);
        }
    }
    
    if (place_meeting(x + sign(hsp), y, obj_solid) || scr_solid_slope(x + sign(hsp), y))
    {
        movespeed = 4;
        xscale *= -1;
    }
    
    if (key_down2)
    {
        sprite_index = spr_bodyslamstart;
        image_index = 0;
        state = UnknownEnum.Value_122;
        scr_soundeffect(209);
        vsp = (character == "P") ? -5 : -7;
    }
    
    if ((grounded && vsp > 0) || (key_slap2 && chainsawcutscene))
    {
        if (chainsawcutscene)
        {
            state = UnknownEnum.Value_41;
            
            if (key_slap2)
            {
                movespeed = max(12, movespeed);
                vsp = -9;
                jumpstop = 1;
            }
            
            if (movespeed >= 12)
            {
                sprite_index = spr_chainsawdash;
            }
            else
            {
                sprite_index = spr_chainsawdashstart;
                image_index = 0;
            }
            
            i = y - 50;
            
            while (i <= (y + 50))
            {
                with (instance_create(x, i, obj_dashcloud))
                {
                    image_xscale = obj_player1.xscale;
                    sprite_index = spr_flamecloud;
                }
                
                i += 50;
            }
        }
        else if (movespeed >= 12)
        {
            state = UnknownEnum.Value_121;
            sprite_index = spr_dashpadmach;
            image_index = 0;
        }
        else
        {
            state = UnknownEnum.Value_0;
        }
    }
}
