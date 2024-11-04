function scr_soundeffect()
{
    var snd, snd_id;
    
    snd = argument[irandom(argument_count - 1)];
    
    if (object_is_ancestor(object_index, obj_player) && !ispeppino)
    {
        switch (snd)
        {
            case 117:
                snd = sfx_breakN;
                break;
            
            case 114:
                snd = sfx_machslideboostN;
                break;
            
            case 40:
                snd = sfx_jumpN;
                break;
            
            case 60:
                snd = sfx_superjumpreleaseN;
                break;
        }
    }
    
    snd_id = audio_play_sound(snd, 1, false);
    audio_sound_gain(snd_id, audio_sound_get_gain(snd_id) * global.option_sfx_volume, 0);
}

function scr_soundeffect_multiple()
{
    var snd, snd_id;
    
    snd = argument[irandom(argument_count - 1)];
    
    if (audio_is_playing(snd))
        audio_stop_sound(snd);
    
    if (object_is_ancestor(object_index, obj_player) && !ispeppino)
    {
        switch (snd)
        {
            case 117:
                snd = sfx_breakN;
                break;
            
            case 114:
                snd = sfx_machslideboostN;
                break;
            
            case 40:
                snd = sfx_jumpN;
                break;
            
            case 60:
                snd = sfx_superjumpreleaseN;
                break;
        }
    }
    
    snd_id = audio_play_sound(snd, 1, false);
    audio_sound_gain(snd_id, audio_sound_get_gain(snd_id) * global.option_sfx_volume, 0);
}

function sfx_gain(argument0)
{
    audio_sound_gain(argument0, audio_sound_get_gain(argument0) * global.option_sfx_volume, 0);
}

function set_controller_config()
{
    ini_open("saveData.ini");
    ini_write_real("ControlsConfig", "deadzone", global.input_controller_deadzone);
    ini_write_real("ControlsConfig", "deadzone_vert", global.input_controller_deadzone_vertical);
    ini_write_real("ControlsConfig", "deadzone_horiz", global.input_controller_deadzone_horizontal);
    ini_write_real("ControlsConfig", "deadzonepress", global.input_controller_deadzone_press);
    ini_write_real("ControlsConfig", "deadzonesuperjump", global.gamepad_deadzone_superjump);
    ini_write_real("ControlsConfig", "deadzonecrouch", global.gamepad_deadzone_crouch);
    ini_write_real("ControlsConfig", "superjump", global.gamepad_superjump);
    ini_write_real("ControlsConfig", "groundpound", global.gamepad_groundpound);
    ini_write_real("ControlsConfig", "kb_superjump", global.keyboard_superjump);
    ini_write_real("ControlsConfig", "kb_groundpound", global.keyboard_groundpound);
    ini_close();
}
