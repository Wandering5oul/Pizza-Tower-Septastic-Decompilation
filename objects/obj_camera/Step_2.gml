var _player1, _player2, _p1state, _p1spr, _p1movespeed, _validstate, _p1pogospeed, _char, _temp_local_var_18;

_player1 = obj_player1.spotlight ? 245 : 244;
_player2 = obj_player1.spotlight ? 245 : 246;
_p1state = _player1.state;

if (_p1state == 84 || _p1state == 61)
    _p1state = _player1.tauntstoredstate;

_p1spr = _player1.sprite_index;
_p1movespeed = _player1.movespeed;

switch (_player1.character)
{
    case "P":
        _validstate = _p1state == 103 || _p1state == 104 || _p1state == 121 || _p1state == 37 || _p1state == 105 || _p1state == 65 || _p1state == 42;
        spr_speedbarHUD = spr_speedbar;
        spr_speedbar_index = spr_plug;
        
        if (_validstate)
        {
            if (_p1movespeed < 2.4)
            {
                spr_speedbar_index = spr_plug;
            }
            else if (_p1movespeed >= 2.4 && _p1movespeed < 4.8)
            {
                spr_speedbar_index = spr_cheeseblob;
            }
            else if (_p1movespeed >= 4.8 && _p1movespeed < 7.2)
            {
                spr_speedbar_index = spr_cheesemaker;
            }
            else if (_p1movespeed >= 7.2 && _p1movespeed < 9.6)
            {
                spr_speedbar_index = spr_railh2right;
            }
            else if (_p1movespeed >= 9.6 && _p1movespeed < 12)
            {
                spr_speedbar_index = spr_railh2left;
            }
            else if (_p1movespeed >= 12)
            {
                spr_speedbarHUD = spr_speedbarmax;
                spr_speedbar_index = -1;
            }
        }
        
        break;
    
    case "N":
        _p1pogospeed = _player1.pogospeed;
        spr_speedbarHUD = spr_speedbar;
        
        if (_p1pogospeed < 10)
        {
            spr_speedbar_index = spr_plug;
        }
        else if (_p1pogospeed >= 10 && _p1pogospeed < 14)
        {
            spr_speedbar_index = spr_railh2right;
        }
        else if (_p1pogospeed >= 14)
        {
            spr_speedbar_index = -1;
            spr_speedbarHUD = spr_speedbar;
        }
        
        break;
    
    case "V":
        spr_speedbarHUD = -4;
        break;
}

_char = _player1.character;
ispeppino = _player1.ispeppino;

