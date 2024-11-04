with (obj_player)
{
    if (state == UnknownEnum.Value_32 && place_meeting(x + hsp, y, other))
    {
        other.destroy = 1;
        instance_destroy(other);
    }
}
