if (ds_list_find_index(global.saveroom, id) == -1)
{
    repeat (8)
        create_debris(x + 32, y + 32, 1269);
    
    scr_sleep(5);
    instance_create(x + 32, y + 32, obj_bangeffect);
    tile_layer_delete_at(1, x, y);
    tile_layer_delete_at(1, x + 32, y);
    tile_layer_delete_at(1, x + 32, y + 32);
    tile_layer_delete_at(1, x, y + 32);
    
    with (obj_camera)
    {
        shake_mag = 20;
        shake_mag_acc = 40 / room_speed;
    }
    
    GamepadSetVibration(playerindex, 1, 1, 0.8);
    scr_soundeffect(111);
    ds_list_add(global.saveroom, id);
}

scr_cutoff();

if (is_string(targettiles))
    scr_destroy_tiles(32, targettiles);
else
    scr_destroy_tile_arr(32, targettiles);

scr_destroy_nearby_tiles();
