function scr_player_mortattack()
{
    image_speed = 0.45;
    hsp = xscale * movespeed;
    
    if (floor(image_index) == (image_number - 1))
    {
        if (grounded && vsp > 0)
        {
            state = UnknownEnum.Value_11;
            sprite_index = spr_idle;
            landAnim = 0;
        }
        else
        {
            state = UnknownEnum.Value_12;
            sprite_index = spr_fall;
        }
    }
}
