var mh_id;

mh_id = other.id;

with (playerid)
{
    if (state != UnknownEnum.Value_14)
    {
        state = UnknownEnum.Value_14;
        morthookID = mh_id;
        tauntstoredmovespeed = movespeed;
        movespeed = 12;
        jumpstop = 0;
        instance_destroy(other);
    }
}
