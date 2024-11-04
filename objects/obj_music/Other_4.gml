var i, track, prevmusic, prevmuID;

if (!global.panic)
{
    for (i = 0; i < ds_list_size(music_list); i++)
    {
        track = ds_list_find_value(music_list, i);
        
        if (room == track.musicroom)
        {
            prevmusic = music;
            
            if (track.musicroom == 23)
            {
                if (!obj_player1.ispeppino)
                {
                    track.music = 162;
                    track.musicsecret = 195;
                }
                else
                {
                    track.music = 139;
                    track.musicsecret = 195;
                }
            }
            
            music = track.music;
            secretmusic = track.musicsecret;
            
            if (music != prevmusic)
            {
                prevmuID = musicID;
                musicID = scr_music(music);
                
                if (room == dungeon_1)
                    audio_pause_sound(musicID);
                
                if (!track.reset)
                    audio_sound_set_track_position(musicID, audio_sound_get_track_position(prevmuID));
                
                audio_stop_sound(prevmuID);
            }
            
            audio_stop_sound(secretmusicID);
            audio_stop_sound(pillarmusicID);
            secretmusicID = -4;
        }
    }
    
    if (instance_exists(obj_hungrypillar))
    {
        pillarmusicID = scr_music(157);
        audio_sound_gain(pillarmusicID, 0, 0);
    }
}

if (secret)
{
    secretmusicID = scr_music(secretmusic);
    audio_sound_set_track_position(secretmusicID, audio_sound_get_track_position(musicID));
    audio_pause_sound(musicID);
}
else if (secretend)
{
    secretend = false;
    audio_resume_sound(musicID);
    audio_stop_sound(secretmusicID);
}

if (instance_exists(obj_treasure))
{
    global.panic = false;
    audio_stop_sound(musicID);
    audio_stop_sound(secretmusicID);
    musicID = scr_music(189);
}

if (room == rank_room)
{
    audio_stop_sound(musicID);
    audio_stop_sound(secretmusicID);
    audio_stop_sound(pillarmusicID);
    musicID = -4;
    secretmusicID = -4;
    pillarmusicID = -4;
}
