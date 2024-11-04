if (other.clowntimer <= 0)
{
    instance_create(x, y, obj_genericpoofeffect);
    other.movespeed = 10;
    other.state = UnknownEnum.Value_104;
    other.skateboarding = 1;
    other.clowntimer = 150;
}
