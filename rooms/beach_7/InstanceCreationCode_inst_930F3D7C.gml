func = function(argument0)
{
    if (active == 0)
    {
        if (obj_secretmanager.waittime >= 500)
        {
            active = 1;
            ds_list_add(global.saveroom, id);
        }
        
        obj_secretmanager.waittime += 1;
    }
};

trigger = 1;
