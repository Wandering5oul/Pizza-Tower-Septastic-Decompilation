function cutscene_check_collision(argument0, argument1)
{
    var obj1, obj2, finish;
    
    obj1 = argument0;
    obj2 = argument1;
    finish = 0;
    
    with (obj1)
    {
        if (place_meeting(x, y, obj2))
            finish = 1;
    }
    
    if (finish)
        cutscene_end_action();
}
