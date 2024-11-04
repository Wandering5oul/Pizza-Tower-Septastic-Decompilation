with (other)
{
    if (character == "V")
    {
        scr_hurtplayer(id);
    }
    else if (!isgustavo && state != UnknownEnum.Value_16 && state != UnknownEnum.Value_17 && state != UnknownEnum.Value_146 && state != UnknownEnum.Value_147 && state != UnknownEnum.Value_186)
    {
        scr_losepoints();
        tv_push_prompt_once(tv_create_prompt("This is the ghost transformation text", UnknownEnum.Value_2, 2070, 3), "ghost");
        grav /= 2;
        state = UnknownEnum.Value_16;
        sprite_index = spr_ghostidle;
        
        with (instance_create(x, y, obj_sausageman_dead))
        {
            hsp = other.image_xscale * 3;
            image_xscale = -other.image_xscale;
            sprite_index = other.spr_dead;
        }
        
        other.debris = 0;
    }
}
