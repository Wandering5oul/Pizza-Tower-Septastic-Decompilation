if (state != UnknownEnum.Value_74 && state != UnknownEnum.Value_138 && state != UnknownEnum.Value_4)
{
    if (other.hsp == 0 && other.vsp > 0 && other.vsp < 1)
    {
        golfid = other.id;
        shot = 0;
        state = UnknownEnum.Value_74;
        sprite_index = spr_cheeseslime_rage;
        image_index = 0;
    }
    else if (!other.grounded)
    {
        instance_destroy();
    }
}
