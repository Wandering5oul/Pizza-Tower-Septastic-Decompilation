function get_dark(argument0, argument1, argument2 = false, argument3 = 0, argument4 = 0)
{
    var d, b, bb, dis, t, a, r, g;
    
    if (argument1)
    {
        if (room == boss_vigilante)
            argument0 = make_color_rgb(247, 109, 22);
        
        d = room_width * room_height;
        b = d;
        bb = b;
        
        with (obj_lightsource)
        {
            if (object_index != obj_lightsource_attach || instance_exists(objectID))
            {
                if (!argument2)
                    dis = distance_to_object(other);
                else
                    dis = distance_between_points(x, y, argument3, argument4);
                
                if (dis < d)
                {
                    bb = dis / distance;
                    
                    if (bb < b)
                    {
                        b = bb;
                        d = dis;
                    }
                }
            }
        }
        
        t = (b + 0.4) * 255;
        a = (1 - obj_drawcontroller.dark_alpha) * 255;
        a -= 102;
        t = clamp(t, 0, 255);
        a = clamp(a, 0, 255);
        r = (color_get_red(argument0) - t) + a;
        g = (color_get_green(argument0) - t) + a;
        b = (color_get_blue(argument0) - t) + a;
        
        if (r < 0)
            r = 0;
        
        if (g < 0)
            g = 0;
        
        if (b < 0)
            b = 0;
        
        return make_color_rgb(r, g, b);
    }
    else
    {
        return image_blend;
    }
}
