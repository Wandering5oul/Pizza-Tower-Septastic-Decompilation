if (place_meeting(x, y - 1, obj_player))
{
    with (obj_player)
    {
        if (state != UnknownEnum.Value_186 && place_meeting(x, y + 1, other))
        {
            if (state == UnknownEnum.Value_47)
            {
                state = UnknownEnum.Value_38;
            }
            else if (state != UnknownEnum.Value_38 && state != UnknownEnum.Value_99)
            {
                if (state != UnknownEnum.Value_105 && state != UnknownEnum.Value_5 && state != UnknownEnum.Value_42 && state != UnknownEnum.Value_103 && state != UnknownEnum.Value_104 && state != UnknownEnum.Value_121)
                {
                    if (icedir != -xscale && move != 0)
                    {
                        if (prevmovespeed != 0)
                            icemovespeed = prevmovespeed;
                        else
                            icemovespeed = 8;
                        
                        icedir = -xscale;
                        savedicedir = -xscale;
                    }
                    
                    if (prevmove != move && move == 0)
                    {
                        icemovespeed = -(prevmovespeed - previcemovespeed);
                        icedir = -xscale;
                    }
                }
                else if (state == UnknownEnum.Value_105)
                {
                    if (prevstate != state)
                    {
                        icedir = xscale;
                        icemovespeed = floor(abs(movespeed) * 0.5);
                    }
                }
                else if (state == UnknownEnum.Value_5)
                {
                    icemovespeed = 0;
                }
            }
        }
    }
}
