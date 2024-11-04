if (ds_list_find_index(global.saveroom, id) == -1)
{
    with (instance_create(x, y, obj_sausageman_dead))
    {
        image_xscale = other.image_xscale;
        sprite_index = other.spr_dead;
        scr_soundeffect(237);
        scr_soundeffect(210);
        scr_soundeffect(51);
        scr_soundeffect(56);
    }
    
    ds_list_add(global.saveroom, id);
}
