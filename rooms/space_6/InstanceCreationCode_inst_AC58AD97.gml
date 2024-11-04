func = function(argument0)
{
    if (active == 0 && argument0.state == UnknownEnum.Value_97 && argument0.vsp == 20)
    {
        active = 1;
        ds_list_add(global.saveroom, id);
    }
};

trigger = 1;
