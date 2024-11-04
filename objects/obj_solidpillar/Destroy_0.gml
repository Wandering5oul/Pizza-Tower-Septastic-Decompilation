if (destroy)
{
    ds_list_add(global.saveroom, id);
    scr_soundeffect(42);
    scr_soundeffect(192);
    
    with (instance_create(x, y, obj_explosioneffect))
        sprite_index = spr_bombexplosion;
    
    instance_create(x, y, obj_bangeffect);
    instance_create(x, y, obj_slapstar);
    instance_create(x, y, obj_slapstar);
    instance_create(x, y, obj_slapstar);
    instance_create(x, y, obj_debris);
    instance_create(x, y, obj_debris);
    instance_create(x, y, obj_debris);
    
    with (obj_camera)
    {
        shake_mag = 3;
        shake_mag_acc = 3 / room_speed;
    }
    
    with (instance_create(x + 32, y + 32, obj_metaldebris))
        sprite_index = spr_johnblocks_debri_hub;
    
    sprite_get_number(spr_noisedevil);
    
    with (instance_create(x + 32, y + 32, obj_metaldebris))
        sprite_index = spr_johnblocks_debri_hub;
    
    sprite_get_number(spr_priest_pray);
    
    with (instance_create(x + 32, y + 32, obj_metaldebris))
        sprite_index = spr_johnblocks_debri_hub;
    
    sprite_get_number(spr_playerN_flamethrowerdiagonalup);
}
