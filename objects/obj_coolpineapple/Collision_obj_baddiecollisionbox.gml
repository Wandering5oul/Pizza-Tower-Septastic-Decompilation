var my_id, other_baddie, can_parry;

if (state != UnknownEnum.Value_147 && state != UnknownEnum.Value_84)
    exit;

my_id = id;
other_baddie = other.id;
can_parry = 0;

with (other_baddie)
{
    if (instance_exists(baddieID) && baddieID.thrown == 1 && baddieID != other.id)
        can_parry = 1;
}

if (can_parry && state != UnknownEnum.Value_147 && other.baddieID != id)
{
    sprite_index = parryspr;
    movespeed = 8;
    state = UnknownEnum.Value_147;
    image_index = 0;
}