if (_char == "P" && ispeppino)
{
    spr_player = spr_pepinoHUD;
    
    switch (_p1spr)
    {
        case 625:
            spr_player = spr_pepinoHUDthunder;
            break;
        
        case 626:
            spr_player = spr_pepinoHUD;
            break;
        
        case 610:
            spr_player = spr_pepinoHUDknight;
            break;
        
        case 609:
            spr_player = spr_pepinoHUDknight;
            break;
        
        case 601:
            spr_player = spr_pepinoHUDbombend;
            break;
        
        case 604:
        case 602:
        case 603:
        case 907:
            spr_player = spr_pepinoHUDscream;
            break;
        
        case 852:
            spr_player = spr_pepinoHUDhappy;
            break;
        
        case 794:
        case 938:
            spr_player = spr_pepinoHUDrolling;
            break;
        
        case 941:
        case 749:
            spr_player = spr_pepinoHUDmach2;
            break;
        
        case 748:
            spr_player = spr_pepinoHUDmach3;
            break;
        
        case 909:
            spr_player = spr_pepinoHUDhurt;
            break;
    }
    
    if (spr_player == spr_pepinoHUD && instance_exists(obj_itspizzatime))
        spr_player = spr_pepinoHUDscream;
    
    if (spr_player == spr_pepinoHUD && global.combo >= 20)
        spr_player = spr_pepinoHUDmenacing;
    
    if (spr_player == spr_pepinoHUD)
    {
        switch (_p1state)
        {
            case 47:
                if (sprite_index != _player1.spr_knightpepstart)
                    spr_player = spr_pepinoHUDknight;
                
                break;
            
            case 38:
                spr_player = spr_pepinoHUDknight;
                break;
            
            case 123:
                spr_player = spr_pepinoHUDstun;
                break;
            
            case 111:
                if (shake_mag > 0)
                    spr_player = spr_pepinoHUDstun;
                
                break;
            
            case 90:
            case 96:
            case 46:
                spr_player = spr_pepinoHUDhappy;
                break;
            
            case 103:
            case 61:
            case 122:
            case 108:
            case 91:
            case 97:
            case 75:
            case 99:
            case 79:
            case 80:
            case 84:
            case 81:
            case 82:
            case 83:
                spr_player = spr_pepinoHUDmach1;
                break;
            
            case 104:
            case 37:
            case 42:
            case 76:
                spr_player = spr_pepinoHUDmach2;
                break;
            
            case 121:
                spr_player = spr_pepinoHUDmach3;
                
                if (_p1spr == spr_player_crazyrun)
                    spr_player = spr_pepinoHUDmach4;
                
                break;
            
            case 107:
            case 64:
            case 51:
                spr_player = spr_pepinoHUDhurt;
                break;
            
            case 88:
                if (_p1spr == spr_player_bossintro || _p1spr == spr_player_idle)
                    spr_player = spr_pepinoHUDhurt;
                else if (_p1spr == spr_player_levelcomplete)
                    spr_player = spr_pepinoHUDhappy;
                
                break;
        }
        
        if (spr_player == spr_pepinoHUD)
        {
            if (global.stylethreshold == 2)
                spr_player = spr_pepinoHUD3hp;
            else if (_p1spr == spr_player_hurtidle || _p1spr == spr_player_hurtwalk)
                spr_player = spr_pepinoHUD1hp;
            else if (global.stylethreshold >= 3)
                spr_player = spr_pepinoHUDpanic;
            else if (_p1spr == spr_shotgun_pullout)
                spr_player = spr_pepinoHUDmenacing;
        }
    }
}
else if (_char == "N" || (_char == "P" && !ispeppino))
{
    spr_player = spr_noiseHUD_idle;
    _temp_local_var_18 = _p1spr;
    
    if (_p1spr == _player1.spr_knightpepthunder)
        spr_player = spr_noiseHUD_thunder;
    else if (_p1spr == _player1.spr_knightpepstart)
        spr_player = spr_noiseHUD_knight;
    else if (_p1spr == _player1.spr_bombpepend)
        spr_player = spr_noiseHUD_bomb;
    else if (_p1spr == _player1.spr_bombpepintro)
        spr_player = spr_noiseHUD_panic;
    else if (_p1spr == _player1.spr_bombpeprunabouttoexplode)
        spr_player = spr_noiseHUD_panic;
    else if (_p1spr == _player1.spr_bombpeprun)
        spr_player = spr_noiseHUD_panic;
    else if (_p1spr == _player1.spr_fireass)
        spr_player = spr_noiseHUD_panic;
    else if (_p1spr == spr_player_victory)
        spr_player = spr_noiseHUD_happy;
    else if (_p1spr == spr_player_machroll)
        spr_player = spr_pepinoHUDrolling;
    else if (_p1spr == spr_player_tumble)
        spr_player = spr_pepinoHUDrolling;
    else if (_p1spr == _player1.spr_dive)
        spr_player = spr_noiseHUD_mach2;
    else if (_p1spr == _player1.spr_machslideboost)
        spr_player = spr_noiseHUD_mach2;
    else if (_p1spr == _player1.spr_mach3boost)
        spr_player = spr_noiseHUD_mach3;
    else if (_p1spr == _player1.spr_fireassend)
        spr_player = spr_noiseHUD_hurt;
    
    if (spr_player == spr_noiseHUD_idle && instance_exists(obj_itspizzatime))
        spr_player = spr_noiseHUD_panic;
    
    if (spr_player == spr_noiseHUD_idle && global.combo >= 20)
        spr_player = spr_noiseHUD_menacing;
    
    if (spr_player == spr_noiseHUD_idle)
    {
        switch (_p1state)
        {
            case 47:
                if (sprite_index != _player1.spr_knightpepstart)
                    spr_player = spr_noiseHUD_knight;
                
                break;
            
            case 38:
                spr_player = spr_noiseHUD_knight;
                break;
            
            case 123:
                spr_player = spr_noiseHUD_groundpound;
                break;
            
            case 111:
                if (shake_mag > 0)
                    spr_player = spr_noiseHUD_groundpound;
                
                break;
            
            case 90:
            case 96:
            case 46:
                spr_player = spr_noiseHUD_happy;
                break;
            
            case 103:
            case 61:
            case 122:
            case 108:
            case 91:
            case 97:
            case 75:
            case 99:
            case 79:
            case 80:
            case 84:
            case 81:
            case 82:
            case 83:
                spr_player = spr_noiseHUD_mach1;
                break;
            
            case 58:
            case 104:
            case 37:
            case 42:
            case 76:
                spr_player = spr_noiseHUD_mach2;
                break;
            
            case 121:
                spr_player = spr_noiseHUD_mach3;
                
                if (_p1spr == _player1.spr_crazyrun)
                    spr_player = spr_noiseHUD_crazyrun;
                
                break;
            
            case 107:
            case 64:
            case 51:
                spr_player = spr_noiseHUD_hurt;
                break;
            
            case 88:
                if (_p1spr == spr_player_bossintro || _p1spr == spr_player_idle)
                    spr_player = spr_noiseHUD_hurt;
                else if (_p1spr == spr_player_levelcomplete)
                    spr_player = spr_noiseHUD_happy;
                
                break;
        }
        
        if (spr_player == spr_noiseHUD_idle)
        {
            if (_player1.angry)
                spr_player = spr_noiseHUD_angry;
            else if (_p1spr == _player1.spr_hurtidle || _p1spr == _player1.spr_hurtwalk)
                spr_player = spr_noiseHUD_lowhealth;
            else if (global.panic || global.miniboss)
                spr_player = spr_noiseHUD_panic;
            else if (_p1spr == spr_shotgun_pullout)
                spr_player = spr_noiseHUD_menacing;
        }
    }
}
else if (_char == "V")
{
    spr_speedbarHUD = -4;
    spr_player = spr_playerV_normalHUD;
    
    if ((healthshaketime > 0 && playerhealthup) || _p1spr == spr_playerV_keydoor || _p1state == 90 || _p1state == 46)
        spr_player = spr_playerV_happyHUD;
    else if (_p1state == UnknownEnum.Value_3)
        spr_player = spr_playerV_machHUD;
    else if (healthshaketime > 0 && playerhealthup && _p1state == 107)
        spr_player = spr_playerV_hurtHUD;
    else if (global.panic)
        spr_player = spr_playerV_panicHUD;
    else if (_player1.angry)
        spr_player = spr_playerV_angryHUD;
}
