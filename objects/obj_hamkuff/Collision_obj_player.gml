if (state != UnknownEnum.Value_138)
{
    if (other.state != UnknownEnum.Value_121 || !other.launched)
    {
        if (state != UnknownEnum.Value_205)
        {
            state = UnknownEnum.Value_205;
            playerid = other.id;
        }
    }
    else
    {
        instance_destroy();
    }
}
