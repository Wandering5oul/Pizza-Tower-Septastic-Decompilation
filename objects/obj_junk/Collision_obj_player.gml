if (!grabbed && (other.state == UnknownEnum.Value_42 || other.state == UnknownEnum.Value_80 || other.state == UnknownEnum.Value_43) && unpickable == 0)
{
    instance_create(x + (obj_player1.xscale * 40), y, obj_punchdust);
    
    with (other)
    {
        image_index = 0;
        sprite_index = spr_haulingstart;
        baddiegrabbedID = other.id;
        grabbingenemy = 1;
        state = UnknownEnum.Value_79;
    }
    
    playerid = other.object_index;
    grabbed = 1;
}
