if (!instance_exists(ID) && !global.mort && obj_player1.state != UnknownEnum.Value_11 && obj_player2.state != UnknownEnum.Value_11 && place_meeting(x, y, obj_player))
{
    instance_destroy(obj_mort);
    
    with (instance_create(x, y - 50, obj_mort))
        other.ID = id;
}
