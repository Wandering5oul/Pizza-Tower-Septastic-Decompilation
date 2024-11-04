var changecoord;

with (other)
{
    if (state != UnknownEnum.Value_186 && state != UnknownEnum.Value_146)
    {
        changecoord = 1;
        
        if (place_meeting(x, y, obj_superspring))
            changecoord = 0;
        
        if (character == "P")
        {
            if (sprite_index != spr_dashpadmach)
            {
                if (changecoord)
                    y = other.y - 14;
                
                sprite_index = spr_dashpadmach;
                image_index = 0;
                vsp = 0;
                create_particle(x, y, UnknownEnum.Value_5, 0);
            }
        }
        else if (character == "N")
        {
            if (sprite_index != spr_crazyrun)
            {
                if (changecoord)
                    y = other.y - 14;
                
                sprite_index = spr_crazyrun;
                image_index = 0;
                vsp = 0;
                create_particle(x, y, UnknownEnum.Value_5, 0);
            }
        }
        
        xscale = sign(other.image_xscale);
        machhitAnim = 0;
        state = UnknownEnum.Value_121;
        
        if (movespeed < 14)
            movespeed = 14;
        else
            movespeed += 0.5;
    }
}
