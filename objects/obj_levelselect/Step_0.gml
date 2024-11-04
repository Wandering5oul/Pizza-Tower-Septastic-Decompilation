var _m, _levelinfo;

if (!instance_exists(obj_option) && !instance_exists(obj_titlecard))
{
    scr_getinput();
    _m = key_down2 - key_up2;
    selected_world += _m;
    selected_world = clamp(selected_world, 0, array_length(level_array) - 1);
    
    if (_m != 0)
        selected_level = 0;
    
    selected_level += (key_left2 + key_right2);
    selected_level = clamp(selected_level, 0, array_length(level_array[selected_world]) - 1);
    
    if (!active)
        exit;
    
    if (key_jump2 && !instance_exists(obj_fadeout))
    {
        _levelinfo = level_array[selected_world][selected_level];
        
        with (obj_player)
        {
            image_index = 0;
            state = UnknownEnum.Value_95;
            targetRoom = _levelinfo[1];
            targetDoor = "A";
            global.leveltosave = _levelinfo[2];
            
            with (instance_create(0, 0, obj_titlecard))
                level = (obj_levelselect.selected_world * 4) + obj_levelselect.selected_level;
        }
    }
}
