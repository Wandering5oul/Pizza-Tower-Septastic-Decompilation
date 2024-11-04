global.currentsavefile = other.file;
obj_player1.lastroom = room;
obj_player2.lastroom = room;
obj_camera.chargecamera = 0;

if (object_index == obj_player1)
    obj_player1.sprite_index = obj_player1.spr_lookdoor;

if (object_index == obj_player2)
    obj_player2.sprite_index = obj_player2.spr_lookdoor;

obj_player1.targetDoor = "A";
obj_player1.targetRoom = 679;
obj_player2.targetDoor = "A";
obj_player2.targetRoom = 679;
obj_player.image_index = 0;
obj_player.state = UnknownEnum.Value_95;
obj_player.mach2 = 0;

with (obj_player)
{
    if (object_index == obj_player1)
        ispeppino = other.ispeppino;
    else
        ispeppino = !other.ispeppino;
    
    scr_characterspr();
    sprite_index = spr_walkfront;
}

if (instance_exists(obj_player2) && global.coop == 1)
{
    if (object_index == obj_player2)
    {
        obj_player1.x = obj_player2.x;
        obj_player1.y = obj_player2.y;
    }
    
    if (object_index == obj_player1)
    {
        obj_player2.x = obj_player1.x;
        obj_player2.y = obj_player1.y;
    }
}

instance_create(x, y, obj_fadeout);
