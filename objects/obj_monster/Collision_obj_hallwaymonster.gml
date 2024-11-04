var _destroy, _monsterpos, _dir;

if (state != 216 && state != 218 && state != 217 && !hallway && use_hallway && image_xscale == sign(other.image_xscale))
{
    _destroy = 0;
    
    with (obj_monstertrackingrooms)
    {
        _monsterpos = monster_pos[other.monsterid];
        _dir = other.image_xscale;
        
        if (grid_meeting(_monsterpos.x + _dir, _monsterpos.y))
        {
            _monsterpos.x += _dir;
            monster_dir[other.monsterid].x = _dir;
            _destroy = 1;
            alarm[other.monsterid] = monster_alarm[other.monsterid];
        }
    }
    
    if (_destroy)
    {
        destroy = 0;
        instance_destroy();
    }
}
