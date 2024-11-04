if (room == rm_editor)
    exit;

if (other.state != UnknownEnum.Value_186)
{
    if (object_index == obj_escapecollect)
        scr_soundeffect_multiple(224);
    else
        scr_soundeffect_multiple(45);
    
    if (obj_player1.character == "V")
        global.playerhealth = clamp(global.playerhealth + 1, 0, 100);
    
    global.heattime += 10;
    global.heattime = clamp(global.heattime, 0, 60);
    global.combotime = clamp(global.combotime + 15, 0, 60);
    
    with (obj_camera)
        healthshaketime = 30;
    
    if (other.object_index == obj_player1)
        global.collect += 10;
    else
        global.collectN += 10;
    
    create_collect(x, y, sprite_index, 10);
    
    with (instance_create(x + 16, y, obj_smallnumber))
        number = string(10);
    
    instance_destroy();
}
