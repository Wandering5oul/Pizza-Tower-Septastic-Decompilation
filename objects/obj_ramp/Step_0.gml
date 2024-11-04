var s, by, bx;

if (used)
    image_index = 1;
else
    image_index = 0;

s = 16;

if (place_meeting(x, y - s, obj_player))
{
    with (obj_player)
    {
        by = 4;
        
        if (state == UnknownEnum.Value_121)
            by = 10;
        
        bx = 8;
        
        if (state == UnknownEnum.Value_121 || state == UnknownEnum.Value_201)
            bx = 18;
        
        if ((state == UnknownEnum.Value_104 || state == UnknownEnum.Value_201 || state == UnknownEnum.Value_121 || state == UnknownEnum.Value_187) && y <= (other.y + by) && xscale == sign(other.image_xscale) && place_meeting(x, y + s, other))
        {
            vsp = -12;
            movespeed = 14;
            sprite_index = spr_mach2jump;
            
            if (isgustavo)
            {
                sprite_index = spr_player_ratmountwalljump;
                state = UnknownEnum.Value_203;
            }
            else
            {
                state = UnknownEnum.Value_187;
            }
            
            if (!other.used)
            {
                ramp = 1;
                other.used = 1;
            }
            
            ramp_buffer = 16;
            trace("trickjump");
        }
    }
}
