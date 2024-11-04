with (instance_create(x, y, obj_fadeout))
{
    obj_player1.targetRoom = 679;
    obj_player1.targetDoor = "A";
    obj_player1.state = UnknownEnum.Value_0;
    
    if (global.coop == 1)
    {
        obj_player2.state = UnknownEnum.Value_0;
        obj_player2.targetDoor = "A";
    }
}

gamesave_async_load();
