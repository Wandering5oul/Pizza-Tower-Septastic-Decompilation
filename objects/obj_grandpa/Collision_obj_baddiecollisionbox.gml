with (other)
{
    if (instance_exists(baddieID) && baddieID != other.id)
    {
        if ((baddieID.state == UnknownEnum.Value_138 && baddieID.thrown == 1) || obj_player.state == UnknownEnum.Value_76)
        {
            instance_destroy();
            instance_destroy(baddieID);
            instance_destroy(other);
        }
    }
}
