var _transfo, p, val, d, i;

_transfo = 0;

with (other)
{
    if (!scr_transformationcheck() && state != UnknownEnum.Value_95 && state != UnknownEnum.Value_112 && state != UnknownEnum.Value_186)
    {
        if (state == UnknownEnum.Value_11 || state == UnknownEnum.Value_12 || state == UnknownEnum.Value_14 || state == UnknownEnum.Value_12 || state == UnknownEnum.Value_33 || state == UnknownEnum.Value_35 || state == UnknownEnum.Value_34)
        {
            if (hsp != 0)
                xscale = sign(hsp);
            
            movespeed = abs(hsp);
        }
        
        transformationsnd = false;
        state = UnknownEnum.Value_0;
        knightbump = 0;
        dir = xscale;
        _transfo = 1;
    }
}

if (_transfo)
{
    p = other.id;
    
    with (instance_create(other.x - 540, camera_get_view_y(view_camera[0]) - 100, obj_priestangel))
    {
        priestID = other.id;
        playerid = p;
    }
    
    if (sprite_index != spr_angelpriest)
        sprite_index = spr_priest_pray;
    
    if (collect && ds_list_find_index(global.saveroom, id) == -1)
    {
        ds_list_add(global.saveroom, id);
        val = 500;
        global.collect += val;
        global.combotime = 60;
        
        with (instance_create(x + 16, y, obj_smallnumber))
            number = string(val);
        
        scr_soundeffect(37);
        d = round(val / 16);
        
        for (i = 0; i < val; i += d)
            create_collect(other.x + irandom_range(-60, 60), other.y + irandom_range(-60, 60), choose(1714, 1716, 1717, 1718, 1715), d);
    }
}
