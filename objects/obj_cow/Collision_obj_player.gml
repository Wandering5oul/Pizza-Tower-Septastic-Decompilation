with (other)
{
    if (state != UnknownEnum.Value_190 && vsp > 0 && !place_meeting(x, yprevious, other))
    {
        if (state == UnknownEnum.Value_11 || state == UnknownEnum.Value_12 || state == UnknownEnum.Value_13)
            has_mort = 1;
        else
            has_mort = 0;
        
        state = UnknownEnum.Value_190;
        cowID = other.id;
    }
    
    if (state != UnknownEnum.Value_190 && state != UnknownEnum.Value_59 && cow_buffer <= 0)
    {
        state = UnknownEnum.Value_59;
        sprite_index = spr_squished;
        image_index = 0;
        hsp = 0;
        vsp = 0;
        movespeed = 0;
    }
}
