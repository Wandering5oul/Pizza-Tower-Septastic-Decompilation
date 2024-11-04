if (state != UnknownEnum.Value_34)
{
    if (state == UnknownEnum.Value_42 || state == UnknownEnum.Value_43)
    {
        if (other.state == UnknownEnum.Value_0 && scr_transformationcheck() && !cutscene && state != UnknownEnum.Value_52 && (state == UnknownEnum.Value_42 || state == UnknownEnum.Value_80 || state == UnknownEnum.Value_43))
        {
            state = UnknownEnum.Value_52;
            image_index = 0;
            sprite_index = spr_haulingstart;
            other.defused = 1;
            bombgrabID = other.id;
            movespeed = 6;
            
            with (other)
            {
                state = UnknownEnum.Value_4;
                playerid = other.id;
            }
            
            tv_push_prompt_once(tv_create_prompt("This is the bomb transformation text", UnknownEnum.Value_2, 2463, 3), "bombpep");
        }
    }
}
else if (other.kickbuffer <= 0)
{
    other.vsp = -9;
    other.movespeed = 7;
    other.image_xscale = xscale;
    other.kickbuffer = 15;
    other.y--;
    other.defused = 1;
}
