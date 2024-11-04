function scr_player_actor()
{
    var _room_x, _room_y, _room_w, _room_h;
    
    if (sprite_index == spr_player_givepizza || sprite_index == spr_player_gnomecutscene2)
    {
        if (image_index > (image_number - 1))
            image_index = image_number - 1;
    }
    
    if (sprite_index == spr_playerN_noisebombkick)
    {
        if (floor(image_index) == 4)
        {
            hsp = 2 * -xscale;
            vsp = -4;
            grounded = false;
            
            with (obj_bucketNPC)
            {
                if (image_index != 1)
                {
                    image_xscale = other.xscale;
                    image_index = 1;
                    scr_soundeffect(38);
                    
                    repeat (3)
                    {
                        with (create_debris(x, y, 71))
                            hsp += (4 * other.image_xscale);
                    }
                }
            }
        }
        
        if (image_index > (image_number - 1))
            sprite_index = spr_idle;
        
        if (grounded)
            hsp = 0;
    }
    
    cutscene = 1;
    movespeed = 0;
    _room_x = 0;
    _room_y = 0;
    _room_w = room_width;
    _room_h = room_height;
    
    if (room == custom_lvl_room && cam != -4)
    {
        _room_x = cam.x;
        _room_y = cam.y;
        _room_w = cam_width;
        _room_h = cam_height;
    }
    
    if (float)
    {
        hsp = 0;
        vsp = 0;
    }
    
    x = clamp(x, _room_x, _room_w);
    y = clamp(y, _room_y, _room_h);
    
    if (sprite_index == spr_player_chainsawintro)
    {
        if (image_index > (image_number - 1))
        {
            chainsawcutscene = true;
            state = UnknownEnum.Value_0;
            sprite_index = spr_idle;
            audio_resume_sound(obj_music.musicID);
        }
    }
}
