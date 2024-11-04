if (stationned == 1)
{
    other.xscale = sign(image_xscale);
    other.state = UnknownEnum.Value_32;
    other.movespeed = abs(hsp);
    explode = 0;
    instance_destroy();
}
