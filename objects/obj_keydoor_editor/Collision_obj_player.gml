if (room == rm_editor)
    exit;

if (index == -1)
    exit;

if (!place_meeting(x, y, obj_doorblocked))
{
    with (other)
    {
        if (key_up && other.sprite_index == spr_doorvisited && grounded && (state == UnknownEnum.Value_0 || state == UnknownEnum.Value_103 || state == UnknownEnum.Value_104 || state == UnknownEnum.Value_58 || state == UnknownEnum.Value_121 || state == UnknownEnum.Value_99) && y == (other.y + 50) && !instance_exists(obj_noisesatellite) && !instance_exists(obj_fadeout) && state != UnknownEnum.Value_112 && state != UnknownEnum.Value_95 && ((obj_player1.spotlight == 1 && object_index == obj_player1) || (obj_player1.spotlight == 0 && object_index == obj_player2)))
        {
            index = other.index;
            scr_soundeffect(103);
            obj_camera.chargecamera = 0;
            
            if (object_index == obj_player1)
                obj_player1.sprite_index = obj_player1.spr_lookdoor;
            
            if (object_index == obj_player2)
                obj_player2.sprite_index = obj_player2.spr_lookdoor;
            
            obj_player.image_index = 0;
            obj_player.state = UnknownEnum.Value_112;
            obj_player.mach2 = 0;
            
            if (instance_exists(obj_player2) && global.coop == 1)
            {
                if (object_index == obj_player2)
                {
                    obj_player1.x = obj_player2.x;
                    obj_player1.y = obj_player2.y;
                }
                
                if (object_index == obj_player1)
                {
                    obj_player2.x = obj_player1.x;
                    obj_player2.y = obj_player1.y;
                }
            }
            
            other.visited = 1;
            
            with (instance_create(x, y, obj_fadeout))
            {
                _id = other.id;
                index = other.index;
                custom_level = 1;
            }
        }
    }
}
