image_speed = 0.35;

switch (sprite_index)
{
    case spr_secretportal_spawnopen:
        with (obj_heatafterimage)
            visible = false;
        
        with (obj_player)
        {
            if (object_index != obj_player2 || global.coop)
            {
                x = other.x;
                y = other.y;
                roomstartx = x;
                roomstarty = y;
                hsp = 0;
                vsp = 0;
                cutscene = 1;
                visible = false;
                
                if (!isgustavo && state != UnknownEnum.Value_47 && state != UnknownEnum.Value_38 && state != UnknownEnum.Value_49)
                    state = UnknownEnum.Value_0;
            }
        }
        
        global.combofreeze = 15;
        waitbuffer = 80;
        drop = 0;
        
        if (floor(image_index) == (image_number - 1))
        {
            sprite_index = spr_secretportal_spawnidle;
            
            with (obj_player)
            {
                if (object_index != obj_player2 || global.coop)
                {
                    if (!isgustavo && state != UnknownEnum.Value_47 && state != UnknownEnum.Value_38 && state != UnknownEnum.Value_49)
                    {
                        visible = true;
                        cutscene = false;
                        sprite_index = spr_bodyslamstart;
                        image_index = 0;
                        state = UnknownEnum.Value_122;
                        vsp = (character == "P") ? -5 : -7;
                    }
                    else if (isgustavo)
                    {
                        state = UnknownEnum.Value_191;
                    }
                    else
                    {
                        if (state == UnknownEnum.Value_47)
                            hsp = 0;
                        
                        sprite_index = tauntstoredsprite;
                    }
                }
            }
        }
        
        break;
    
    case spr_secretportal_spawnidle:
        if (!drop)
        {
            with (obj_heatafterimage)
                visible = false;
            
            with (obj_player)
            {
                if (check_player_coop())
                {
                    x = other.x;
                    y = other.y - 10;
                    visible = true;
                    hsp = 0;
                    movespeed = 0;
                    vsp = 10;
                    fallinganimation = 0;
                    other.drop = true;
                    
                    if (other.drop)
                    {
                        if (!isgustavo && (tauntstoredstate == UnknownEnum.Value_47 || tauntstoredstate == UnknownEnum.Value_38 || tauntstoredstate == UnknownEnum.Value_49 || tauntstoredstate == UnknownEnum.Value_10))
                        {
                            state = tauntstoredstate;
                            movespeed = tauntstoredmovespeed;
                            tauntstoredhsp = 0;
                            hsp = tauntstoredhsp;
                            sprite_index = tauntstoredsprite;
                            
                            if (state == UnknownEnum.Value_47)
                            {
                                hsp = 0;
                                movespeed = 0;
                            }
                            else if (state == UnknownEnum.Value_38)
                            {
                                movespeed = 0;
                                hsp = 0;
                                state = UnknownEnum.Value_47;
                                sprite_index = spr_knightpepfall;
                            }
                            else if (state == UnknownEnum.Value_10)
                            {
                                if (sprite_index == spr_player_firemouthdash)
                                {
                                    hsp = 0;
                                    movespeed = 0;
                                    sprite_index = spr_player_firemouthidle;
                                }
                            }
                        }
                    }
                }
            }
        }
        
        if (drop)
        {
            if (waitbuffer > 0)
            {
                waitbuffer--;
            }
            else
            {
                sprite_index = spr_secretportal_spawnclose;
                image_index = 0;
            }
        }
        
        break;
    
    case spr_secretportal_spawnclose:
        if (floor(image_index) == (image_number - 1))
        {
            image_index = image_number - 1;
            instance_destroy();
        }
        
        break;
}
