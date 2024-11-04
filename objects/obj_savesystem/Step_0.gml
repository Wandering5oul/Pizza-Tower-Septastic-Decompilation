var t;

if (room == hub_loadingscreen && state != UnknownEnum.Value_2 && !instance_exists(obj_fadeout))
{
    with (obj_player)
    {
        targetRoom = 650;
        targetDoor = "D";
    }
    
    instance_create(x, y, obj_fadeout);
}

if (state != UnknownEnum.Value_0)
{
    showicon = 1;
    icon_alpha = 3;
}
else if (showicon)
{
    icon_alpha = Approach(icon_alpha, 0, 0.05);
    
    if (icon_alpha <= 0)
        showicon = 0;
}

if (showicon)
{
    icon_index += 0.35;
    
    if (icon_index > (icon_max - 1))
    {
        t = frac(icon_index);
        icon_index = t;
    }
}
