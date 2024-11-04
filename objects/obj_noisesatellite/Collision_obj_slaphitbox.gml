if (state == UnknownEnum.Value_138 && hp == 0 && stunned > 40 && slapped == 0)
{
    slapped = 1;
    instance_create(x + (obj_player.xscale * 40), y, obj_punchdust);
    state = UnknownEnum.Value_4;
    obj_player.state = UnknownEnum.Value_79;
    instance_destroy(other);
}

if (hp == 0 && !(state == UnknownEnum.Value_138 && stunned > 40) && state != UnknownEnum.Value_4 && slapped == 0)
{
    instance_create(x, y, obj_spikehurteffect);
    other.image_xscale = image_xscale;
    slapped = 1;
    flash = 1;
    instance_create(x, y, obj_bumpeffect);
    stunned = 200;
    
    if (other.x != x)
        image_xscale = -sign(x - other.x);
    
    vsp = -5;
    hsp = -image_xscale * 3;
    state = UnknownEnum.Value_138;
}
else if (state != UnknownEnum.Value_4 && slapped == 0)
{
    if (hp > 0)
        hp -= 1;
    
    if (slapped == 0)
        instance_create(x, y, obj_slapstar);
    
    with (instance_create(x, y, obj_spikehurteffect))
        other.image_xscale = image_xscale;
    
    slapped = 1;
    state = UnknownEnum.Value_138;
    stunned = 40;
    
    if (other.x != x)
        image_xscale = -sign(x - other.x);
    
    vsp = -3;
    hsp = -image_xscale * 2;
}
