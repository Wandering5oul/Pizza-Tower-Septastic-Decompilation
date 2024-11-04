var in_cutscene, prevselected, roomname, rm, str_rm, p, i, t;

if (!window_has_focus() && global.option_unfocus_mute)
    set_master_gain(0);
else
    set_master_gain(global.option_master_volume);

if (instance_exists(obj_option))
    exit;

scr_getinput();
in_cutscene = false;

with (obj_shell)
    in_cutscene = isOpen;

with (obj_technicaldifficulty)
    in_cutscene = true;

with (obj_titlecard)
    in_cutscene = true;

with (obj_mainmenu)
    in_cutscene = true;

with (obj_dialogcontroller)
    in_cutscene = true;

if (key_start && obj_savesystem.state == UnknownEnum.Value_0 && !in_cutscene && room != Realtitlescreen && room != rm_mainmenu && room != rank_room && room != timesuproom)
{
    pause = !pause;
    
    if (pause)
    {
        selected = 0;
        pause_deactivate();
    }
    else
    {
        selected = 0;
        pause_activate();
    }
    
    key_start = false;
}

if (!pause)
{
    alpha = Approach(alpha, 0, 0.1);
    border_x = lerp(border_x, 960 + sprite_get_width(spr_pause_border), 0.05);
    border_y = lerp(border_y, 540 + sprite_get_height(spr_pause_border), 0.05);
    text_y = lerp(text_y, -100, 0.1) + Wave(-2, 2, 3, 2);
    
    if (audio_is_playing(pause_music))
        audio_stop_sound(pause_music);
}
else
{
    alpha = Approach(alpha, 1, 0.1);
    border_x = lerp(border_x, 960, 0.1);
    border_y = lerp(border_y, 540, 0.1);
    text_y = lerp(text_y, 0, 0.1) + Wave(-2, 2, 3, 2);
    
    if (!audio_is_playing(pause_music))
        audio_play_sound(pause_music, 10, true);
    
    audio_sound_gain(pause_music, global.option_music_volume, 0);
}

with (obj_player1)
{
    other.paletteselect = paletteselect;
    other.spr_palette = spr_palette;
    other.ispeppino = ispeppino;
}

if (pause)
{
    scroll++;
    application_surface_draw_enable(true);
    prevselected = selected;
    moveselect = -key_up2 + key_down2;
    selected += moveselect;
    
    if (moveselect != 0 && selected >= 0 && selected <= 3)
        scr_soundeffect(69);
    
    selected = clamp(selected, 0, array_length(pause_menu) - 1);
    
    if (key_jump)
    {
        switch (selected)
        {
            case 0:
                pause_activate();
                break;
            
            case 2:
                roomname = room_get_name(room);
                
                if (!global.snickchallenge)
                {
                    rm = -4;
                    str_rm = string_letters(roomname);
                    
                    switch (string_letters(roomname))
                    {
                        case "entrance":
                        case "entrancec":
                        case "entrancesecret":
                            rm = 23;
                            break;
                        
                        case "medieval":
                        case "medievalsecret":
                        case "medievalb":
                            rm = 31;
                            break;
                        
                        case "chateau":
                        case "chateausecret":
                            rm = 247;
                            break;
                        
                        case "ruin":
                        case "ruinsecret":
                            rm = 43;
                            break;
                        
                        case "dungeon":
                        case "dungeonsecret":
                            rm = 59;
                            break;
                        
                        case "desert":
                        case "desertsecret":
                            rm = 86;
                            break;
                        
                        case "graveyard":
                        case "graveyardsecret":
                            rm = 110;
                            break;
                        
                        case "farm":
                        case "farmsecret":
                            rm = 126;
                            break;
                        
                        case "ufo":
                        case "ufosecret":
                            rm = 149;
                            break;
                        
                        case "beach":
                        case "beachsecret":
                            rm = 170;
                            break;
                        
                        case "forest":
                        case "forestsecret":
                            rm = 190;
                            break;
                        
                        case "street":
                        case "streetintro":
                            rm = 574;
                            break;
                        
                        case "dragonlair":
                        case "dragonlairsecret":
                            rm = 77;
                            break;
                        
                        case "strongcold":
                        case "strongcoldsecret":
                            rm = 282;
                            break;
                        
                        case "kidspartyentrance":
                        case "kidsparty":
                        case "kidspartysecret":
                            rm = 482;
                            break;
                    }
                    
                    if (rm == -4)
                        rm = asset_get_index(str_rm + "_1");
                    
                    if (rm == -1)
                        rm = asset_get_index(string_copy(str_rm, 1, string_length(str_rm) - string_length("secret")) + "_1");
                    
                    ds_list_clear(global.saveroom);
                    ds_list_clear(global.baddieroom);
                    
                    if (rm != -4 && rm != -1)
                    {
                        instance_activate_all();
                        global.levelreset = 1;
                        instance_destroy(obj_fadeout);
                        scr_room_goto(rm);
                        scr_playerreset();
                        pause = 0;
                        obj_player1.targetDoor = "A";
                        
                        if (instance_exists(obj_player2))
                            obj_player2.targetDoor = "A";
                    }
                    else
                    {
                        scr_soundeffect(48);
                    }
                }
                
                break;
            
            case 1:
                scr_soundeffect(25, 31, 218);
                
                with (instance_create(x, y, obj_option))
                    depth = other.depth - 1;
                
                break;
            
            case 3:
                if (room == hub_room1 || room == characterselect || room == cowboytask || room == Titlescreen || room == Scootertransition || room == rm_levelselect || string_copy(room_get_name(room), 1, 3) == "hub")
                {
                    pause_activate();
                    instance_destroy(obj_fadeout);
                    room = Realtitlescreen;
                    
                    with (obj_player1)
                    {
                        character = "P";
                        scr_characterspr();
                    }
                    
                    scr_playerreset();
                    obj_player1.state = UnknownEnum.Value_18;
                    obj_player2.state = UnknownEnum.Value_18;
                    obj_player1.targetDoor = "A";
                    
                    if (instance_exists(obj_player2))
                        obj_player2.targetDoor = "A";
                    
                    global.cowboyhat = 0;
                    global.coop = 0;
                }
                else
                {
                    pause_activate();
                    instance_destroy(obj_fadeout);
                    scr_playerreset();
                    global.levelreset = 1;
                    obj_player1.targetDoor = "A";
                    
                    if (instance_exists(obj_player2))
                        obj_player2.targetDoor = "A";
                    
                    room = rm_levelselect;
                }
                
                break;
        }
    }
    
    cursor_index += 0.35;
    
    if (cursor_index > cursor_sprite_number)
    {
        p = cursor_index - floor(cursor_index);
        cursor_index = p;
    }
    
    peppino_index += 0.35;
    
    if (peppino_index > peppino_sprite_number)
    {
        p = peppino_index - floor(peppino_index);
        peppino_index = p;
    }
    
    for (i = 0; i < array_length(toppin_sprite); i++)
    {
        toppin_index[i] += 0.35;
        
        if (toppin_index[i] > toppin_number[i])
        {
            t = toppin_index[i];
            p = t - floor(t);
            toppin_index[i] = p;
        }
    }
    
    toppin_has[0] = global.shroomfollow;
    toppin_has[1] = global.cheesefollow;
    toppin_has[2] = global.tomatofollow;
    toppin_has[3] = global.sausagefollow;
    toppin_has[4] = global.pineapplefollow;
}

pause_update_eyes();
