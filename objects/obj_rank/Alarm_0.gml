global.levelcomplete = 1;
scr_playerreset();

with (obj_player)
{
    if (check_player_coop())
    {
        state = UnknownEnum.Value_0;
        room = backtohubroom;
        x = backtohubstartx;
        y = backtohubstarty;
        image_blend = c_white;
        targetDoor = "none";
        trace(room_get_name(backtohubroom), " ", x, " ", y);
    }
}
