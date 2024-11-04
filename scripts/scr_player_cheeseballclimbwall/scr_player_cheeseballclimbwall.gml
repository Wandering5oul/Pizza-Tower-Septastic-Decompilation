function scr_player_cheeseballclimbwall()
{
    hsp = 0;
    vsp = -wallspeed;
    
    if (scr_solid(x, y - 1) && !place_meeting(x, y - 1, obj_destructibles) && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)) && !place_meeting(x - sign(hsp), y, obj_slope))
    {
        sprite_index = spr_superjumpland;
        scr_soundeffect(55);
        image_index = 0;
        state = UnknownEnum.Value_123;
        machhitAnim = 0;
        
        repeat (4)
            create_debris(x, y, 1283);
    }
    
    if (!scr_solid(x + xscale, y))
    {
        instance_create(x, y, obj_jumpdust);
        vsp = 0;
        state = UnknownEnum.Value_21;
        movespeed = wallspeed;
    }
    
    if (key_jump)
    {
        vsp = -11;
        state = UnknownEnum.Value_21;
        xscale *= -1;
    }
}
