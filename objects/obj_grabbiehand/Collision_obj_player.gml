if (state == 135)
{
    with (other)
    {
        if (state != UnknownEnum.Value_42)
        {
            state = UnknownEnum.Value_106;
            sprite_index = spr_player_catched;
            other.playerid = id;
            other.state = UnknownEnum.Value_55;
        }
        else
        {
            scr_pummel();
            other.state = UnknownEnum.Value_138;
            other.stunned = 50;
            other.vsp = -6;
            other.hsp = xscale * 5;
            other.image_xscale = -xscale;
        }
    }
}
