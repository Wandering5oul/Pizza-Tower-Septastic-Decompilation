event_inherited();
dmg = 10;
col_buffer = 0;
col_max = 20;

function player_hurt(argument0, argument1)
{
    var _prevstate;
    
    if (!collisioned && argument1.state != 145)
    {
        _prevstate = argument1.state;
        col_buffer = col_max;
        SUPER_player_hurt(argument0, argument1);
        
        if (_prevstate == 47)
        {
            with (argument1)
            {
                state = UnknownEnum.Value_47;
                hsp = hithsp;
                vsp = hitvsp;
                xscale = other.baddieID.image_xscale;
                sprite_index = spr_knightpep_doublejump;
                image_index = 0;
            }
        }
    }
}
