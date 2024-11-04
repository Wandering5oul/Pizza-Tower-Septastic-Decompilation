if (other.cutscene == 0 && sprite_index != spr_bigmushroom_bounce && other.state != UnknownEnum.Value_108 && other.state != UnknownEnum.Value_122 && other.state != UnknownEnum.Value_186)
{
    other.jumpstop = 1;
    
    with (other)
    {
        if (state == UnknownEnum.Value_105)
            state = UnknownEnum.Value_92;
        
        if (state == UnknownEnum.Value_0)
            state = UnknownEnum.Value_92;
    }
    
    sprite_index = spr_bigmushroom_bounce;
    
    if (other.state == UnknownEnum.Value_92 || other.state == UnknownEnum.Value_0)
    {
        other.sprite_index = other.spr_machfreefall;
        other.image_index = 0;
    }
    
    image_index = 0;
    
    if (sign(other.vsp) == 1)
        other.vsp = -other.vsp;
    
    other.vsp -= 6;
    
    if (other.vsp > -14)
        other.vsp = -14;
    
    other.jumpstop = 1;
}
