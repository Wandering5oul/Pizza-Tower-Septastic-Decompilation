function pause_deactivate()
{
    pause_screenshot = sprite_create_from_surface(application_surface, 0, 0, 1920, 1080, false, false, 0, 0);
    pause = true;
    audio_pause_all();
    instance_deactivate_all(true);
    instance_activate_object(obj_inputAssigner);
    instance_activate_object(obj_savesystem);
}

function pause_activate()
{
    sprite_delete(pause_screenshot);
    pause_screenshot = -4;
    pause = false;
    instance_activate_all();
    scr_deactivate_escape();
    alarm[0] = 1;
    audio_resume_all();
}

function pause_create_eyes()
{
    var i, q;
    
    for (i = 0; i < 3; i++)
    {
        q = 
        {
            sprite_index: spr_pause_secreteye,
            found: false,
            x: 250,
            y: 310,
            xstart: x,
            ystart: y,
            disx: 100,
            time_x: 3,
            time_y: 7,
            disy: 130,
            yoffset: 0,
            last_current_time: current_time + (600000 * i * 2),
            number: i + 1,
            back: false
        };
        q.time_x += i - 1;
        q.time_y += (i - 1) * 2;
        q.timer = q.last_current_time;
        ds_list_add(eyelist, q);
        trace(sprite_get_name(q.sprite_index), " ", q.number);
    }
}

function pause_update_eyes()
{
    var i, eye, _x;
    
    if (alpha > 0)
    {
        for (i = 0; i < ds_list_size(eyelist); i++)
        {
            eye = ds_list_find_value(eyelist, i);
            
            with (eye)
            {
                timer += 20;
                yoffset = Wave(-2, 2, 2, 2, timer);
                _x = x;
                x = Wave(xstart - disx, xstart + disx, time_x, 10, timer);
                y = Wave(ystart - disx, ystart + disx, time_y, 10, timer);
                y += yoffset;
                
                if ((x - _x) < 0)
                    back = true;
                else
                    back = false;
                
                last_current_time = current_time;
                
                if (global.secretfound >= number)
                    found = true;
                else
                    found = false;
            }
        }
    }
}

function pause_draw_eyes(argument0 = false)
{
    var i, eye;
    
    for (i = 0; i < ds_list_size(eyelist); i++)
    {
        eye = ds_list_find_value(eyelist, i);
        
        with (eye)
        {
            if (argument0 == back)
                draw_sprite_ext(sprite_index, found, x + 90, y + 360, 1, 1, 0, c_white, obj_pause.alpha);
        }
    }
}

function pause_reset_eyes()
{
    var i, eye;
    
    with (obj_pause)
    {
        for (i = 0; i < ds_list_size(eyelist); i++)
        {
            eye = ds_list_find_value(eyelist, i);
            
            with (eye)
                found = false;
        }
    }
}

function scr_pauseicon_draw(argument0, argument1, argument2)
{
    var icon;
    
    icon = pause_icons[argument0];
    draw_sprite_ext(icon.sprite_index, icon.image_index, argument1 + icon.sprite_xoffset + icon.shake_x, argument2 + icon.sprite_yoffset + icon.shake_y, 1, 1, 0, c_white, icon.image_alpha);
}

function scr_pauseicon_add(argument0, argument1, argument2 = 0, argument3 = 0)
{
    array_push(pause_icons, 
    {
        sprite_index: argument0,
        image_index: argument1,
        image_alpha: 0,
        sprite_xoffset: argument2,
        sprite_yoffset: argument3,
        shake_x: 0,
        shake_y: 0
    });
}

function scr_pauseicons_update(argument0)
{
    var i;
    
    for (i = 0; i < array_length(pause_icons); i++)
    {
        with (pause_icons[i])
        {
            if (i == argument0)
            {
                shake_x = random_range(-1, 1);
                shake_y = random_range(-1, 1);
                image_alpha = Approach(image_alpha, 1, 0.2);
            }
            else
            {
                shake_x = 0;
                shake_y = 0;
                image_alpha = Approach(image_alpha, 0, 0.2);
            }
        }
    }
}
