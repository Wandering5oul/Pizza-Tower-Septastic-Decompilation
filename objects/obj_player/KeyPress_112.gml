var roomname, namestring;

if (global.timeattack == 1)
    obj_timeattack.stop = 1;

targetDoor = "none";
obj_camera.alarm[2] = -1;
roomname = room_get_name(room);
namestring = string_letters(roomname);
scr_savescore(namestring);

if (!instance_exists(obj_endlevelfade))
    instance_create(x, y, obj_endlevelfade);

obj_player1.state = UnknownEnum.Value_112;
obj_player1.sprite_index = obj_player1.spr_lookdoor;

if (instance_exists(obj_player2))
{
    obj_player2.state = UnknownEnum.Value_112;
    obj_player2.sprite_index = obj_player2.spr_lookdoor;
    
    if (global.coop)
        obj_player2.visible = true;
}

obj_endlevelfade.alarm[0] = 235;
image_index = 0;
global.panic = 0;
global.snickchallenge = 0;
