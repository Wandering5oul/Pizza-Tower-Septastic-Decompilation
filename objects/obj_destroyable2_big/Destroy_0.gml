var val;

if (room == rm_editor)
    exit;

if (ds_list_find_index(global.saveroom, id) == -1 && global.snickchallenge == 0)
{
    scr_sleep(5);
    
    with (instance_create(x + 32, y + 32, obj_parryeffect))
        sprite_index = spr_bigpizzablockdead;
    
    if (content == 449)
    {
        global.heattime += 10;
        global.heattime = clamp(global.heattime, 0, 60);
        global.combotime += 50;
        global.combotime = clamp(global.combotime, 0, 60);
        val = 100;
        global.collect += val;
        
        with (instance_create(x + 16, y, obj_smallnumber))
            number = string(val);
    }
    else
    {
        instance_create(x + 32, y, content);
    }
    
    repeat (3)
        create_baddiegibsticks(x + 32, y + 32);
    
    tile_layer_delete_at(1, x, y);
    tile_layer_delete_at(1, x + 32, y);
    tile_layer_delete_at(1, x + 32, y + 32);
    tile_layer_delete_at(1, x, y + 32);
    scr_soundeffect_multiple(43, 44, 0);
    ds_list_add(global.saveroom, id);
}
