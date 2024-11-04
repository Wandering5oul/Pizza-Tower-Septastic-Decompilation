var val;

if (room == rm_editor)
    exit;

if (ds_list_find_index(global.saveroom, id) == -1 && global.snickchallenge == 0)
{
    repeat (6)
    {
        with (create_debris(x + 16, y, sprite_index))
        {
            if (sprite_index == spr_destroyable2)
                sprite_index = spr_debris;
            else
                sprite_index = spr_halloweendebris;
        }
    }
    
    with (instance_create(x + 16, y + 16, obj_parryeffect))
        sprite_index = spr_pizzablockdead;
    
    scr_sleep(5);
    create_baddiegibsticks(x + 16, y + 16);
    
    if (audio_is_playing(sfx_collecttopping))
        audio_stop_sound(sfx_collecttopping);
    
    scr_soundeffect(45);
    
    if (obj_player1.character == "V")
        global.playerhealth = clamp(global.playerhealth + 1, 0, 100);
    
    global.heattime += 10;
    global.heattime = clamp(global.heattime, 0, 60);
    global.combotime = clamp(global.combotime + 15, 0, 60);
    
    with (obj_camera)
        healthshaketime = 30;
    
    val = 10;
    global.collect += val;
    
    with (instance_create(x + 16, y, obj_smallnumber))
        number = string(val);
    
    tile_layer_delete_at(1, x, y);
    scr_soundeffect_multiple(43, 44, 0);
    ds_list_add(global.saveroom, id);
}
