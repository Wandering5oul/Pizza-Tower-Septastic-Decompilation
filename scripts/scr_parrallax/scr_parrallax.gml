function calculate_parrallax_still_x(argument0, argument1)
{
    var _cam_x, lay, w, per_x, si, sw, r;
    
    _cam_x = camera_get_view_x(view_camera[0]);
    lay = layer_get_id(argument0);
    w = room_width - 960;
    
    if (room_width <= 960)
        per_x = 0;
    else
        per_x = _cam_x / w;
    
    si = layer_background_get_sprite(layer_background_get_id(lay));
    sw = sprite_get_width(si) - 960;
    r = sw * per_x * argument1;
    r = max(r, 0);
    return r;
}

function calculate_parrallax_still_y(argument0, argument1)
{
    var _cam_y, lay, h, per_y, si, sh, r;
    
    _cam_y = camera_get_view_y(view_camera[0]);
    lay = argument0;
    h = room_height - 540;
    
    if (room_height <= 540)
        per_y = 0;
    else
        per_y = _cam_y / h;
    
    si = layer_background_get_sprite(layer_background_get_id(lay));
    sh = sprite_get_height(si) - 540;
    r = sh * per_y * argument1;
    r = max(r, 0);
    return r;
}
