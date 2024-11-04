function scr_player_shotgunshoot()
{
    image_speed = 0.4;
    move = key_left + key_right;
    hsp = move * movespeed;
    
    if (dir != xscale)
    {
        dir = xscale;
        movespeed = 2;
    }
    
    if (move != 0)
    {
        xscale = move;
        
        if (movespeed < 8)
            movespeed += 0.5;
    }
    else
    {
        movespeed = 0;
    }
    
    if (floor(image_index) == (image_number - 1))
    {
        if (grounded)
        {
            sprite_index = spr_shotgunidle;
            state = UnknownEnum.Value_66;
        }
        else
        {
            sprite_index = spr_shotgunfall;
            state = UnknownEnum.Value_57;
        }
    }
}
