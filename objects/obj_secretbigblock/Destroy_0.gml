if (ds_list_find_index(global.saveroom, id) == -1)
{
    with (instance_create(x + 32, y + 32, obj_debris))
        sprite_index = spr_bigdebris;
    
    with (instance_create(x + 32, y + 32, obj_debris))
        sprite_index = spr_bigdebris;
    
    with (instance_create(x + 32, y + 32, obj_debris))
        sprite_index = spr_bigdebris;
    
    with (instance_create(x + 32, y + 32, obj_debris))
        sprite_index = spr_bigdebris;
    
    with (instance_create(x + 32, y + 32, obj_debris))
        sprite_index = spr_bigdebris;
    
    with (instance_create(x + 32, y + 32, obj_debris))
        sprite_index = spr_bigdebris;
    
    with (instance_create(x + 32, y + 32, obj_debris))
        sprite_index = spr_bigdebris;
    
    if (audio_is_playing(sfx_breakblock1) || audio_is_playing(sfx_breakblock2))
    {
        audio_stop_sound(sfx_breakblock1);
        audio_stop_sound(sfx_breakblock2);
    }
    
    scr_soundeffect(43, 44);
    ds_list_add(global.saveroom, id);
}

scr_cutoff();

if (is_string(targettiles))
    scr_destroy_tiles(32, targettiles);
else
    scr_destroy_tile_arr(32, targettiles);

scr_destroy_nearby_tiles();
