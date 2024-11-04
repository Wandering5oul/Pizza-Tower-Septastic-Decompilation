var baddie, _xs;

baddie = id;

if (state != 141)
{
    with (other)
    {
        if (y < other.y && attacking == 0 && sprite_index != spr_player_mach2jump && ((state == UnknownEnum.Value_3 && vsp > 0) || state == UnknownEnum.Value_92 || state == UnknownEnum.Value_103 || state == UnknownEnum.Value_79) && vsp > 0 && other.vsp >= 0 && sprite_index != spr_stompprep)
        {
            scr_soundeffect(52);
            image_index = 0;
            
            if (key_jump2)
            {
                instance_create(x, y + 50, obj_stompeffect);
                stompAnim = 1;
                vsp = -14;
                
                if (state == UnknownEnum.Value_92)
                    sprite_index = spr_stompprep;
            }
            else
            {
                instance_create(x, y + 50, obj_stompeffect);
                stompAnim = 1;
                vsp = -9;
                
                if (state == UnknownEnum.Value_92)
                    sprite_index = spr_stompprep;
            }
        }
        
        if (y >= other.y && other.thrown == 0 && other.stuntouchbuffer == 0 && other.vsp > 0 && state != UnknownEnum.Value_106 && other.state != 141)
        {
            scr_soundeffect(56);
            
            if (state != UnknownEnum.Value_51 && state != UnknownEnum.Value_103 && state != UnknownEnum.Value_102)
                movespeed = 0;
            
            _xs = sign(x - baddie.x);
            
            if (floor(_xs) == 0)
                _xs = xscale;
            
            hsp = 3 * _xs;
            state = UnknownEnum.Value_106;
            xscale = -_xs;
            sprite_index = spr_bump;
            vsp = -4;
        }
    }
}
else
{
    with (other)
    {
        if (state != UnknownEnum.Value_59)
        {
            state = UnknownEnum.Value_59;
            sprite_index = spr_squished;
            image_index = 0;
            scr_losepoints();
        }
    }
}
