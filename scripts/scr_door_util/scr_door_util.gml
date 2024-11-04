function door_get_exit(argument0 = false)
{
    var _objectname, _doorname, _saveddoor;
    
    _objectname = object_get_name(object_index);
    
    if (!argument0)
    {
        with (instance_place(x, y, par_door))
        {
            _doorname = object_get_name(object_index);
            _saveddoor = _doorname;
            _doorname = string_replace(_doorname, "obj_door", "");
            other.targetDoor = _doorname;
            trace(_objectname, " ", _saveddoor, " ", other.targetDoor);
        }
    }
    else
    {
        with (instance_place(x, y + 1, par_door))
        {
            _doorname = object_get_name(object_index);
            _saveddoor = _doorname;
            _doorname = string_replace(_doorname, "obj_door", "");
            other.targetDoor = _doorname;
            trace(_objectname, " ", _saveddoor, " ", other.targetDoor);
        }
        
        with (instance_place(x, y - 1, par_door))
        {
            _doorname = object_get_name(object_index);
            _saveddoor = _doorname;
            _doorname = string_replace(_doorname, "obj_door", "");
            other.targetDoor = _doorname;
            trace(_objectname, " ", _saveddoor, " ", other.targetDoor);
        }
    }
}

function player_door_goto()
{
    var _doorobj;
    
    _doorobj = asset_get_index("obj_door" + targetDoor);
    
    if (object_exists(_doorobj))
    {
        if (instance_exists(_doorobj))
        {
            if (hallway == 1)
                x = _doorobj.x + (hallwaydirection * 100);
            else if (box == 1)
                x = _doorobj.x + 32;
            else
                x = _doorobj.x + 16;
            
            y = _doorobj.y - 14;
        }
    }
}
