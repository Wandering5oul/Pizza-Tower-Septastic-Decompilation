stepfunc = function(argument0)
{
    if (active == 0 && place_meeting(x, y, obj_pizzaboy))
    {
        active = 1;
        ds_list_add(global.saveroom, id);
    }
};

trigger = 2;
