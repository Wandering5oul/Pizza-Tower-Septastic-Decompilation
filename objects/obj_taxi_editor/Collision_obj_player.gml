if (index < 0)
    exit;

if ((obj_player1.state != UnknownEnum.Value_119 || obj_player2.state != UnknownEnum.Value_119) && sprite_index == spr_taxiidle)
{
    with (obj_stopsign_editor)
    {
        if (index == other.index)
        {
            other.sign_id = id;
            other.xx = x;
            other.yy = y;
        }
    }
    
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
