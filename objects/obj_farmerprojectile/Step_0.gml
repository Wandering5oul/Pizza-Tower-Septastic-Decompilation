var num, i, b, t;

x += hsp;
y += vsp;
num = collision_line_list(x, y, xprevious, yprevious, 307, false, true, global.instancelist, false);

if (num > 0)
{
    i = 0;
    
    while (i < num)
    {
        b = ds_list_find_value(global.instancelist, i);
        t = 0;
        
        with (b)
        {
            if (state == UnknownEnum.Value_0)
            {
                state = UnknownEnum.Value_8;
                
                if (b.func(other.id, other))
                {
                    t = 1;
                }
                else
                {
                    state = UnknownEnum.Value_0;
                    t = 0;
                }
            }
        }
        
        if (t)
        {
            instance_destroy();
            break;
        }
        else
        {
            i++;
            continue;
        }
    }
}

ds_list_clear(global.instancelist);
