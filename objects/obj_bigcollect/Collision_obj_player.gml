if (other.state != UnknownEnum.Value_186)
{
    if (obj_player1.character == "V")
        global.playerhealth = clamp(global.playerhealth + 10, 0, 100);
    
    global.heattime = 60;
    
    with (obj_camera)
        healthshaketime = 60;
    
    if (object_index == obj_bigescapecollect)
        scr_soundeffect(187);
    else
        scr_soundeffect(72);
    
    instance_destroy();
    
    if (other.object_index == obj_player1)
        global.collect += 100;
    else
        global.collectN += 100;
    
    create_collect(x, y, sprite_index, 100);
    
    with (instance_create(x + 16, y, obj_smallnumber))
        number = string(100);
    
    global.combotime = 60;
    tv_add_expression(spr_tv_exprcollect, 150, 105);
}
