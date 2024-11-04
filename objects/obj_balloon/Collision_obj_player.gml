if (other.state == UnknownEnum.Value_186)
    exit;

create_particle(x, y, UnknownEnum.Value_6, 0);
other.vsp = -14;
other.jumpstop = 1;
visible = false;
x = -100;
y = -100;
respawn = 100;

if (other.state == UnknownEnum.Value_92)
    other.sprite_index = other.spr_machfreefall;

if (other.state == UnknownEnum.Value_37)
{
    other.sprite_index = other.spr_machfreefall;
    other.state = UnknownEnum.Value_92;
}
