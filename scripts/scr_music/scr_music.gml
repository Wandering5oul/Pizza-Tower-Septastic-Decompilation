function add_music(argument0, argument1, argument2, argument3 = true)
{
    var q;
    
    q = 
    {
        musicroom: argument0,
        music: argument1,
        musicsecret: argument2,
        reset: argument3
    };
    ds_list_add(music_list, q);
    return q;
}

function scr_music(argument0)
{
    var m;
    
    m = audio_play_sound(argument0, 10, true);
    audio_sound_gain(m, audio_sound_get_gain(argument0) * 0.8 * global.option_music_volume, 0);
    return m;
}
