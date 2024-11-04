var dis, b;

with (obj_player)
{
    dis = abs(x - other.x);
    
    if (!instance_exists(obj_dialogcontroller))
    {
        if (!other.warned)
        {
            if (dis < 300)
            {
                with (other)
                {
                    dialog[0] = dialog_create("Not one step closer!", -4, vigilante_add_battle);
                    do_dialog(dialog, dialogsnd, portrait, fontselect);
                    dialog = -4;
                    warned = 1;
                }
            }
        }
        else if (dis < 200)
        {
            if (state == UnknownEnum.Value_17)
            {
                with (possessID)
                {
                    state = UnknownEnum.Value_138;
                    stunned = 50;
                }
                
                state = UnknownEnum.Value_0;
            }
            
            with (other)
            {
                scr_hurtplayer(other);
                waitforhurt = 1;
            }
        }
    }
}

if (waitforhurt && !instance_exists(obj_dialogcontroller))
{
    b = 0;
    
    with (obj_player)
    {
        if (state == UnknownEnum.Value_107)
            b = 1;
    }
    
    if (!b)
    {
        waitforhurt = 0;
        dialog[0] = dialog_create("You gotta fight me!", -4, vigilante_add_battle);
        do_dialog(dialog, dialogsnd, portrait, fontselect);
        dialog = -4;
        warned = 1;
    }
}
