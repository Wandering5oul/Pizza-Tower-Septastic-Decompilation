var _levelinfo;

if (fadealpha > 1)
{
    fadein = 1;
    visible = 1;
    
    if (level == 6)
    {
        toppinspr = spr_titlemort;
        toppinlen = sprite_get_number(toppinspr);
    }
    
    if (level >= levelmax)
        level = 0;
    
    if (level < array_length(jingles))
        jingle = audio_play_sound(jingles[!obj_player1.ispeppino][level], 10, false);
    
    if (level < (array_length(texts) / 3))
    {
        text = texts[(level * 3) + choose(0, 1, 2)];
        draw_set_font(global.creditsfont);
        textw = string_width(text) + 50;
    }
    
    camera_set_view_pos(view_camera[0], 0, 0);
    oldlock = obj_camera.lock;
    obj_camera.lock = true;
    
    with (obj_solid)
        visible = false;
    
    with (obj_slope)
        visible = false;
    
    with (obj_platform)
        visible = false;
    
    obj_player1.visible = false;
}

if (fadein == 0)
    fadealpha += 0.1;
else if (fadein == 1)
    fadealpha -= 0.1;

if (fadein == 1 && fadealpha < 0)
{
    fadein = -1;
    fadealpha = 0;
}

if (visible)
{
    playerx = lerp(playerx, 0, 0.1);
    timer += 0.016666666666666666;
    
    if (timer >= 0.5)
    {
        titley = lerp(titley, 0, 0.1);
        
        if (toppinspr == spr_titlemort)
            mortalpha = lerp(mortalpha, 1, 0.1);
    }
    
    if (timer >= 10 || obj_player1.key_jump || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space))
    {
        if (jingle != -4)
            audio_stop_sound(jingle);
        
        if (room == rm_levelselect)
        {
            with (obj_levelselect)
            {
                _levelinfo = level_array[selected_world][selected_level];
                
                with (obj_player)
                {
                    image_index = 0;
                    state = UnknownEnum.Value_95;
                    targetRoom = _levelinfo[1];
                    targetDoor = "A";
                    instance_create(x, y, obj_fadeout);
                }
            }
        }
        else
        {
            mask_index = spr_player_mask;
            
            with (instance_place(obj_player1.x, obj_player1.y, obj_startgate))
            {
                with (obj_player)
                {
                    if (other.level == "snickchallenge")
                    {
                        global.wave = 0;
                        global.maxwave = ((global.minutes * 60) + global.seconds) * 60;
                        
                        if (global.panicbg)
                            scr_panicbg_init();
                        
                        global.snickchallenge = 1;
                        global.collect = 10000;
                        
                        with (obj_camera)
                        {
                            alarm[1] = 60;
                            global.seconds = 59;
                            global.minutes = 9;
                        }
                    }
                    
                    obj_music.fadeoff = 0;
                    targetDoor = "A";
                    targetRoom = other.targetRoom;
                    
                    if (!instance_exists(obj_fadeout))
                        instance_create(x, y, obj_fadeout);
                }
            }
        }
    }
}
