with (other)
{
    if (key_up && ladderbuffer == 0 && (state == UnknownEnum.Value_9 || state == UnknownEnum.Value_0 || state == UnknownEnum.Value_58 || state == UnknownEnum.Value_104 || state == UnknownEnum.Value_121 || state == UnknownEnum.Value_103 || state == UnknownEnum.Value_57 || state == UnknownEnum.Value_60) && state != UnknownEnum.Value_107 && state != UnknownEnum.Value_105 && state != UnknownEnum.Value_108 && state != UnknownEnum.Value_111)
    {
        other.hooked = 1;
        mach2 = 0;
        state = UnknownEnum.Value_93;
        x = other.x + 16;
        y = floor(y);
        
        if ((y % 2) == 1)
            y--;
        
        if (y > (other.y + 90))
            y -= 5;
    }
}
