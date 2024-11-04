function scr_destroy_tiles(argument0, argument1, argument2 = 0)
{
    var lay_id, map_id, w, h, ix, iy, yy, xx;
    
    lay_id = layer_get_id(argument1);
    
    if (lay_id != -1)
    {
        map_id = layer_tilemap_get_id(lay_id);
        w = abs(sprite_width) / argument0;
        h = abs(sprite_height) / argument0;
        ix = sign(image_xscale);
        iy = sign(image_yscale);
        
        if (ix < 0)
            w++;
        
        yy = 0 - argument2;
        
        while (yy < (h + argument2))
        {
            xx = 0 - argument2;
            
            while (xx < (w + argument2))
            {
                scr_destroy_tile(x + (xx * argument0 * ix), y + (yy * argument0 * iy), map_id);
                xx++;
            }
            
            yy++;
        }
    }
}

function scr_destroy_tile_arr(argument0, argument1, argument2 = 0)
{
    var i;
    
    for (i = 0; i < array_length(argument1); i++)
        scr_destroy_tiles(argument0, argument1[i], argument2);
}

function scr_destroy_tile(argument0, argument1, argument2)
{
    var data;
    
    data = tilemap_get_at_pixel(argument2, argument0, argument1);
    data = tile_set_empty(data);
    tilemap_set_at_pixel(argument2, data, argument0, argument1);
}

function scr_solid_line(argument0)
{
    if (collision_line(x, y, argument0.x, argument0.y, obj_solid, false, true) != -4)
        return true;
    
    if (collision_line(x, y, argument0.x, argument0.y, obj_slope, false, true) != -4)
        return true;
    
    return false;
}

function scr_destroy_nearby_tiles()
{
    instance_destroy(instance_place(x + 1, y, obj_tiledestroy));
    instance_destroy(instance_place(x - 1, y, obj_tiledestroy));
    instance_destroy(instance_place(x, y + 1, obj_tiledestroy));
    instance_destroy(instance_place(x, y - 1, obj_tiledestroy));
}

function scr_cutoff()
{
    var dirs, list, i, d, num, j, b, a, da;
    
    with (instance_place(x, y, obj_cutoff))
        instance_destroy();
    
    dirs = [[-1, 0], [1, 0], [0, -1], [0, 1]];
    list = ds_list_create();
    
    for (i = 0; i < array_length(dirs); i++)
    {
        d = dirs[i];
        
        if (!place_meeting(x + d[0], y + d[1], obj_cutoff))
            continue;
        
        num = instance_place_list(x + d[0], y + d[1], 830, list, false);
        
        for (j = 0; j < ds_list_size(list); j++)
        {
            b = ds_list_find_value(list, j);
            
            if (!is_undefined(b) && instance_exists(b))
            {
                with (b)
                {
                    if (!place_meeting(x, y, obj_solid))
                    {
                        instance_destroy();
                    }
                    else if (other.object_index == obj_tiledestroy || ((object_index != obj_cutoffsmall || other.object_index == obj_secretblock) && (object_index != obj_cutoff || (other.object_index == obj_secretbigblock || other.object_index == obj_secretmetalblock))))
                    {
                        a = scr_cutoff_get_angle(b);
                        da = a;
                        
                        if (d[0] < 0)
                            da = 0;
                        else if (d[0] > 0)
                            da = 180;
                        else if (d[1] < 0)
                            da = 270;
                        else if (d[1] > 0)
                            da = 90;
                        
                        if (a == da)
                            visible = true;
                    }
                }
            }
        }
        
        ds_list_clear(list);
    }
    
    ds_list_clear(list);
    ds_list_destroy(list);
}

function scr_cutoff_get_angle(argument0)
{
    var a, d;
    
    a = argument0.image_angle + 90;
    d = point_direction(0, 0, lengthdir_x(1, a) * argument0.image_yscale, lengthdir_y(1, a) * argument0.image_yscale);
    return d;
}
