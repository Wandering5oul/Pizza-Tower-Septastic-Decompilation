function checkpeppino(argument0 = 245)
{
    if (!instance_exists(argument0))
        return false;
    else
        return argument0.ispeppino;
}

function scr_slope_angle()
{
    var _smooth;
    
    static _angle = 0;
    
    if (global.option_anglerotation == 0)
    {
        angle = 0;
    }
    else
    {
        _smooth = global.option_anglerotation == 2;
        
        if (!scr_slope() || state == UnknownEnum.Value_38 || place_meeting(x, y + 1, obj_solid))
        {
            _angle = 0;
        }
        else if (!place_meeting(x, y + 1, obj_solid))
        {
            with (instance_place(x, y + 1, obj_slope))
            {
                if (abs(image_yscale) < abs(image_xscale))
                {
                    if (sign(image_xscale) == 1)
                        _angle = 15;
                    else
                        _angle = -15;
                }
                else if (sign(image_xscale) == 1)
                {
                    _angle = 30;
                }
                else
                {
                    _angle = -30;
                }
            }
        }
        
        if (_smooth)
            angle = lerp(angle, _angle, 0.5);
        else
            angle = _angle;
        
        if (angle != _angle)
            trace(angle, " ", _angle);
    }
}
