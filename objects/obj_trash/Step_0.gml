image_speed = 0.35;

if (trashbuffer > 0)
    trashbuffer--;

switch (state)
{
    case UnknownEnum.Value_0:
        with (obj_player)
        {
            if (other.state == UnknownEnum.Value_0 && state != 208 && other.trashbuffer <= 0 && place_meeting(x, y, other))
            {
                state = 208;
                other.playerid = id;
                other.state = 208;
                other.sprite_index = spr_trash_flingstart;
                other.image_index = 0;
            }
        }
        
        break;
    
    case 208:
        playerid.x = x;
        playerid.y = y;
        
        if (floor(image_index) == (image_number - 1))
        {
            sprite_index = spr_trash;
            state = UnknownEnum.Value_0;
            trashbuffer = 30;
            
            with (playerid)
            {
                sprite_index = spr_superspringplayer;
                state = UnknownEnum.Value_209;
                vsp = -25;
            }
        }
        
        break;
}

scr_collide();
