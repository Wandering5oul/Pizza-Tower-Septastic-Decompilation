if (active)
{
    if (place_meeting(x, y - 1, other) && other.vsp > 1 && other.state != UnknownEnum.Value_113 && other.state != UnknownEnum.Value_116 && other.state != UnknownEnum.Value_114 && other.state != UnknownEnum.Value_115)
    {
        with (other)
        {
            state = UnknownEnum.Value_113;
            image_index = 0;
        }
        
        active = 0;
        alarm[0] = 150;
    }
}
