function gamesave_async_load()
{
    with (obj_savesystem)
    {
        if (state == UnknownEnum.Value_0)
        {
            loadbuff = buffer_create(1, buffer_grow, 1);
            buffer_async_group_begin("saves");
            buffer_load_async(loadbuff, get_savefile_ini(), 0, -1);
            loadid = buffer_async_group_end();
            state = UnknownEnum.Value_2;
        }
    }
}

function gamesave_async_save()
{
    var closestring;
    
    with (obj_savesystem)
    {
        if (state == UnknownEnum.Value_0)
        {
            showicon = 1;
            icon_alpha = 3;
            buffer_async_group_begin("saves");
            savebuff = buffer_create(1, buffer_grow, 1);
            ini_open_from_string(ini_str);
            closestring = ini_close();
            buffer_write(savebuff, buffer_string, closestring);
            buffer_save_async(savebuff, get_savefile_ini(), 0, buffer_get_size(savebuff));
            saveid = buffer_async_group_end();
        }
    }
}
