with (other)
{
    if (key_up && grounded && (state == UnknownEnum.Value_0 || state == UnknownEnum.Value_103 || state == UnknownEnum.Value_104 || state == UnknownEnum.Value_58 || state == UnknownEnum.Value_121 || state == UnknownEnum.Value_99) && !instance_exists(obj_noisesatellite) && !instance_exists(obj_fadeout) && state != UnknownEnum.Value_119 && ((obj_player1.spotlight == 1 && object_index == obj_player1) || (obj_player1.spotlight == 0 && object_index == obj_player2)))
    {
        with (other)
        {
            instance_create(x, y, obj_genericpoofeffect);
            obj_player1.visible = false;
            obj_player1.sprite_index = obj_player1.spr_idle;
            obj_player1.hsp = 0;
            obj_player1.vsp = 0;
            obj_player1.state = UnknownEnum.Value_119;
            scr_soundeffect(122);
            playerid = 245;
            sprite_index = spr_taximove;
            hsp = 10;
            obj_player1.cutscene = 1;
            
            if (global.coop == 1)
            {
                obj_player2.sprite_index = obj_player2.spr_idle;
                scr_soundeffect(122);
                playerid = 244;
                sprite_index = spr_taximove;
                hsp = 10;
                obj_player2.visible = false;
                obj_player2.hsp = 0;
                obj_player2.vsp = 0;
                obj_player2.state = UnknownEnum.Value_119;
                obj_player2.cutscene = 1;
            }
        }
    }
}
