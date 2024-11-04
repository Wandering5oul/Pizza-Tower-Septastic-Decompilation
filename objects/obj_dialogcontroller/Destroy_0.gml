var func;

with (obj_player)
{
    if (!other.bucket)
        state = other.savedstate;
    
    input_buffer_jump = 0;
}

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
