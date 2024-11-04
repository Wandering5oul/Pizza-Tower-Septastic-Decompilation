if ((other.state == UnknownEnum.Value_42 || other.state == UnknownEnum.Value_80) && other.grounded == 1)
{
    instance_create(x + (obj_player1.xscale * 40), y, obj_punchdust);
    
    with (other)
    {
        image_index = 0;
        sprite_index = spr_haulingstart;
        grabbingenemy = 1;
        baddiegrabbedID = other.id;
        state = UnknownEnum.Value_79;
    }
    
    playerid = other.object_index;
    grabbed = 1;
}

if (other.state == UnknownEnum.Value_104 || other.state == UnknownEnum.Value_121 || (other.state == UnknownEnum.Value_65 && grounded))
{
    create_particle(x, y, UnknownEnum.Value_9, 0);
    
    with (other)
    {
        vsp = 0;
        mask_index = spr_crouchmask;
        x = other.x;
        y = other.y;
        state = UnknownEnum.Value_113;
        sprite_index = spr_barrelroll;
        movespeed = 12;
    }
    
    instance_destroy();
}
