function cutscene_player_check_ground(argument0)
{
    var player, finish;
    
    player = argument0;
    finish = 0;
    
    with (player)
    {
        if (grounded)
            finish = 1;
    }
    
    if (finish)
        cutscene_end_action();
}
