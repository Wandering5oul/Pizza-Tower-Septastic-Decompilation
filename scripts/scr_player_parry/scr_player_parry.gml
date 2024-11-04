function scr_player_parry()
{
    var _grabbedby, parry_threshold, lag;
    
    if (image_index > (image_number - 1))
    {
        state = UnknownEnum.Value_0;
        
        if (tauntstoredisgustavo)
            state = UnknownEnum.Value_191;
    }
    
    hsp = -xscale * movespeed;
    image_speed = 0.5;
    
    if (movespeed > 0)
        movespeed -= 0.5;
    
    _grabbedby = 1;
    
    if (object_index == obj_player2)
        _grabbedby = 2;
    
    if (parry_count > 0)
    {
        parry_count--;
        parry_threshold = 64;
        
        with (obj_baddie)
        {
            if (distance_to_object(other) < parry_threshold && state != UnknownEnum.Value_137 && state != UnknownEnum.Value_4 && state != UnknownEnum.Value_138 && parryable && !(state == UnknownEnum.Value_138 && thrown == 1))
            {
                obj_player1.xscale = -image_xscale;
                grabbedby = _grabbedby;
                lag = 5;
                hitLag = lag;
                hitX = x;
                hitY = y;
                hp -= 5;
                
                if (!important)
                {
                    global.combo += 1;
                    global.combotime = 60;
                    global.heattime = 60;
                }
                
                obj_player1.hitLag = lag;
                obj_player1.hitX = obj_player1.x;
                obj_player1.hitY = obj_player1.y;
                instance_create(x, y, obj_parryeffect);
                alarm[3] = 1;
                state = UnknownEnum.Value_137;
                image_xscale = -obj_player1.xscale;
                instance_create(x, y, obj_slapstar);
                instance_create(x, y, obj_slapstar);
                instance_create(x, y, obj_slapstar);
                instance_create(x, y, obj_baddiegibs);
                instance_create(x, y, obj_baddiegibs);
                instance_create(x, y, obj_baddiegibs);
                
                with (obj_camera)
                {
                    shake_mag = 3;
                    shake_mag_acc = 3 / room_speed;
                }
                
                other.hithsp = -other.image_xscale * 25;
                other.hitvsp = -6;
            }
        }
    }
}
