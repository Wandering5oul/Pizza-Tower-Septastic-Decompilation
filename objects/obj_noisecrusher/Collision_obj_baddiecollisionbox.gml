if (instance_exists(other.baddieID))
{
    with (other)
    {
        if ((baddieID.state == UnknownEnum.Value_138 && baddieID.hsp != 0 && baddieID.thrown == 1 && other.state != UnknownEnum.Value_138) || (baddieID.state == UnknownEnum.Value_4 && obj_player.state == UnknownEnum.Value_76))
        {
            other.state = UnknownEnum.Value_138;
            instance_create(other.x, other.y, obj_slapstar);
            instance_create(other.x, other.y, obj_baddiegibs);
            other.flash = 1;
            global.hit += 1;
            instance_create(x, y, obj_bumpeffect);
            other.stunned = 200;
            other.vsp = -5;
            other.hsp = -other.image_xscale * 3;
        }
    }
}
