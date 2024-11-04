var _tank, _baddie;

_tank = id;
_baddie = other.id;

with (_baddie)
{
    if (instance_exists(baddieID) && baddieID != other.id)
    {
        if (baddieID.state == UnknownEnum.Value_138 && baddieID.thrown == 1)
        {
            with (_tank)
                instance_destroy();
        }
    }
}
