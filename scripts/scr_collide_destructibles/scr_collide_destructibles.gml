function scr_collision_destructibles()
{
    var i, _obj_player, vy, _inst, j, _max, _destroyed;
    
    for (i = 0; i < 2; i++)
    {
        _obj_player = asset_get_index(concat("obj_player", i + 1));
        
        with (_obj_player)
        {
            if ((state == UnknownEnum.Value_92 && sprite_index == spr_playerN_noisebombspinjump) || state == UnknownEnum.Value_198 || state == UnknownEnum.Value_305 || state == UnknownEnum.Value_306 || (state == UnknownEnum.Value_58 && pogochargeactive == 1))
            {
                with (instance_place(x + xscale, y, obj_destructibles))
                {
                    GamepadSetVibration(0, 0.8, 0.5);
                    instance_destroy();
                }
                
                with (instance_place(x + hsp + xscale, y, obj_destructibles))
                {
                    GamepadSetVibration(0, 0.8, 0.5);
                    instance_destroy();
                }
                
                with (instance_place(x, y + vsp + 1, obj_destructibles))
                {
                    GamepadSetVibration(0, 0.8, 0.5);
                    instance_destroy();
                }
                
                with (instance_place(x, (y + vsp) - 1, obj_destructibles))
                {
                    GamepadSetVibration(0, 0.8, 0.5);
                    instance_destroy();
                }
                
                with (instance_place(x, y + 1, obj_destructibles))
                {
                    GamepadSetVibration(0, 0.8, 0.5);
                    instance_destroy();
                }
                
                with (instance_place(x, y - 1, obj_destructibles))
                {
                    GamepadSetVibration(0, 0.8, 0.5);
                    instance_destroy();
                }
            }
            
            if (state == UnknownEnum.Value_5)
            {
                with (instance_place(x + xscale, y, obj_rollblock))
                    instance_destroy();
            }
            
            if (state == UnknownEnum.Value_121 && sprite_index == spr_player_fightball)
            {
                with (instance_place(x + xscale, y, obj_fightballblock))
                    instance_destroy();
            }
            
            if (state == UnknownEnum.Value_193 && place_meeting(x + hsp, y, obj_gustavodestroyable))
            {
                with (instance_place(x + hsp, y, obj_gustavodestroyable))
                {
                    GamepadSetVibration(0, 0.8, 0.5);
                    instance_destroy();
                }
            }
            
            if (state == UnknownEnum.Value_80 || state == UnknownEnum.Value_193 || state == UnknownEnum.Value_43 || state == UnknownEnum.Value_21 || state == UnknownEnum.Value_53 || state == UnknownEnum.Value_184 || state == UnknownEnum.Value_70 || state == UnknownEnum.Value_124 || state == UnknownEnum.Value_94 || state == UnknownEnum.Value_20 || sprite_index == spr_barrelroll || state == UnknownEnum.Value_41 || state == UnknownEnum.Value_121 || state == UnknownEnum.Value_306 || state == UnknownEnum.Value_47 || state == UnknownEnum.Value_306 || state == UnknownEnum.Value_65 || state == UnknownEnum.Value_38 || state == UnknownEnum.Value_5 || state == UnknownEnum.Value_19 || state == UnknownEnum.Value_153)
            {
                if (place_meeting(x + hsp, y, obj_destructibles))
                {
                    if (character != "V")
                    {
                        with (instance_place(x + hsp, y, obj_destructibles))
                        {
                            GamepadSetVibration(0, 0.8, 0.5);
                            instance_destroy();
                        }
                        
                        if (state == UnknownEnum.Value_104)
                            machpunchAnim = 1;
                    }
                }
            }
            
            if (state == UnknownEnum.Value_107 && thrown == 1)
            {
                if (place_meeting(x - hsp, y, obj_destructibles))
                {
                    with (instance_place(x - hsp, y, obj_destructibles))
                    {
                        GamepadSetVibration(0, 0.8, 0.5);
                        instance_destroy();
                    }
                }
            }
            
            if ((state == UnknownEnum.Value_47 || state == UnknownEnum.Value_10 || state == UnknownEnum.Value_165 || state == UnknownEnum.Value_76 || state == UnknownEnum.Value_19 || (state == UnknownEnum.Value_54 && bombup_dir == 1)) && vsp > 0)
            {
                if (place_meeting(x, y + 1, obj_destructibles))
                {
                    with (instance_place(x, y + 1, obj_destructibles))
                    {
                        GamepadSetVibration(0, 0.8, 0.5);
                        instance_destroy();
                    }
                    
                    if (state == UnknownEnum.Value_10)
                    {
                        with (instance_place(x, y + 1, obj_tntblock))
                        {
                            GamepadSetVibration(0, 0.8, 0.5);
                            instance_destroy();
                        }
                        
                        vsp = -11;
                        jumpstop = 0;
                    }
                }
            }
            
            with (instance_place(x, y + 1, obj_destructibleplatform))
            {
                falling = 1;
                
                if (falling == 1)
                    image_speed = 0.35;
            }
            
            if (vsp <= 0.5 && (state == UnknownEnum.Value_92 || state == UnknownEnum.Value_58 || (state == UnknownEnum.Value_54 && bombup_dir == -1) || state == UnknownEnum.Value_80 || state == UnknownEnum.Value_37 || state == UnknownEnum.Value_9 || state == UnknownEnum.Value_306 || state == UnknownEnum.Value_305 || state == UnknownEnum.Value_97 || state == UnknownEnum.Value_22 || state == UnknownEnum.Value_121 || (state == UnknownEnum.Value_80 && (sprite_index == spr_player_breakdanceuppercut || sprite_index == spr_player_breakdanceuppercutend))))
            {
                vy = -1;
                
                if (state == UnknownEnum.Value_305 || (state == UnknownEnum.Value_80 && (sprite_index == spr_player_breakdanceuppercut || sprite_index == spr_player_breakdanceuppercutend)))
                    vy = vsp;
                
                if (place_meeting(x, y + vy, obj_destructibles))
                {
                    with (instance_place(x, y + vy, obj_destructibles))
                    {
                        GamepadSetVibration(0, 0.6, 0.5);
                        instance_destroy();
                        
                        with (other)
                        {
                            if (state != UnknownEnum.Value_97 && state != UnknownEnum.Value_80 && state != UnknownEnum.Value_37)
                                vsp = 0;
                            
                            if (state == UnknownEnum.Value_97)
                                vsp = -11;
                        }
                    }
                }
            }
            
            if (vsp >= 0 && (state == UnknownEnum.Value_108 || state == UnknownEnum.Value_111 || state == UnknownEnum.Value_305 || (state == UnknownEnum.Value_165 && vsp >= 10)))
            {
                if (place_meeting(x, y + vsp + 2, obj_destructibles))
                {
                    with (instance_place(x, y + vsp + 2, obj_destructibles))
                    {
                        with (_obj_player)
                        {
                            if (place_meeting(x, y + vsp + 2, obj_bigdestructibles))
                            {
                                _inst = instance_place(x, y + vsp + 2, obj_bigdestructibles);
                                
                                if (instance_exists(_inst))
                                {
                                    j = 0;
                                    _max = 256;
                                    
                                    while (!place_meeting(x, y + 1, obj_bigdestructibles))
                                    {
                                        y += 1;
                                        j++;
                                        
                                        if (j >= _max)
                                            break;
                                        else
                                            continue;
                                    }
                                }
                                
                                if (freefallsmash <= 10 && state != UnknownEnum.Value_165)
                                {
                                    if (shotgunAnim == 0)
                                        sprite_index = spr_bodyslamland;
                                    else
                                        sprite_index = spr_shotgunjump2;
                                    
                                    state = UnknownEnum.Value_111;
                                    image_index = 0;
                                }
                            }
                        }
                        
                        instance_destroy();
                    }
                }
            }
            
            if (state == UnknownEnum.Value_108 || state == UnknownEnum.Value_111 || state == UnknownEnum.Value_165)
            {
                if (place_meeting(x, y + 1, obj_metalblock) && (freefallsmash > 10 || state == UnknownEnum.Value_165))
                {
                    with (instance_place(x, y + 1, obj_metalblock))
                        instance_destroy();
                }
            }
            
            if (state == UnknownEnum.Value_102 || state == UnknownEnum.Value_65 || state == UnknownEnum.Value_104 || state == UnknownEnum.Value_42 || state == UnknownEnum.Value_80)
            {
                with (obj_destructibles)
                {
                    if (place_meeting(x - _obj_player.hsp, y, _obj_player))
                    {
                        _destroyed = 0;
                        
                        with (_obj_player)
                        {
                            if (place_meeting(x + hsp, y, obj_bigdestructibles) && state != UnknownEnum.Value_102 && state != UnknownEnum.Value_104 && state != UnknownEnum.Value_65)
                            {
                                state = UnknownEnum.Value_6;
                                sprite_index = spr_player_lungehit;
                                image_index = 0;
                                instance_destroy(other);
                                _destroyed = 1;
                            }
                            else if (other.object_index != obj_bigdestructibles)
                            {
                                instance_destroy(other);
                                _destroyed = 1;
                            }
                            
                            if (_destroyed && state == UnknownEnum.Value_43)
                                hit_connected = 1;
                        }
                    }
                }
            }
        }
    }
}
