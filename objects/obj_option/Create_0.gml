var categories, audio_menu, video_menu, window_menu, game_menu, controls_menu, keyboard_menu, controller_menu, back, deadzones_menu;

depth = -99;
scr_initinput();
stickpressed_h = 0;
stickpressed_v = 0;
slidecount = 0;
slidebuffer = 0;
bg_alpha = [1, 0, 0, 0, 0];
bg_x = 0;
bg_y = 0;
menus = [];
lastmenu = 0;
menu = 0;
optionselected = 0;
backbuffer = 0;
pause_icons = array_create(0);
scr_pauseicon_add(spr_pauseicons, 4);
scr_pauseicon_add(spr_pauseicons, 5);
scr_pauseicon_add(spr_pauseicons, 6);
scr_pauseicon_add(spr_pauseicons, 7, 8, 8);
categories = create_menu_fixed(UnknownEnum.Value_0, UnknownEnum.Value_0, 0, 48, -4);
add_option_press(categories, 0, "AUDIO", function()
{
    menu_goto(UnknownEnum.Value_1);
});
add_option_press(categories, 1, "VIDEO", function()
{
    menu_goto(UnknownEnum.Value_2);
});
add_option_press(categories, 2, "GAME", function()
{
    menu_goto(UnknownEnum.Value_6);
});
add_option_press(categories, 3, "CONTROLS", function()
{
    menu_goto(UnknownEnum.Value_7);
});
array_push(menus, categories);
audio_menu = create_menu_fixed(UnknownEnum.Value_1, UnknownEnum.Value_1, 150, 40);
add_option_press(audio_menu, 0, "BACK", function()
{
    menu_goto(UnknownEnum.Value_0);
});
add_option_slide(audio_menu, 1, "MASTER VOLUME", function(argument0)
{
    global.option_master_volume = argument0 / 100;
    set_audio_config(false);
}, function(argument0)
{
    global.option_master_volume = argument0 / 100;
    set_audio_config();
}).value = global.option_master_volume * 100;
add_option_slide(audio_menu, 2, "MUSIC VOLUME", function(argument0)
{
    global.option_music_volume = argument0 / 100;
    set_audio_config(false);
}, function(argument0)
{
    global.option_music_volume = argument0 / 100;
    set_audio_config();
}).value = global.option_music_volume * 100;
add_option_slide(audio_menu, 3, "SFX VOLUME", function(argument0)
{
    global.option_sfx_volume = argument0 / 100;
    set_audio_config(false);
}, function(argument0)
{
    global.option_sfx_volume = argument0 / 100;
    set_audio_config();
}).value = global.option_sfx_volume * 100;
add_option_toggle(audio_menu, 4, "UNFOCUSED MUTE", function(argument0)
{
    ini_open("saveData.ini");
    ini_write_real("Option", "unfocus_mute", argument0);
    ini_close();
    global.option_unfocus_mute = argument0;
}).value = global.option_unfocus_mute;
add_option_toggle(audio_menu, 5, "MUSIC SPEED", function(argument0)
{
    ini_open("saveData.ini");
    ini_write_real("Option", "music_speed", argument0);
    ini_close();
    global.option_music_speed = argument0;
}).value = global.option_music_speed;
array_push(menus, audio_menu);
video_menu = create_menu_fixed(UnknownEnum.Value_2, UnknownEnum.Value_1, 150, 40);
add_option_press(video_menu, 0, "BACK", function()
{
    menu_goto(UnknownEnum.Value_0);
});
add_option_press(video_menu, 1, "WINDOW MODE", function()
{
    menu_goto(UnknownEnum.Value_3);
});
add_option_multiple(video_menu, 2, "RESOLUTION", [create_option_value("480X270", 0, false), create_option_value("960X540", 1, false), create_option_value("1920X1080", 2, false)], function(argument0)
{
    ini_open("saveData.ini");
    ini_write_real("Option", "resolution", argument0);
    ini_close();
    global.option_resolution = argument0;
    screen_apply_size();
}).value = global.option_resolution;
add_option_toggle(video_menu, 3, "VSYNC", function(argument0)
{
    ini_open("saveData.ini");
    ini_write_real("Option", "vsync", argument0);
    ini_close();
    global.option_vsync = argument0;
    screen_apply_vsync();
}).value = global.option_vsync;
add_option_toggle(video_menu, 4, "SHOW HUD", function(argument0)
{
    ini_open("saveData.ini");
    ini_write_real("Option", "hud", argument0);
    ini_close();
    global.option_hud = argument0;
}).value = global.option_hud;
add_option_multiple(video_menu, 5, "ANGLE ROTATION", [create_option_value("OFF", 0, false), create_option_value("SNAP", 1, false), create_option_value("SMOOTH", 2, false)], function(argument0)
{
    ini_open("saveData.ini");
    ini_write_real("Option", "slope_angle", argument0);
    ini_close();
    global.option_anglerotation = argument0;
}).value = global.option_anglerotation;
array_push(menus, video_menu);
window_menu = create_menu_fixed(UnknownEnum.Value_3, UnknownEnum.Value_1, 150, 40, UnknownEnum.Value_2);
add_option_press(window_menu, 0, "BACK", function()
{
    menu_goto(UnknownEnum.Value_2);
});
add_option_press(window_menu, 1, "WINDOWED", function()
{
    var opt;
    
    opt = global.option_fullscreen;
    global.option_fullscreen = false;
    window_set_fullscreen(false);
    
    with (instance_create(0, 0, obj_screenconfirm))
    {
        savedoption = opt;
        section = "Option";
        key = "fullscreen";
        varname = "option_fullscreen";
        depth = obj_option.depth - 1;
    }
    
    screen_apply_size();
});
add_option_press(window_menu, 2, "FULLSCREEN", function()
{
    var opt;
    
    opt = global.option_fullscreen;
    global.option_fullscreen = true;
    window_set_fullscreen(true);
    
    with (instance_create(0, 0, obj_screenconfirm))
    {
        savedoption = opt;
        section = "Option";
        key = "fullscreen";
        varname = "option_fullscreen";
        depth = obj_option.depth - 1;
    }
    
    screen_apply_size();
});
array_push(menus, window_menu);
game_menu = create_menu_fixed(UnknownEnum.Value_6, UnknownEnum.Value_1, 150, 40);
add_option_press(game_menu, 0, "BACK", function()
{
    menu_goto(UnknownEnum.Value_0);
});
add_option_toggle(game_menu, 1, "VIBRATION", function(argument0)
{
    ini_open("saveData.ini");
    ini_write_real("Option", "vibration", argument0);
    ini_close();
    global.option_vibration = argument0;
}).value = global.option_vibration;
add_option_toggle(game_menu, 1, "SCREENSHAKE", function(argument0)
{
    ini_open("saveData.ini");
    ini_write_real("Option", "screenshake", argument0);
    ini_close();
    global.option_screenshake = argument0;
}).value = global.option_screenshake;
add_option_toggle(game_menu, 2, "SEPTEMBER MOVESET", function(argument0)
{
    ini_open("saveData.ini");
    ini_write_real("Option", "september_moveset", argument0);
    ini_close();
    global.option_septmoveset = argument0;
}).value = global.option_septmoveset;
array_push(menus, game_menu);
controls_menu = create_menu_fixed(UnknownEnum.Value_7, UnknownEnum.Value_1, 150, 40);
add_option_press(controls_menu, 0, "BACK", function()
{
    menu_goto(UnknownEnum.Value_0);
});
add_option_press(controls_menu, 1, "KEYBOARD", function()
{
    menu_goto(UnknownEnum.Value_9);
});
add_option_press(controls_menu, 2, "CONTROLLER", function()
{
    menu_goto(UnknownEnum.Value_8);
});
add_option_press(controls_menu, 3, "RESET CONFIG", function()
{
    var j, q;
    
    ini_open("saveData.ini");
    ini_section_delete("ControlsKeys");
    ini_section_delete("ControlsKeys2");
    ini_section_delete("ControllerButton");
    ini_section_delete("ControllerButton2");
    ini_section_delete("ControlsConfig");
    scr_initinput();
    scr_initinput2();
    ini_close();
    
    with (obj_option)
    {
        for (i = 0; i < array_length(menus); i++)
        {
            b = menus[i];
            
            if (b.menu_id == UnknownEnum.Value_8 || b.menu_id == UnknownEnum.Value_10 || b.menu_id == UnknownEnum.Value_9)
            {
                for (j = 0; j < array_length(b.options); j++)
                {
                    q = b.options[j];
                    
                    if (q.name == "DEADZONE")
                        q.value = global.input_controller_deadzone * 100;
                    else if (q.name == "HORIZONTAL DEADZONE")
                        q.value = global.input_controller_deadzone_horizontal * 100;
                    else if (q.name == "VERTICAL DEADZONE")
                        q.value = global.input_controller_deadzone_vertical * 100;
                    else if (q.name == "PRESS DEADZONE")
                        q.value = global.input_controller_deadzone_press * 100;
                    else if (q.name == "SUPERJUMP WALK DEADZONE")
                        q.value = global.gamepad_deadzone_superjump * 100;
                    else if (q.name == "CROUCH WALK DEADZONE")
                        q.value = global.gamepad_deadzone_crouch * 100;
                    else if (q.name == "DIRECTIONAL SUPERJUMP")
                        q.value = global.gamepad_superjump;
                    else if (q.name == "DIRECTIONAL GROUNDPOUND")
                        q.value = global.gamepad_groundpound;
                    else if (q.name == "UP KEY SUPERJUMP")
                        q.value = global.keyboard_superjump;
                    else if (q.name == "DOWN KEY GROUNDPOUND")
                        q.value = global.keyboard_groundpound;
                }
            }
        }
    }
});
array_push(menus, controls_menu);
keyboard_menu = create_menu_fixed(UnknownEnum.Value_9, UnknownEnum.Value_1, 150, 40, UnknownEnum.Value_7);
add_option_press(keyboard_menu, 0, "BACK", function()
{
    menu_goto(UnknownEnum.Value_7);
});
add_option_press(keyboard_menu, 1, "KEY BINDINGS", function()
{
    obj_option.key_jump = false;
    instance_create_unique(0, 0, obj_keyconfig);
});
add_option_toggle(keyboard_menu, 2, "UP KEY SUPERJUMP", function(argument0)
{
    global.keyboard_superjump = argument0;
    set_controller_config();
}).value = global.keyboard_superjump;
add_option_toggle(keyboard_menu, 3, "DOWN KEY GROUNDPOUND", function(argument0)
{
    global.keyboard_groundpound = argument0;
    set_controller_config();
}).value = global.keyboard_groundpound;
array_push(menus, keyboard_menu);
controller_menu = create_menu_fixed(UnknownEnum.Value_8, UnknownEnum.Value_1, 150, 40, UnknownEnum.Value_7);
add_option_press(controller_menu, 0, "BACK", function()
{
    menu_goto(UnknownEnum.Value_7);
});
add_option_press(controller_menu, 1, "BUTTON BINDINGS", function(argument0)
{
    obj_option.key_jump = false;
    
    with (instance_create_unique(0, 0, 277))
        controller = true;
});
add_option_press(controller_menu, 2, "DEADZONES", function(argument0)
{
    menu_goto(UnknownEnum.Value_10);
});
add_option_toggle(controller_menu, 3, "DIRECTIONAL SUPERJUMP", function(argument0)
{
    global.gamepad_superjump = argument0;
    set_controller_config();
}).value = global.gamepad_superjump;
add_option_toggle(controller_menu, 4, "DIRECTIONAL GROUNDPOUND", function(argument0)
{
    global.gamepad_groundpound = argument0;
    set_controller_config();
}).value = global.gamepad_groundpound;
array_push(menus, controller_menu);
back = UnknownEnum.Value_8;
deadzones_menu = create_menu_fixed(UnknownEnum.Value_10, UnknownEnum.Value_1, 150, 40, back);
add_option_press(deadzones_menu, 0, "BACK", function()
{
    menu_goto(UnknownEnum.Value_8);
});
add_option_slide(deadzones_menu, 1, "DEADZONE", function(argument0)
{
    if (argument0 > 90)
        argument0 = 90;
    
    global.input_controller_deadzone = argument0 / 100;
    trace(argument0 / 100);
    set_controller_config();
}).value = global.input_controller_deadzone * 100;
add_option_slide(deadzones_menu, 2, "HORIZONTAL DEADZONE", function(argument0)
{
    if (argument0 > 90)
        argument0 = 90;
    
    global.input_controller_deadzone_horizontal = argument0 / 100;
    trace(argument0 / 100);
    set_controller_config();
}).value = global.input_controller_deadzone_horizontal * 100;
add_option_slide(deadzones_menu, 3, "VERTICAL DEADZONE", function(argument0)
{
    if (argument0 > 90)
        argument0 = 90;
    
    global.input_controller_deadzone_vertical = argument0 / 100;
    trace(argument0 / 100);
    set_controller_config();
}).value = global.input_controller_deadzone_vertical * 100;
add_option_slide(deadzones_menu, 4, "PRESS DEADZONE", function(argument0)
{
    if (argument0 > 90)
        argument0 = 90;
    
    global.input_controller_deadzone_press = argument0 / 100;
    trace(argument0 / 100);
    set_controller_config();
}).value = global.input_controller_deadzone_press * 100;
add_option_slide(deadzones_menu, 5, "SUPERJUMP WALK DEADZONE", function(argument0)
{
    global.gamepad_deadzone_superjump = argument0 / 100;
    set_controller_config();
    trace(argument0 / 100);
}).value = global.gamepad_deadzone_superjump * 100;
add_option_slide(deadzones_menu, 5, "CROUCH WALK DEADZONE", function(argument0)
{
    global.gamepad_deadzone_crouch = argument0 / 100;
    set_controller_config();
    trace(argument0 / 100);
}).value = global.gamepad_deadzone_crouch * 100;
array_push(menus, deadzones_menu);
