with (obj_player1)
{
    if (shotgunAnim == 1)
    {
        if (state != UnknownEnum.Value_0 && state != UnknownEnum.Value_100 && state != UnknownEnum.Value_71 && state != UnknownEnum.Value_111 && state != UnknownEnum.Value_92 && state != UnknownEnum.Value_42)
            other.visible = true;
        else
            other.visible = false;
    }
    
    other.x = x - (20 * xscale);
    other.y = y;
    other.image_xscale = -xscale;
}

if (room == rank_room)
    visible = false;
