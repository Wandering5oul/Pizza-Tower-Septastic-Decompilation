function cutscene_waitfor_sprite(argument0)
{
    var finish;
    
    finish = 0;
    
    with (argument0)
    {
        if (image_index > (image_number - 1))
        {
            finish = 1;
            image_index = image_number - 1;
        }
    }
    
    if (finish)
        cutscene_end_action();
}
