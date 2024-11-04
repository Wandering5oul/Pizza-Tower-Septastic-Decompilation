with (other)
{
    if (other.hurtplayer == 0)
    {
        if (key_jump2)
        {
            vsp = -20;
            
            if (state == UnknownEnum.Value_0 || state == UnknownEnum.Value_92 || hsp == 0)
            {
                sprite_index = spr_playerV_superjump;
                state = UnknownEnum.Value_92;
            }
            
            image_index = 0;
            jumpAnim = 1;
            jumpstop = 1;
            other.hurtplayer = 1;
        }
    }
}
