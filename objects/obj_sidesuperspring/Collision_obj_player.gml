with (other)
{
    if (state != UnknownEnum.Value_186)
    {
        if (state == UnknownEnum.Value_53 || state == UnknownEnum.Value_32 || state == UnknownEnum.Value_94 || state == UnknownEnum.Value_184 || state == UnknownEnum.Value_78 || state == UnknownEnum.Value_5 || state == UnknownEnum.Value_21 || state == UnknownEnum.Value_38 || state == UnknownEnum.Value_65 || state == UnknownEnum.Value_121 || state == UnknownEnum.Value_104)
        {
            other.sprite_index = spr_sidespringblock_bounce;
            other.image_index = 0;
            
            if (xscale != other.image_xscale)
                xscale = other.image_xscale;
        }
    }
}
