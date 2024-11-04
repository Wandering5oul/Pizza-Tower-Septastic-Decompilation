var playerid, _move, dir;

playerid = 245;

if (obj_player1.spotlight == 0)
    playerid = 244;

if (!instance_exists(playerid))
    exit;

_move = true;

with (obj_player)
{
    if (state == UnknownEnum.Value_119 || state == UnknownEnum.Value_98 || state == UnknownEnum.Value_90 || state == UnknownEnum.Value_46 || state == UnknownEnum.Value_112)
        _move = false;
}

if (!treasure)
{
    if (image_alpha >= 1)
    {
        if (!instance_exists(obj_fadeout) && !obj_player1.cutscene)
        {
            if (_move)
            {
                dir = point_direction(x, y, playerid.x, playerid.y);
                x += lengthdir_x(maxspeed, dir);
                y += lengthdir_y(maxspeed, dir);
            }
        }
    }
    else
    {
        image_alpha += 0.01;
    }
}
else
{
    x = -200;
    y = -200;
}

if (!_move)
    image_alpha = Approach(image_alpha, 0, 0.1);

if (_move && place_meeting(x, y, playerid) && !playerid.cutscene && playerid.state != UnknownEnum.Value_146 && !instance_exists(obj_fadeout) && !instance_exists(obj_endlevelfade) && image_alpha >= 1)
{
    with (playerid)
    {
        instance_destroy(obj_fadeout);
        instance_destroy(obj_baddie, false);
        targetDoor = "A";
        room = timesuproom;
        state = UnknownEnum.Value_64;
        sprite_index = spr_Timesup;
        image_index = 0;
        visible = true;
        image_blend = c_white;
        audio_stop_all();
        scr_soundeffect(148);
    }
    
    instance_destroy();
}

if (maxspeed < 3 && image_alpha == 1)
    maxspeed += 0.01;
