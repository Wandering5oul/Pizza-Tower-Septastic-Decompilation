function scr_enemy_ratgrabbed()
{
    if (state == 204)
    {
        visible = false;
        x = ratplayerid.x;
        y = ratplayerid.y;
        sprite_index = stunfallspr;
        
        if (state != UnknownEnum.Value_138)
            state = 204;
        
        if (ratplayerid.state == UnknownEnum.Value_194 && ratplayerid.image_index > 5)
        {
            y = ratplayerid.y - 5;
            grounded = 0;
            hp = -1;
            alarm[1] = 5;
            state = UnknownEnum.Value_138;
            hsp = ratplayerid.xscale * 22;
            image_xscale = -ratplayerid.xscale;
            vsp = -2;
            stunned = 200;
            thrown = 1;
            visible = true;
            hithsp = hsp;
            hitvsp = vsp;
        }
    }
}
