if (other.cutscene || other.state == UnknownEnum.Value_10)
    exit;

with (other)
{
    vsp = -18;
    sprite_index = spr_machfreefall;
    jumpstop = 1;
    state = UnknownEnum.Value_92;
}

sprite_index = spr_clownmato_bounce;
image_index = 0;
