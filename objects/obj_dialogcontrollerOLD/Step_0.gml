var func;

if (textbuffer > 0)
{
    textbuffer--;
}
else
{
    currentpos++;
    
    if (currentpos <= string_length(currenttext))
    {
        displaytext = string_insert(string_char_at(currenttext, currentpos), displaytext, string_length(displaytext) + 1);
        displaytext = scr_separate_text(displaytext);
        textbuffer = textspeed;
        scr_soundeffect(dialogsnd[irandom(array_length(dialogsnd) - 1)]);
    }
    else if (obj_player.key_jump)
    {
        if (currentdialog < (array_length(dialog) - 1))
        {
            currentdialog++;
            currentpos = 0;
            textbuffer = textspeed;
            displaytext = "";
            
            if (string_starts_with(dialog[currentdialog][0], "{P}"))
            {
                talking = true;
                dialog[currentdialog][0] = string_replace(dialog[currentdialog][0], "{P}", "");
            }
            else
            {
                talking = false;
            }
            
            currenttext = scr_calculate_text(dialog[currentdialog][0]);
            obj_player.key_jump = 0;
            dialogheight = scr_calculate_height(currenttext);
            dialogsprite = dialog[currentdialog][1];
            func = dialog[currentdialog][2];
            
            if (func != -4)
            {
                if (npcID != -4 && instance_exists(npcID))
                {
                    with (npcID)
                        method(id, func)();
                }
                else
                {
                    method(id, func)();
                }
            }
        }
        else
        {
            instance_destroy();
        }
    }
}

if (currentpos < string_length(currenttext) && obj_player.key_jump)
{
    while (currentpos <= string_length(currenttext))
    {
        currentpos++;
        displaytext = string_insert(string_char_at(currenttext, currentpos), displaytext, string_length(displaytext) + 1);
        displaytext = scr_separate_text(displaytext);
    }
}

scroll--;
