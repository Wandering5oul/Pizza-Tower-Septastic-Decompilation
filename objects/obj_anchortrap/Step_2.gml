var num, i;

switch (state)
{
    case UnknownEnum.Value_0:
        hsp = 0;
        vsp = 0;
        break;
    
    case 135:
        num = instance_place_list(x, y + vsp + 1, 253, global.instancelist, false);
        
        for (i = 0; i < num; i++)
            instance_destroy(ds_list_find_value(global.instancelist, i));
        
        ds_list_clear(global.instancelist);
        instance_destroy(instance_place(x, y + vsp + 1, obj_metalblock));
        scr_collide();
        
        if (grounded)
        {
            scr_soundeffect(55);
            state = UnknownEnum.Value_92;
            
            with (obj_camera)
            {
                shake_mag = 5;
                shake_mag_acc = 3 / room_speed;
            }
        }
        
        break;
    
    case UnknownEnum.Value_92:
        y = Approach(y, ystart, 2);
        
        if (y == ystart)
            state = UnknownEnum.Value_0;
        
        break;
}
