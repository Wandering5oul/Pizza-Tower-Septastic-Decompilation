if (instance_exists(obj_pausefadeout))
    instance_destroy(obj_pausefadeout);

if (fadealpha > 1)
{
    fadein = 1;
    
    with (obj_titlecard)
    {
        obj_player1.visible = true;
        obj_camera.lock = oldlock;
    }
    
    if (instance_exists(obj_player))
    {
        if (custom_level == 0)
        {
            with (obj_player)
            {
                if (place_meeting(x, y, obj_goldendoor))
                    game_restart();
            }
            
            if (room != obj_player1.targetRoom || roomreset)
            {
                scr_room_goto(obj_player1.targetRoom);
                
                with (obj_player)
                {
                    if (state == UnknownEnum.Value_7 || state == UnknownEnum.Value_152)
                    {
                        visible = true;
                        state = UnknownEnum.Value_0;
                    }
                }
            }
            
            if (global.coop == 1)
            {
                if (room != obj_player2.targetRoom || roomreset)
                    scr_room_goto(obj_player1.targetRoom);
                
                with (obj_player)
                {
                    if (state == UnknownEnum.Value_7)
                        state = UnknownEnum.Value_0;
                }
                
                with (obj_player2)
                {
                    if (instance_exists(obj_coopplayerfollow))
                        state = UnknownEnum.Value_186;
                }
            }
        }
        else
        {
            with (obj_door_editor)
            {
                if (index == other.index && !place_meeting(x, y, obj_player))
                {
                    other.xx = x;
                    other.yy = y;
                    
                    if (object_index == obj_keydoor_editor)
                        alarm[0] = 1;
                }
            }
            
            with (obj_player)
            {
                x = other.xx + 50;
                y = other.yy + 50;
            }
        }
    }
}

if (fadein == 0)
    fadealpha += 0.1;
else if (fadein == 1)
    fadealpha -= 0.1;

if (instance_exists(obj_player))
{
    with (obj_player1)
    {
        if (other.fadein == 1 && (obj_player1.state == UnknownEnum.Value_112 || obj_player1.state == UnknownEnum.Value_98) && (sprite_index == spr_victory || place_meeting(x, y, obj_door) || place_meeting(x, y, obj_startgate) || place_meeting(x, y, obj_door_editor)))
        {
            state = UnknownEnum.Value_95;
            image_index = 0;
            
            if (global.coop == 1)
            {
                obj_player2.state = UnknownEnum.Value_95;
                obj_player2.image_index = 0;
            }
        }
        
        if (other.fadein == 1 && obj_player1.state == UnknownEnum.Value_112 && (obj_player1.sprite_index == spr_downpizzabox || obj_player1.sprite_index == spr_uppizzabox))
        {
            state = UnknownEnum.Value_101;
            
            if (global.coop == 1)
                obj_player2.state = UnknownEnum.Value_101;
        }
    }
    
    if (instance_exists(obj_player2))
    {
        with (obj_player2)
        {
            if (other.fadein == 1 && (obj_player2.state == UnknownEnum.Value_112 || obj_player2.state == UnknownEnum.Value_98) && (place_meeting(x, y, obj_door) || place_meeting(x, y, obj_startgate)))
            {
                state = UnknownEnum.Value_95;
                image_index = 0;
                
                if (global.coop == 1)
                {
                    obj_player1.state = UnknownEnum.Value_95;
                    obj_player1.image_index = 0;
                }
            }
            
            if (other.fadein == 1 && obj_player2.state == UnknownEnum.Value_112 && (obj_player2.sprite_index == spr_downpizzabox || obj_player2.sprite_index == spr_uppizzabox))
            {
                state = UnknownEnum.Value_101;
                
                if (global.coop == 1)
                    obj_player1.state = UnknownEnum.Value_101;
            }
        }
    }
    
    with (obj_player2)
    {
        if (instance_exists(obj_coopplayerfollow))
            state = UnknownEnum.Value_186;
    }
}

if (fadein == 1 && fadealpha < 0)
    instance_destroy();
