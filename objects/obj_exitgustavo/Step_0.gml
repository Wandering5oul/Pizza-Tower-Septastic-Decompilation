var dx, dy;

image_speed = 0.35;
depth = 20;

switch (state)
{
    case UnknownEnum.Value_18:
        x = camera_get_view_x(view_camera[0]) - 100;
        y = camera_get_view_y(view_camera[0]) - 100;
        dx = 350;
        dy = 400;
        
        if (room == space_11b)
        {
            dx = 200;
            dy = 220;
        }
        
        if (global.panic && distance_to_pos(xstart, ystart, obj_player1.x, obj_player1.y, dx, dy))
        {
            state = UnknownEnum.Value_108;
            vsp = 20;
            x = xstart;
            y = camera_get_view_y(view_camera[0]) - 100;
            y += vsp;
            
            if (vsp < 20)
                vsp += 0.5;
            
            with (instance_place(x, y, obj_baddiecollisionbox))
            {
                instance_destroy(baddieID);
                instance_destroy();
            }
            
            if (y >= ystart)
            {
                y = ystart;
                instance_destroy(instance_place(x, y, obj_ramp));
                state = UnknownEnum.Value_0;
                
                if (sprite_index != spr_noiseyexit_fall && sprite_index != spr_noisette_fall)
                {
                    sprite_index = spr_gustavo_exitsign;
                    
                    if (stick)
                        sprite_index = spr_stick_exit;
                }
                else if (sprite_index == spr_noiseyexit_fall)
                {
                    sprite_index = spr_noiseyexit_idle;
                }
                else
                {
                    sprite_index = spr_noisette_exit;
                }
                
                image_index = 0;
            }
            
            break;
            
            if (floor(image_index) == (image_number - 1))
            {
                sprite_index = spr_gustavo_exitsign;
                
                if (stick)
                    sprite_index = spr_stick_exit;
                
                state = UnknownEnum.Value_0;
            }
            
            break;
        }
        
        if (state == UnknownEnum.Value_18)
        {
            visible = false;
            break;
        }
        
        visible = true;
}
