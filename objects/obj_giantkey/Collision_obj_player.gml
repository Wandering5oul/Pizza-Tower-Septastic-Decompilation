if (picked == 0)
{
    hsp = 0;
    vsp = 0;
    grav = 0;
    
    if (other.object_index == obj_player1)
        playerid = 245;
    else
        playerid = 244;
    
    alarm[0] = 150;
    y = playerid.y - 50;
    x = playerid.x;
    
    with (playerid)
    {
        state = UnknownEnum.Value_46;
        scr_soundeffect(49);
        global.giantkey = 1;
    }
    
    obj_tv.showtext = 1;
    obj_tv.message = "GOT THE GIANT KEY!!!";
    obj_tv.alarm[0] = 200;
    global.heattime = 60;
    picked = 1;
}
