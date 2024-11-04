switch (state)
{
    case UnknownEnum.Value_80:
        if (floor(image_index) == (image_number - 1))
        {
            state = UnknownEnum.Value_0;
            sprite_index = spr_knight;
        }
        
        break;
}

if (cooldown > 0 && state != UnknownEnum.Value_80)
    cooldown--;
