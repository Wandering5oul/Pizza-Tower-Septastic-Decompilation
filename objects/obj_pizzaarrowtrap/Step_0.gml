var i, t, h, n, range;

if (!shot)
{
    i = 0;
    t = 4;
    h = sprite_height;
    n = h / t;
    range = 500;
    i = 0;
    
    while (i < t)
    {
        if (collision_line(x, y + (i * n), x + (image_xscale * range), y + (i * n), obj_player, false, true) != -4)
        {
            shot = 1;
            break;
        }
        else
        {
            i++;
            continue;
        }
    }
    
    if (shot)
    {
        cooldown = 100;
        
        with (instance_create(x + (image_xscale * 32), y + 32, obj_pizzaarrow))
            image_xscale = other.image_xscale;
    }
}
else if (cooldown > 0)
{
    cooldown--;
}
else
{
    shot = 0;
}
