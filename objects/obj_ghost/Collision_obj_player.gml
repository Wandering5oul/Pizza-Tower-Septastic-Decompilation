if (!instance_exists(obj_fadeout))
{
    with (obj_player)
    {
        targetRoom = lastroom;
        state = UnknownEnum.Value_0;
        skateboarding = 0;
    }
    
    with (obj_player)
        lastroom = room;
    
    instance_create(x, y, obj_fadeout);
}
