if (state == UnknownEnum.Value_150)
{
    if (image_index > (image_number - 1))
    {
        with (playerid)
        {
            sprite_index = spr_superspringplayer;
            state = UnknownEnum.Value_97;
            vsp = -10;
            
            if (place_meeting(x, y, obj_solid))
            {
                while (place_meeting(x, y, obj_solid))
                    y--;
            }
            
            if (!place_meeting(x, y, other.id))
            {
                instance_create(x, y, obj_bangeffect);
                
                with (other)
                {
                    state = UnknownEnum.Value_0;
                    playerid = -1;
                }
            }
        }
    }
}
