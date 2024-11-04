var _x, _y, _xstart, yy, xx;

if (other.state != UnknownEnum.Value_186)
{
    if (obj_player1.character == "V")
        global.playerhealth = clamp(global.playerhealth + 100, 0, 100);
    
    global.heattime = 60;
    
    with (obj_camera)
        healthshaketime = 120;
    
    scr_soundeffect(46);
    
    if (other.object_index == obj_player1)
        global.collect += 1000;
    else
        global.collectN += 1000;
    
    if (global.bullet < 3)
        global.bullet += 1;
    
    _x = x - 48;
    _y = y - 48;
    _xstart = _x;
    
    for (yy = 0; yy < 4; yy++)
    {
        for (xx = 0; xx < 4; xx++)
        {
            create_collect(_x, _y, obj_player1.ispeppino ? choose(1718, 1714, 2732, 1716) : choose(2184, 2185, 2190, 2191, 2192));
            _x += 16;
        }
        
        _x = _xstart;
        _y += 16;
    }
    
    with (instance_create(x + 16, y, obj_smallnumber))
        number = string(1000);
    
    instance_destroy();
    
    if (secret && !instance_exists(obj_fadeout))
    {
        with (obj_player)
        {
            targetRoom = lastroom;
            targetDoor = "S";
            obj_music.secret = false;
            obj_music.secretend = true;
        }
        
        instance_create(x, y, obj_fadeout);
    }
}
