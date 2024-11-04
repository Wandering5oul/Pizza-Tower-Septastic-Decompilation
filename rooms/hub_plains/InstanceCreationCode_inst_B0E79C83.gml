if (global.levelcomplete && !global.mansioncutscene)
{
    currentroom = room;
    scene_info = [[function()
    {
        with (obj_player)
        {
            state = UnknownEnum.Value_0;
            x = backtohubstartx;
            y = backtohubstarty;
        }
        
        global.levelcomplete = 0;
        global.mansioncutscene = 1;
        global.levelcompletename = -4;
        quick_ini_write_real(get_savefile_ini(), "cutscene", "mansion", 1);
        cutscene_end_action();
    }], [cutscene_save_game]];
}
else if (global.levelcomplete)
{
    global.levelcomplete = 0;
    scene_info = [[cutscene_save_game]];
}
else
{
    scene_info = [[cutscene_wait, 20]];
}
