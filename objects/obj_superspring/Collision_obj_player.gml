with (other)
{
    if (state != UnknownEnum.Value_97 && state != UnknownEnum.Value_186)
    {
        if (state == UnknownEnum.Value_47 || state == UnknownEnum.Value_48 || state == UnknownEnum.Value_38)
        {
            with (instance_create(x, y, obj_knightdebris))
                image_index = 0;
            
            with (instance_create(x, y, obj_knightdebris))
                image_index = 1;
            
            with (instance_create(x, y, obj_knightdebris))
                image_index = 2;
            
            with (instance_create(x, y, obj_knightdebris))
                image_index = 3;
            
            with (instance_create(x, y, obj_knightdebris))
                image_index = 4;
            
            with (instance_create(x, y, obj_knightdebris))
                image_index = 5;
        }
        
        if (state == UnknownEnum.Value_51)
            instance_create(x, y, obj_bombexplosion);
        
        x = other.x;
        instance_create(x, y - 20, obj_bangeffect);
        sprite_index = spr_superspringplayer;
        state = UnknownEnum.Value_97;
        vsp = -10;
        other.image_index = 0;
        other.sprite_index = spr_presentbox_activate;
    }
}
