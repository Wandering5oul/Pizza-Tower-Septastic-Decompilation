if (place_meeting(x, y - 1, obj_player))
{
    with (obj_player)
    {
        if (state != UnknownEnum.Value_148 && state != UnknownEnum.Value_91 && state != UnknownEnum.Value_186)
        {
            if (place_meeting(x, y + 1, other))
            {
                if (state != UnknownEnum.Value_113 && state != UnknownEnum.Value_114 && state != UnknownEnum.Value_116 && state != UnknownEnum.Value_115)
                {
                    state = UnknownEnum.Value_94;
                    sprite_index = spr_currentplayer;
                }
                else
                {
                    state = UnknownEnum.Value_116;
                    
                    if (sprite_index != spr_player_barrelslipnslide)
                        sprite_index = spr_player_barrelroll;
                }
                
                xscale = sign(other.image_xscale);
                movespeed = 20;
            }
        }
    }
}
