function init_game()
{
    if (!variable_global_exists("game_init"))
    {
        scr_loadoptions();
        global.game_init = true;
    }
}
