function scr_scareenemy()
{
    var player;
    
    player = instance_nearest(x, y, obj_player);
    
    if (state != UnknownEnum.Value_4 && state != UnknownEnum.Value_138 && state != UnknownEnum.Value_137)
    {
        if (player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 60) && y >= (player.y - 60))
        {
            if (sprite_index != scaredspr && state != UnknownEnum.Value_138 && state != UnknownEnum.Value_155 && (player.state == UnknownEnum.Value_41 || player.state == UnknownEnum.Value_121 || player.state == UnknownEnum.Value_31 || player.state == UnknownEnum.Value_184 || player.state == UnknownEnum.Value_20 || player.state == UnknownEnum.Value_38 || (player.state == UnknownEnum.Value_79 && player.swingdingdash <= 0 && player.sprite_index == player.spr_swingding)))
            {
                state = UnknownEnum.Value_126;
                sprite_index = scaredspr;
                
                if (x != player.x)
                    image_xscale = -sign(x - player.x);
                
                scaredbuffer = 100;
                
                if (grounded)
                    vsp = -5;
            }
        }
    }
}
