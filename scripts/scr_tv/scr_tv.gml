function tv_add_expression(argument0, argument1, argument2)
{
    var n;
    
    if (instance_exists(obj_player1) && !obj_player1.ispeppino)
    {
        n = asset_get_index(sprite_get_name(argument0) + "N");
        
        if (n > -1)
            argument0 = n;
    }
    
    if (!ds_list_contains(obj_tv.tv_queue, 
    {
        sprite: argument0
    }))
    {
        ds_list_add(obj_tv.tv_queue, 
        {
            sprite: argument0,
            time: argument1,
            priority: argument2
        });
    }
}

function ds_list_contains(argument0, argument1)
{
    var i, data, j, _data;
    
    for (i = 0; i < ds_list_size(argument0); i++)
    {
        data = ds_list_find_value(argument0, i);
        
        if (is_struct(argument1) && is_struct(data))
        {
            for (j = 0; j < struct_names_count(data); j++)
            {
                _data = struct_get(data, array_get(struct_get_names(data), j));
                
                if (_data == variable_struct_get(argument1, array_get(struct_get_names(data), j)))
                    return true;
            }
        }
    }
    
    return false;
}

function tv_add_whitenoise(argument0)
{
    with (obj_tv)
    {
        whitenoise_state = argument0;
        tv_state = UnknownEnum.Value_2;
        whitenoise_index = 0;
    }
}

function tv_set_idle()
{
    with (obj_tv)
    {
        state = UnknownEnum.Value_0;
        sprite_index = spr_tv_idle;
    }
}

function tv_reset()
{
    with (obj_tv)
    {
        state = UnknownEnum.Value_0;
        sprite_index = spr_tv_idle;
        ds_list_clear(tvprompts_list);
    }
}

function tv_create_prompt(argument0, argument1, argument2, argument3)
{
    return [argument0, argument1, argument2, argument3];
}

function tv_push_prompt(argument0, argument1, argument2, argument3)
{
    var b, play, placed, i, b2;
    
    with (obj_tv)
    {
        b = [argument0, argument1, argument2, argument3];
        play = 0;
        
        switch (argument1)
        {
            case UnknownEnum.Value_0:
                play = 1;
                ds_list_insert(tvprompts_list, 0, b);
                break;
            
            case UnknownEnum.Value_1:
                placed = 0;
                i = 0;
                
                while (i < ds_list_size(tvprompts_list))
                {
                    b2 = ds_list_find_value(tvprompts_list, i);
                    
                    if (b2[1] == UnknownEnum.Value_2)
                    {
                        if (i == 0)
                            play = 1;
                        
                        ds_list_insert(tvprompts_list, i, b);
                        placed = 1;
                        break;
                    }
                    else
                    {
                        i++;
                        continue;
                    }
                }
                
                if (!placed)
                    ds_list_add(tvprompts_list, b);
                
                break;
            
            case UnknownEnum.Value_2:
                ds_list_add(tvprompts_list, b);
                break;
                break;
                continue;
        }
        
        if (play)
            state = UnknownEnum.Value_0;
    }
}

function tv_push_prompt_array(argument0)
{
    var i, b;
    
    for (i = 0; i < array_length(argument0); i++)
    {
        with (obj_tv)
        {
            b = argument0[i];
            tv_push_prompt(b[0], b[1], b[2], b[3]);
        }
    }
}

function tv_push_prompt_once(argument0, argument1)
{
    var b;
    
    with (obj_tv)
    {
        if (special_prompts == -4)
            return 0;
        
        b = ds_map_find_value(special_prompts, argument1);
        
        if (is_undefined(b))
            return 0;
        
        if (b != 1)
        {
            tv_push_prompt(argument0[0], argument0[1], argument0[2], argument0[3]);
            ds_map_set(special_prompts, argument1, 1);
            ini_open_from_string(obj_savesystem.ini_str);
            ini_write_real("Prompts", argument1, 1);
            obj_savesystem.ini_str = ini_close();
            return 1;
        }
        
        return 0;
    }
}

function tv_default_condition()
{
    return place_meeting(x, y, obj_player);
}
