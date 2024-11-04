stepfunc = function(argument0)
{
    if (active == 0 && place_meeting(x, y, obj_hamburger))
    {
        active = 1;
        ds_list_add(global.saveroom, id);
    }
};

trigger = 1;
