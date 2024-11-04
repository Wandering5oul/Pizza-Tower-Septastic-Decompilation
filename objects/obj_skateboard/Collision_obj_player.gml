if (other.state != UnknownEnum.Value_61 && other.skateboarding == 0)
{
    instance_create(x, y, obj_genericpoofeffect);
    other.movespeed = 10;
    other.state = UnknownEnum.Value_104;
    other.skateboarding = 1;
    tv_push_prompt_once(tv_create_prompt("This is the clown transformation text", UnknownEnum.Value_2, 1190, 3), "skateboard");
}
