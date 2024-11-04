function Vector2(argument0, argument1) constructor
{
    x = argument0;
    y = argument1;
}

function cycle(argument0, argument1, argument2)
{
    var delta, result;
    
    delta = argument2 - argument1;
    result = (argument0 - argument1) % delta;
    
    if (result < 0)
        result += delta;
    
    return result + argument1;
}

function angle_rotate(argument0, argument1, argument2)
{
    var diff;
    
    diff = cycle(argument1 - argument0, -180, 180);
    
    if (diff < -argument2)
        return argument0 - argument2;
    
    if (diff > argument2)
        return argument0 + argument2;
    
    return argument1;
}

function get_velocity(argument0, argument1)
{
    return argument0 / argument1;
}

function Wave(argument0, argument1, argument2, argument3, argument4 = -4)
{
    var a4, t;
    
    a4 = (argument1 - argument0) * 0.5;
    t = current_time;
    
    if (argument4 != -4)
        t = argument4;
    
    return argument0 + a4 + (sin((((t * 0.001) + (argument2 * argument3)) / argument2) * (2 * pi)) * a4);
}

function distance_to_pos(argument0, argument1, argument2, argument3, argument4, argument5)
{
    return abs(argument0 - argument2) <= argument4 && abs(argument1 - argument3) <= argument5;
}

function distance_between_points(argument0, argument1, argument2, argument3)
{
    return sqrt(sqr(argument2 - argument0) + sqr(argument3 - argument1));
}

function wrap(argument0, argument1, argument2)
{
    var _old;
    
    if ((argument0 % 1) == 0)
    {
        while (argument0 > argument2 || argument0 < argument1)
        {
            if (argument0 > argument2)
                argument0 = (argument1 + argument0) - argument2 - 1;
            else if (argument0 < argument1)
                argument0 = ((argument2 + argument0) - argument1) + 1;
        }
        
        return argument0;
    }
    else
    {
        _old = argument0 + 1;
        
        while (argument0 != _old)
        {
            _old = argument0;
            
            if (argument0 < argument1)
                argument0 = argument2 - (argument1 - argument0);
            else if (argument0 > argument2)
                argument0 = argument1 + (argument0 - argument2);
        }
        
        return argument0;
    }
}

function lerp_offset(argument0, argument1, argument2, argument3 = 1)
{
    var diff, diff_sign;
    
    diff = argument1 - argument0;
    diff_sign = sign(diff);
    
    if (diff_sign == 0)
        return argument1;
    
    diff *= diff_sign;
    return argument0 + (diff_sign * min((diff + argument3) * argument2, diff));
}
