var _search, i, b, d, s, t, txt, w;

if (DEBUG)
{
    if (keyboard_check_pressed(debugkey))
    {
        active = !active;
        keyboard_string = "";
    }
    
    if (active)
    {
        _search = 0;
        
        if (keyboard_check(vk_anykey))
        {
            input_text += keyboard_string;
            
            for (i = 0; i < string_length(keyboard_string); i++)
            {
                b = string_char_at(keyboard_string, i + 1);
                d = string_upper(b);
                
                if (d == "")
                    d = string_lettersdigits(b);
                
                keyboard_key_release(ord(d));
            }
            
            keyboard_string = "";
            _search = 1;
        }
        
        if (keyboard_check(vk_backspace) || keyboard_check(vk_delete))
        {
            input_text = string_delete(input_text, string_length(input_text), 1);
            keyboard_key_release(vk_backspace);
            keyboard_key_release(vk_delete);
            _search = 1;
        }
        
        if (keyboard_check_pressed(vk_enter))
        {
            DoCommand(input_text);
            input_text = "";
            keyboard_string = "";
            _search = 1;
            active = 0;
        }
        
        if (_search)
        {
            ds_list_clear(search_commands);
            search_w = 0;
            
            for (i = 0; i < ds_list_size(command_list); i++)
            {
                b = ds_list_find_value(command_list, i);
                s = b.command_id;
                d = string_split(input_text, " ");
                t = d[0];
                
                if (string_copy(s, 1, string_length(t)) == t)
                {
                    txt = concat(b.command_id, " ", b.format, " - ", b.description);
                    ds_list_add(search_commands, txt);
                    w = string_width(txt);
                    
                    if (w > search_w)
                        search_w = w;
                }
            }
        }
    }
}
