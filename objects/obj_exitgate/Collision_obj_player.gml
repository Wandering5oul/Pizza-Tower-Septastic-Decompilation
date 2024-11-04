var roomname, namestring, i;

if (image_index == 1 && global.panic == 0)
{
    with (obj_player)
    {
        if (state == UnknownEnum.Value_95 && floor(image_index) == (image_number - 2))
        {
            scr_soundeffect(55);
            GamepadSetVibration(0, 1, 1, 0.9);
            GamepadSetVibration(1, 1, 1, 0.9);
            
            with (obj_player1)
            {
                lastroom = room;
                sprite_index = spr_Timesup;
                image_index = 0;
                
                with (obj_camera)
                {
                    shake_mag = 10;
                    shake_mag_acc = 30 / room_speed;
                }
            }
            
            if (global.coop == 1)
            {
                with (obj_player2)
                {
                    lastroom = room;
                    sprite_index = spr_Timesup;
                    image_index = 0;
                    
                    with (obj_camera)
                    {
                        shake_mag = 10;
                        shake_mag_acc = 30 / room_speed;
                    }
                }
            }
            
            other.image_index = 0;
            ds_list_add(global.saveroom, other.id);
        }
    }
}

with (obj_player)
{
    if (grounded && x > (other.x - 160) && x < (other.x + 160) && key_up && (state == UnknownEnum.Value_0 || state == UnknownEnum.Value_103 || state == UnknownEnum.Value_104 || state == UnknownEnum.Value_121) && (global.panic == 1 || global.snickchallenge == 1))
    {
        if (global.timeattack == 1)
            obj_timeattack.stop = 1;
        
        targetDoor = "none";
        obj_camera.alarm[2] = -1;
        roomname = room_get_name(room);
        namestring = string_letters(roomname);
        scr_savescore(namestring);
        
        if (global.combo > 0)
        {
            global.combotime = 0;
            global.combo = 0;
            obj_camera.alarm[4] = -1;
            
            for (i = 0; i < global.comboscore; i += 10)
                create_collect(obj_player1.x + irandom_range(-60, 60), (obj_player1.y - 100) + irandom_range(-60, 60), choose(1714, 1716, 1717, 1718, 1715), 10);
            
            global.comboscore = 0;
        }
        
        if (!instance_exists(obj_endlevelfade))
            instance_create(x, y, obj_endlevelfade);
        
        obj_player1.state = UnknownEnum.Value_112;
        obj_player1.sprite_index = obj_player1.spr_lookdoor;
        
        if (instance_exists(obj_player2))
        {
            obj_player2.state = UnknownEnum.Value_112;
            obj_player2.sprite_index = obj_player2.spr_lookdoor;
            
            if (global.coop)
                obj_player2.visible = true;
        }
        
        obj_endlevelfade.alarm[0] = 235;
        image_index = 0;
        global.panic = 0;
        global.snickchallenge = 0;
    }
}
