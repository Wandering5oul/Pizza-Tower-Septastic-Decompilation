use_static = true;
static_index = sprite_get_number(spr_tvstatic) - 1;
static_dir = -1;
scr_soundeffect(4);

with (playerid)
{
    if (!isgustavo)
        state = UnknownEnum.Value_0;
    else
        state = UnknownEnum.Value_191;
    
    visible = true;
    x = roomstartx;
    y = roomstarty;
    landAnim = false;
}
