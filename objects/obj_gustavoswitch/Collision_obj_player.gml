if (global.panic == 0)
{
    with (other)
    {
        if (!instance_exists(obj_fadeout))
        {
            obj_player1.lastroom = room;
            obj_player2.lastroom = room;
            obj_player1.targetDoor = "B";
            
            if (room == street_jail)
            {
                obj_player1.targetDoor = "D";
                obj_player1.targetRoom = 575;
            }
            else
            {
                obj_player1.targetRoom = 194;
            }
            
            obj_player1.hallway = 1;
            obj_player1.hallwaydirection = other.image_xscale;
            other.visited = 1;
            scr_soundeffect(103);
            instance_create(x, y, obj_fadeout);
        }
        
        state = UnknownEnum.Value_191;
    }
}
else
{
    with (other)
        state = UnknownEnum.Value_0;
}
