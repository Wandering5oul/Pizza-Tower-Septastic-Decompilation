if (state == UnknownEnum.Value_150)
{
    if (image_index > (image_number - 1))
    {
        with (playerid)
        {
            state = UnknownEnum.Value_150;
            tube_id = other.id;
            hsp = other.hsp * other.stored_spd;
            vsp = other.vsp * other.stored_spd;
            tube_vsp = other.vsp * other.stored_spd;
            stored_spd = 0;
            
            if (!place_meeting(x, y, other.id))
            {
                with (other)
                {
                    playerid = -1;
                    state = UnknownEnum.Value_0;
                }
            }
        }
    }
}
