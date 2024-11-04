if (global.panic == 1)
{
    ds_list_add(global.saveroom, id);
    global.gerome = 1;
    global.stylelock = 1;
    instance_create(x, y, obj_geromefollow);
    instance_destroy();
    audio_pause_sound(obj_music.musicID);
    
    if (other.ispeppino)
        scr_soundeffect(231);
    else
        scr_soundeffect(191);
}

if (global.panic == 0)
{
    if (!grabbed && (other.state == UnknownEnum.Value_42 || other.state == UnknownEnum.Value_80 || other.state == UnknownEnum.Value_43) && unpickable == 0)
    {
        instance_create(x + (obj_player1.xscale * 40), y, obj_punchdust);
        
        with (other)
        {
            image_index = 0;
            sprite_index = spr_haulingstart;
            baddiegrabbedID = other.id;
            grabbingenemy = 1;
            state = UnknownEnum.Value_79;
        }
        
        playerid = other.object_index;
        grabbed = 1;
    }
}
