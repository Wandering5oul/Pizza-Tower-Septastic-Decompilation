if (!kick && countdown <= 0)
{
    other.vsp = -14;
    other.jumpstop = 1;
    
    if (other.state == UnknownEnum.Value_92)
    {
        other.sprite_index = other.spr_stompprep;
        other.image_index = 0;
        other.jumpAnim = 1;
    }
    
    countdown = 10;
    scr_soundeffect(52);
    create_particle(x, y, UnknownEnum.Value_5, 0);
}
