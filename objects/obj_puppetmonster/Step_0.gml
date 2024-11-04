var pid, dir;

image_speed = 0.35;

switch (state)
{
    case 215:
        sprite_index = spr_monstertomato_idle;
        x = camera_get_view_x(view_camera[0]) + 480;
        y = camera_get_view_y(view_camera[0]) + ys;
        
        switch (substate)
        {
            case 135:
                ys += 2;
                
                if (ys > 440)
                {
                    pid = scr_puppet_detect();
                    trace(pid);
                    
                    if (pid != -4)
                    {
                        playerid = pid;
                        substate = 141;
                    }
                    else
                    {
                        substate = UnknownEnum.Value_92;
                    }
                }
                
                break;
            
            case UnknownEnum.Value_92:
                ys -= 3;
                
                if (ys < -100)
                {
                    destroy = 0;
                    
                    with (obj_monstertrackingrooms)
                    {
                        sound_buffer = sfx_jump;
                        monster_pos[other.monsterid].x = last_puppet_pos.x;
                        monster_pos[other.monsterid].y = last_puppet_pos.y;
                    }
                    
                    instance_destroy();
                }
                
                break;
            
            case 141:
                ys -= 10;
                
                if (ys < -100)
                    scr_puppet_appear(playerid);
                
                break;
        }
        
        break;
    
    case 216:
        switch (substate)
        {
            case 135:
                sprite_index = spr_monstertomato_chase;
                
                if (grounded && vsp > 0)
                    substate = 141;
                
                scr_collide();
                break;
            
            case 141:
                sprite_index = spr_monstertomato_chase;
                dir = point_direction(x, y, playerid.x, playerid.y);
                x += lengthdir_x(6, dir);
                y += lengthdir_y(6, dir);
                
                if (x != playerid.x)
                    image_xscale = sign(playerid.x - x);
                
                break;
        }
        
        break;
}

depth = (state == 215) ? 100 : -6;
