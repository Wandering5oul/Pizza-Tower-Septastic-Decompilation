if (room == custom_lvl_room)
    tile_layer_delete_at(1, x, y);

if (ds_list_find_index(global.saveroom, id) == -1)
{
    instance_create(x + 16, y, obj_debris);
    instance_create(x + 16, y, obj_debris);
    instance_create(x + 16, y, obj_debris);
    instance_create(x + 16, y, obj_debris);
    scr_sleep(5);
    tile_layer_delete_at(1, x, y);
    
    if (audio_is_playing(sfx_breakblock1) || audio_is_playing(sfx_breakblock2) || audio_is_playing(sfx_breakblock3))
    {
        audio_stop_sound(sfx_breakblock1);
        audio_stop_sound(sfx_breakblock2);
        audio_stop_sound(sfx_breakblock3);
    }
    
    scr_soundeffect(43, 44, 0);
    ds_list_add(global.saveroom, id);
}
