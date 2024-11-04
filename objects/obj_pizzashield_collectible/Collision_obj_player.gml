if (other.state != UnknownEnum.Value_186)
{
    if (audio_is_playing(sfx_collecttopping))
        audio_stop_sound(sfx_collecttopping);
    
    scr_soundeffect(45);
    
    with (other)
        pizzashield = 1;
    
    instance_destroy();
}
