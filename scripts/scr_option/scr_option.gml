function scr_loadoptions()
{
    var _os_r, resolutionX, resolutionY;
    
    ini_open("saveData.ini");
    global.option_fullscreen = ini_read_real("Option", "fullscreen", false);
    global.option_resolution = ini_read_real("Option", "resolution", 1);
    global.option_master_volume = ini_read_real("Option", "master_volume", 1);
    global.option_music_volume = ini_read_real("Option", "music_volume", 1);
    global.option_sfx_volume = ini_read_real("Option", "sfx_volume", 1);
    global.option_vibration = ini_read_real("Option", "vibration", true);
    global.option_scale_mode = ini_read_real("Option", "scale_mode", 0);
    global.option_hud = ini_read_real("Option", "hud", true);
    global.option_lang = ini_read_string("Option", "lang", "en");
    global.option_timer = ini_read_real("Option", "timer", false);
    global.option_timer_type = ini_read_real("Option", "timer_type", 0);
    global.option_speedrun_timer = ini_read_real("Option", "speedrun_timer", false);
    global.option_unfocus_mute = ini_read_real("Option", "unfocus_mute", false);
    global.option_texfilter = ini_read_real("Option", "texfilter", true);
    global.option_vsync = ini_read_real("Option", "vsync", false);
    global.option_screenshake = ini_read_real("Option", "screenshake", true);
    global.option_septmoveset = ini_read_real("Option", "september_moveset", false);
    global.option_anglerotation = ini_read_real("Option", "slope_angle", 2);
    global.option_music_speed = ini_read_real("Option", "music_speed", false);
    ini_close();
    window_set_fullscreen(global.option_fullscreen);
    _os_r = global.option_resolution;
    resolutionX = (_os_r == 0) ? 480 : ((_os_r == 1) ? 960 : 1920);
    resolutionY = (_os_r == 0) ? 270 : ((_os_r == 1) ? 540 : 1080);
    window_set_size(resolutionX, resolutionY);
    set_master_gain(global.option_master_volume);
}

function set_audio_config(argument0 = true)
{
    if (argument0)
    {
        ini_open("saveData.ini");
        ini_write_real("Option", "sfx_volume", global.option_sfx_volume);
        ini_write_real("Option", "master_volume", global.option_master_volume);
        ini_write_real("Option", "music_volume", global.option_music_volume);
        ini_close();
    }
}

function screen_apply_vsync()
{
    trace("Applying VSync: ", global.option_vsync);
    display_reset(0, global.option_vsync);
}

function screen_apply_size()
{
    var _os_r, resolutionX, resolutionY;
    
    window_set_fullscreen(global.option_fullscreen);
    _os_r = global.option_resolution;
    resolutionX = (_os_r == 0) ? 480 : ((_os_r == 1) ? 960 : 1920);
    resolutionY = (_os_r == 0) ? 270 : ((_os_r == 1) ? 540 : 1080);
    window_set_size(resolutionX, resolutionY);
}
