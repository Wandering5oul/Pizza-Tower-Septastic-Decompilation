var _sw, _sh;

if (instance_exists(obj_option))
    exit;

scr_getinput();
move = key_left2 + key_right2;
move2 = key_down2 - key_up2;
_sw = sprite_get_width(spr_mainmenu_logo);
_sh = sprite_get_height(spr_mainmenu_logo);

if (ispeppino)
{
    bg_x = lerp_offset(bg_x, 60, 0.07);
    scroll_x = lerp_offset(scroll_x, 0, 0.1);
    scroll_xtarget = 0;
    logo_x = lerp_offset(logo_x, 960 - (_sw / 2), 0.09);
}
else
{
    bg_x = lerp_offset(bg_x, -60, 0.07);
    scroll_x = lerp_offset(scroll_x, -960, 0.1);
    scroll_xtarget = -960;
    logo_x = lerp_offset(logo_x, _sw / 2, 0.09);
}

if (!ready)
{
    if (ispeppino)
    {
        cursor2_x = lerp_offset(cursor2_x, logo_x + (_sw / 2), 0.1);
        cursor2_y = lerp_offset(cursor2_y, -100, 0.1);
        cursor1_x = lerp_offset(cursor1_x, logo_x - (stringwidth / 2), 0.1);
        cursor1_y = lerp_offset(cursor1_y, ((room_height / 2) + (48 * selected)) - 8, 0.1);
    }
    else
    {
        cursor1_x = lerp_offset(cursor1_x, logo_x - (_sw / 2), 0.1);
        cursor1_y = lerp_offset(cursor1_y, -100, 0.1);
        cursor2_x = lerp_offset(cursor2_x, logo_x + (stringwidth / 2), 0.1);
        cursor2_y = lerp_offset(cursor2_y, ((room_height / 2) + (48 * selected)) - 8, 0.1);
    }
}
else
{
    cursor1_x = lerp_offset(cursor1_x, logo_x - (_sw / 2), 0.1);
    cursor1_y = lerp_offset(cursor1_y, -100, 0.1);
    cursor2_x = lerp_offset(cursor2_x, logo_x + (_sw / 2), 0.1);
    cursor2_y = lerp_offset(cursor2_y, -100, 0.1);
}

if ((saves || selected == 2) && !ready)
    icon_fade = Approach(icon_fade, 1, 0.1);
else
    icon_fade = Approach(icon_fade, 0, 0.1);

bgboil += 0.15;
pep_index += 0.15;
clouds_x += 0.5;
cursor_index += 0.35;
icon_index += 0.35;

if (!confirmscreen)
{
    if (!ready)
    {
        with (obj_player)
            state = UnknownEnum.Value_18;
        
        if (move != 0 && (saves || selected == 2) && scroll_x == scroll_xtarget)
        {
            if (move == -1)
            {
                ispeppino = true;
                icon_sprite = spr_mainmenu_noiseicon;
                scr_soundeffect(69);
            }
            else
            {
                ispeppino = false;
                icon_sprite = spr_mainmenu_peppinoicon;
                scr_soundeffect(69);
            }
        }
        
        selected += move2;
        
        if (move2 != 0)
            scr_soundeffect(69);
        
        selected = wrap(selected, 0, array_length(text_arr[saves]) - 1);
        
        if (key_slap2 && saves)
        {
            saves = false;
            scr_soundeffect(48);
            selected = 0;
        }
        
        if (key_jump)
        {
            if (!saves)
            {
                switch (selected)
                {
                    case 0:
                        saves = true;
                        selected = 1;
                        break;
                    
                    case 1:
                        instance_create(0, 0, obj_option);
                        scr_soundeffect(25, 31, 218);
                        break;
                    
                    case 2:
                        with (obj_player1)
                        {
                            targetRoom = 554;
                            targetDoor = "A";
                            ispeppino = other.ispeppino;
                            scr_characterspr();
                            instance_create(0, 0, obj_fadeout);
                        }
                        
                        with (obj_player2)
                        {
                            targetRoom = 554;
                            targetDoor = "A";
                            ispeppino = !other.ispeppino;
                            scr_characterspr();
                            instance_create(0, 0, obj_fadeout);
                        }
                        
                        break;
                    
                    case 3:
                        confirmscreen = true;
                        confirmselect = 1;
                        break;
                }
            }
            else
            {
                switch (selected)
                {
                    case 0:
                        saves = false;
                        scr_soundeffect(48);
                        break;
                    
                    case 1:
                    case 2:
                    case 3:
                        file = selected;
                        alarm[0] = 200;
                        audio_stop_all();
                        scr_soundeffect(216);
                        scr_soundeffect(97);
                        
                        with (obj_camera)
                        {
                            shake_mag = 5;
                            shake_mag_acc = 15 / room_speed;
                            targetzoom = 0.8;
                            targetzoom = clamp(targetzoom, 0, max_zoom);
                            zoomspd = 0.5;
                        }
                        
                        thunderalpha = 2;
                        ready = true;
                        break;
                }
            }
            
            key_jump = false;
        }
    }
    else
    {
        uialpha = Approach(uialpha, 0, 0.1);
        thunderalpha = Approach(thunderalpha, 0, 0.1);
    }
}
else
{
    confirmselect += move;
    confirmselect = wrap(confirmselect, 0, 1);
    
    if (key_slap2)
    {
        confirmscreen = false;
        key_slap2 = false;
        key_jump = false;
    }
    
    if (key_jump)
    {
        if (confirmselect == 0)
        {
            game_end();
        }
        else
        {
            confirmscreen = false;
            key_jump = false;
        }
    }
}
