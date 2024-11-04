with (obj_player)
{
    if (state == UnknownEnum.Value_47 || state == UnknownEnum.Value_38)
        instance_destroy(other);
}

sprite_index = spr_grandpa_punch;
image_index = 0;
scr_hurtplayer(other);
