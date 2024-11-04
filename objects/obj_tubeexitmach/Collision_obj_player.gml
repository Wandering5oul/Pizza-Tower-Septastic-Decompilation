var _offset_x, _offset_y;

if (playerid > -1)
    exit;

if (state != UnknownEnum.Value_0)
    exit;

if (other.state == UnknownEnum.Value_107)
    exit;

if (other.state == UnknownEnum.Value_186)
    exit;

if (object_index != obj_tubeenter && other.state != UnknownEnum.Value_150)
    exit;

_offset_x = 32 * image_xscale;
_offset_y = 14 * image_yscale;

with (other)
{
    if (other.object_index == obj_tubeenter && other.stored_spd == 0)
    {
        if (abs(hsp) < other.movespeed)
            hsp = other.movespeed;
        
        if (abs(vsp) < other.movespeed)
            vsp = other.movespeed;
        
        other.stored_spd = max(abs(hsp), abs(vsp));
    }
    
    state = UnknownEnum.Value_150;
    hsp = 0;
    movespeed = 0;
    vsp = 0;
    tube_vsp = 0;
    x = Approach(x, other.x + _offset_x, other.approach_spd);
    y = Approach(y, other.y + _offset_y, other.approach_spd);
}

if (floor(other.x) == (x + _offset_x) && floor(other.y) == (y + _offset_y))
{
    other.x = x + _offset_x;
    other.y = y + _offset_y;
    image_index = 0;
    playerid = other.id;
    other.state = UnknownEnum.Value_150;
    other.tube_vsp = 0;
    state = UnknownEnum.Value_150;
}
