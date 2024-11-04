var _actor;

_actor = 0;

with (obj_player)
{
    if (state == UnknownEnum.Value_146)
        _actor = 1;
}

if (_actor)
    exit;

with (other)
{
    if (key_up && grounded && !instance_exists(obj_option) && (state == UnknownEnum.Value_0 || state == UnknownEnum.Value_103 || state == UnknownEnum.Value_104 || state == UnknownEnum.Value_58 || state == UnknownEnum.Value_121 || state == UnknownEnum.Value_99))
    {
        instance_create(x, y, obj_option);
        state = UnknownEnum.Value_146;
    }
}
