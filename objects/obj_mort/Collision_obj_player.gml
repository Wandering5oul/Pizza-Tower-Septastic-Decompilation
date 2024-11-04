if (sprite_index != spr_mortspawn && sprite_index != spr_mortfall)
{
    with (other)
    {
        if (state != UnknownEnum.Value_11 && state != UnknownEnum.Value_12 && state != UnknownEnum.Value_13 && state != UnknownEnum.Value_14 && state != UnknownEnum.Value_190)
        {
            repeat (6)
                create_debris(x, y, 1297);
            
            mort = 1;
            instance_create_unique(x, y, 13);
            state = UnknownEnum.Value_11;
            tv_push_prompt_once(tv_create_prompt("This is the mort powerup text", UnknownEnum.Value_2, 2506, 3), "mort");
            instance_destroy(other);
        }
    }
}
