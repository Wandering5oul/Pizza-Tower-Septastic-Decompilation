var str;

if (distance_to_object(obj_player1) < 50)
{
    str = "";
    
    if (obj_player1.state == UnknownEnum.Value_183)
        str = "DELETE ";
    
    with (Aobj_tv)
    {
        showtext = 1;
        alarm[0] = 2;
        message = concat(str, "FILE ", other.file);
    }
}
