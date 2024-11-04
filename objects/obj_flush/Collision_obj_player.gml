var _found;

if (state == 219)
{
    state = 220;
    _found = 0;
    
    with (obj_flush)
    {
        if (state == 219 && trigger == other.trigger)
            _found = 1;
    }
    
    if (!_found)
    {
        with (obj_flush)
        {
            if (trigger == other.trigger)
                instance_destroy();
        }
    }
}
