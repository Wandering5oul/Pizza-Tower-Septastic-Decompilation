with (other)
{
    if (character == "V")
    {
        scr_hurtplayer(object_index);
    }
    else if (scr_transformationcheck())
    {
        if (state != UnknownEnum.Value_10 && state != UnknownEnum.Value_147 && hurted == 0)
        {
            tv_push_prompt_once(tv_create_prompt("This is the firemouth transformation text", UnknownEnum.Value_2, 1136, 3), "firemouth");
            is_firing = 0;
            hsp = 0;
            movespeed = 0;
            state = UnknownEnum.Value_10;
            image_index = 0;
            sprite_index = spr_firemouthintro;
            state = UnknownEnum.Value_10;
            bombpeptimer = 3;
            instance_destroy(other);
        }
    }
}
