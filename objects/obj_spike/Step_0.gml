with (obj_player)
{
    if (place_meeting(x, y, other))
    {
        if (state == UnknownEnum.Value_51 && hurted == 0)
        {
            scr_soundeffect(110);
            image_index = 0;
            hurted = 1;
            vsp = -4;
            sprite_index = spr_bombpepend;
            state = UnknownEnum.Value_51;
            bombpeptimer = 0;
            instance_create(x, y, obj_bombexplosion);
        }
    }
}
