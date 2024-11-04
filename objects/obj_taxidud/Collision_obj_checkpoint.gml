if (playerid.visible == false)
{
    global.hp = 8;
    global.failcutscene = 0;
    
    with (obj_player1)
    {
        scr_soundeffect(121);
        state = UnknownEnum.Value_0;
        instance_create(x, y, obj_genericpoofeffect);
        cutscene = 0;
    }
    
    if (global.coop == 1)
    {
        with (obj_player2)
        {
            state = UnknownEnum.Value_0;
            cutscene = 0;
        }
    }
    
    obj_player1.visible = true;
    obj_player2.visible = true;
}
