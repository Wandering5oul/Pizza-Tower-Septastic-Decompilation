if (place_meeting(x, y, other) && other.state != UnknownEnum.Value_84 && other.state != UnknownEnum.Value_106 && other.y > other.yprevious && other.y < y)
{
    if (!other.isgustavo)
    {
        other.y = y - 49;
        
        if (other.movespeed < 10)
            other.movespeed = 10;
        
        other.state = UnknownEnum.Value_78;
    }
    else if (other.state != UnknownEnum.Value_202)
    {
        other.y = y + 8;
        other.state = UnknownEnum.Value_202;
    }
}
