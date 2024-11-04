image_speed = 0.35;

if (active)
{
    if (sprite_index == spr_secretportal_close && !touched)
    {
        sprite_index = spr_secretportal_open;
        image_index = 0;
    }
}

if (touched && sprite_index == spr_secretportal_close)
{
    with (playerid)
    {
        hsp = 0;
        vsp = 0;
        x = other.x;
        y = other.y;
        visible = false;
        fallinganimation = 0;
        
        if (state == UnknownEnum.Value_104 || state == UnknownEnum.Value_121)
            state = UnknownEnum.Value_0;
    }
    
    with (obj_grindrailslope)
        visible = false;
}

if (floor(image_index) == (image_number - 1))
{
    switch (sprite_index)
    {
        case spr_secretportal_open:
            sprite_index = spr_secretportal_idle;
            break;
        
        case spr_secretportal_close:
            image_index = image_number - 1;
            
            if (touched)
            {
                if (!instance_exists(obj_fadeout))
                {
                    with (obj_music)
                    {
                        if (other.secret)
                            secret = false;
                        else
                            secret = true;
                    }
                    
                    with (obj_player)
                    {
                        lastTargetDoor = targetDoor;
                        targetDoor = "S";
                        secrettv = 0;
                        
                        if (!other.secret)
                        {
                            lastroom = room;
                            targetRoom = other.targetRoom;
                            secretportalID = other.id;
                        }
                        else
                        {
                            targetRoom = lastroom;
                        }
                    }
                    
                    if (!secret)
                        ds_list_add(global.saveroom, id);
                    
                    instance_create(x, y, obj_fadeout);
                }
            }
            
            break;
    }
}
