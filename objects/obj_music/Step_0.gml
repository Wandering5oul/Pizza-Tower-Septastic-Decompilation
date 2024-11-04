var _state, p;

with (obj_player1)
{
    if (global.option_music_speed)
    {
        _state = state;
        
        if (state == UnknownEnum.Value_84 || state == UnknownEnum.Value_137 || state == UnknownEnum.Value_61)
            _state = tauntstoredstate;
        
        switch (_state)
        {
            case UnknownEnum.Value_47:
                audio_sound_pitch(obj_music.music, 0.9);
                break;
            
            case UnknownEnum.Value_38:
                audio_sound_pitch(obj_music.music, 1.2);
                break;
            
            case UnknownEnum.Value_5:
                audio_sound_pitch(obj_music.music, 1.2);
                break;
            
            default:
                audio_sound_pitch(obj_music.music, 1);
        }
    }
    else
    {
        audio_sound_pitch(obj_music.music, 1);
    }
}

prevpillar_on_camera = pillar_on_camera;

if (instance_exists(obj_hungrypillar))
{
    p = false;
    
    with (obj_hungrypillar)
    {
        if (bbox_in_camera(view_camera[0], 0))
            p = true;
    }
    
    if (p != pillar_on_camera)
        pillar_on_camera = p;
}
else
{
    pillar_on_camera = false;
}

if (prevpillar_on_camera != pillar_on_camera)
{
    if (pillar_on_camera)
    {
        audio_sound_gain(pillarmusicID, 0.6 * global.option_music_volume, 2000);
        audio_sound_gain(musicID, 0, 2000);
    }
    else
    {
        audio_sound_gain(pillarmusicID, 0, 2000);
        audio_sound_gain(musicID, 0.6 * global.option_music_volume, 2000);
    }
}

if (global.panic)
{
    if (music != 133 && music != 158 && music != 138 && music != 16)
    {
        music = 133;
        
        if (!obj_player1.ispeppino)
            music = 158;
        
        audio_stop_sound(musicID);
        musicID = scr_music(music);
        
        if (pillarmusicID != -4)
            audio_stop_sound(pillarmusicID);
        
        pillarmusicID = -4;
    }
    else if (music == 133)
    {
        if (instance_exists(obj_geromefollow) && !audio_is_playing(mu_chasestart))
        {
            music = 138;
            audio_stop_sound(musicID);
            musicID = scr_music(music);
        }
    }
    else if (music == 158 && !audio_is_playing(mu_chaseNstart))
    {
        if (instance_exists(obj_geromefollow))
        {
            music = 16;
            audio_stop_sound(musicID);
            musicID = scr_music(music);
        }
    }
}
