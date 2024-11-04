if (ds_list_find_index(global.saveroom, id) == -1)
{
    instance_create(x + 16, y, obj_debris);
    instance_create(x + 16, y, obj_debris);
    instance_create(x + 16, y, obj_debris);
    instance_create(x + 16, y, obj_debris);
    
    if (audio_is_playing(sfx_breakblock1) || audio_is_playing(sfx_breakblock2))
    {
        audio_stop_sound(sfx_breakblock1);
        audio_stop_sound(sfx_breakblock2);
    }
    
    scr_soundeffect(43, 44);
    ds_list_add(global.saveroom, id);
}

scr_cutoff();
scr_destroy_tiles(32, "Tiles_1");
scr_destroy_tiles(32, "Tiles_2");
scr_destroy_tiles(32, "Tiles_3");
scr_destroy_tiles(32, "Tiles_4");
scr_destroy_tiles(32, "Tiles_Foreground1");
scr_destroy_tiles(32, "Tiles_Foreground2");
scr_destroy_nearby_tiles();
