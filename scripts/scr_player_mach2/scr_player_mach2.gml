function scr_player_mach2()
{
    var _railinst, mortjump, _bump, _playerid, i;
    
    if (windingAnim < 2000)
        windingAnim++;
    
    if (!place_meeting(x, y + 1, obj_railparent))
    {
        hsp = xscale * movespeed;
    }
    else
    {
        _railinst = instance_place(x, y + 1, obj_railparent);
        hsp = (xscale * movespeed) + (_railinst.movespeed * _railinst.dir);
    }
    
    move2 = key_right2 + key_left2;
    move = key_right + key_left;
    crouchslideAnim = 1;
    
    if (!key_jump2 && jumpstop == 0 && vsp < 0.5)
    {
        vsp /= 20;
        jumpstop = 1;
    }
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerN_sidewayspin)
    {
        sprite_index = spr_playerN_sidewayspinend;
        image_index = 0;
    }
    
    if (grounded && vsp > 0)
        jumpstop = 0;
    
    if (sprite_index == spr_player_longjump)
    {
        if (floor(image_index) == (image_number - 1))
            image_index = image_number - 3;
        
        if (grounded)
            sprite_index = spr_mach;
    }
    
    if (sprite_index == spr_mach1 && floor(image_index) == (image_number - 1))
        sprite_index = spr_mach;
    
    if (input_buffer_jump < 8 && grounded && sprite_index != spr_secondjump1 && sprite_index != spr_clownjump && !(move == 1 && xscale == -1) && !(move == -1 && xscale == 1))
    {
        image_index = 0;
        sprite_index = spr_secondjump1;
        scr_soundeffect(40);
        
        if (skateboarding)
            sprite_index = spr_clownjump;
        
        vsp = -11;
    }
    else if (input_buffer_jump < 8 && !grounded && !ispeppino && key_up && character == "P" && noisedoublejump && !skateboarding && sprite_index != spr_clownjump)
    {
        scr_player_do_noisecrusher();
    }
    
    mortjump = 0;
    
    if (key_jump && global.mort == 1 && sprite_index != spr_mortdoublejump && !grounded && !skateboarding)
    {
        state = UnknownEnum.Value_92;
        
        repeat (6)
            create_debris(x, y, spr_feather);
        
        scr_soundeffect(127);
        sprite_index = spr_mortdoublejump;
        image_index = 0;
        grav = 0.25;
        
        with (instance_create(x, y, obj_highjumpcloud2))
            image_xscale = other.xscale;
        
        mort = 1;
        mortjump = 1;
    }
    
    if (grounded && vsp > 0)
    {
        if (machpunchAnim == 0 && sprite_index != spr_mach1 && sprite_index != spr_mach && sprite_index != spr_mach4 && sprite_index != spr_player_machhit)
        {
            if (sprite_index != spr_player_machhit && sprite_index != spr_rollgetup && sprite_index != spr_taunt && sprite_index != spr_player_Sjumpcancelstart)
                sprite_index = spr_mach;
        }
        
        if (machpunchAnim == 1)
        {
            if (punch == 0)
                sprite_index = spr_machpunch1;
            
            if (punch == 1)
                sprite_index = spr_machpunch2;
            
            if (floor(image_index) == 4 && sprite_index == spr_machpunch1)
            {
                punch = 1;
                machpunchAnim = 0;
            }
            
            if (floor(image_index) == 4 && sprite_index == spr_machpunch2)
            {
                punch = 0;
                machpunchAnim = 0;
            }
        }
    }
    
    if (!grounded)
        machpunchAnim = 0;
    
    if (grounded)
    {
        if (movespeed < 12)
        {
            if (scr_slope() && hsp != 0 && movespeed > 8)
                scr_player_addslopemomentum(global.slopedeccelmach, global.slopeaccelmach);
            
            movespeed += 0.1;
        }
        
        if (movespeed >= 12 && skateboarding == 0)
        {
            machhitAnim = 0;
			//mach 3
            state = UnknownEnum.Value_121;
            flash = 1;
            
            if (sprite_index != spr_rollgetup)
                sprite_index = spr_mach4;
            
            particle_set_scale(UnknownEnum.Value_5, xscale, 1);
            create_particle(x, y, UnknownEnum.Value_5, 0);
        }
    }
    
    if (key_jump)
        input_buffer_jump = 0;
    
    if (grounded && (place_meeting(x + sign(hsp), y - 16, obj_solid) || scr_solid_slope(x + sign(hsp), y - 16)) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_metalblock) && place_meeting(x, y + 1, obj_slope))
    {
        wallspeed = movespeed;
        state = UnknownEnum.Value_37;
    }
    
    if (!grounded && (place_meeting(x + sign(hsp), y, obj_climbablewall) || (!global.option_septmoveset && place_meeting(x + sign(hsp), y, obj_solid))) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_metalblock))
    {
        if (movespeed < 1)
            wallspeed = 1;
        else
            wallspeed = movespeed;
        
        state = UnknownEnum.Value_37;
    }
    
    if (!instance_exists(dashcloudid) && grounded)
    {
        with (instance_create(x, y, obj_dashcloud))
        {
            image_xscale = other.xscale;
            other.dashcloudid = id;
        }
    }
    
    if (grounded && floor(image_index) == (image_number - 1) && sprite_index == spr_rollgetup)
        sprite_index = spr_mach;
    
    if (!grounded && sprite_index != spr_secondjump2 && sprite_index != spr_clownjump && sprite_index != spr_clownfall && sprite_index != spr_mach2jump && sprite_index != spr_mach2jump && sprite_index != spr_walljumpstart && sprite_index != spr_taunt && sprite_index != spr_player_Sjumpcancelstart && sprite_index != spr_walljumpend && sprite_index != spr_playerN_sidewayspin && sprite_index != spr_playerN_sidewayspinend)
    {
        sprite_index = spr_secondjump1;
        
        if (skateboarding)
            sprite_index = spr_clownfall;
    }
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_secondjump1)
        sprite_index = spr_secondjump2;
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_walljumpstart)
        sprite_index = spr_walljumpend;
    
    if (!grounded && sprite_index != spr_clownfall && sprite_index == spr_clownjump && floor(image_index) == (image_number - 1))
        sprite_index = spr_clownfall;
    
    if (scr_mach_check_dive() && !place_meeting(x, y, obj_dashpad))
    {
        particle_set_scale(UnknownEnum.Value_5, xscale, 1);
        create_particle(x, y, UnknownEnum.Value_5, 0);
        flash = 0;
        state = UnknownEnum.Value_5;
        vsp = 10;
        
        if (!grounded)
            sprite_index = spr_mach2jump;
        else
            sprite_index = spr_machroll;
        
        if (character == "V")
            sprite_index = spr_playerV_divekickstart;
    }
    
    if (key_attack && !place_meeting(x + xscale, y, obj_solid) && character == "S" && grounded)
    {
        state = UnknownEnum.Value_42;
        movespeed = 0;
    }
    
    if ((grounded || global.option_septmoveset) && (!scr_slope() && (place_meeting(x + hsp, y, obj_solid) || scr_solid_slope(x + hsp, y)) && (!place_meeting(x + hsp, y, obj_destructibles) || character == "V") && !place_meeting(x + hsp, y, obj_climbablewall)))
    {
        if (skateboarding)
        {
            xscale *= -1;
        }
        else
        {
            _bump = ledge_bump((vsp >= 0) ? 32 : 22);
            
            if (_bump)
            {
                state = UnknownEnum.Value_106;
                image_index = 0;
                sprite_index = spr_player_wallsplat;
            }
        }
    }
    
    if ((!key_attack && movespeed >= 8 && move != xscale && grounded && skateboarding == 0) || (character == "S" && move == 0 && grounded))
    {
        image_index = 0;
        state = UnknownEnum.Value_105;
        scr_soundeffect(117);
        sprite_index = spr_machslidestart;
    }
    else if (!key_attack && movespeed < 8 && grounded && vsp > 0 && skateboarding == 0)
    {
        state = UnknownEnum.Value_0;
    }
    
    if (move == -xscale && movespeed >= 8 && grounded && skateboarding == 0)
    {
        scr_soundeffect(114);
        image_index = 0;
        state = UnknownEnum.Value_105;
        sprite_index = spr_machslideboost;
    }
    else if (move == -xscale && movespeed < 8 && grounded && vsp > 0 && skateboarding == 0)
    {
        xscale *= -1;
        movespeed = 6;
    }
    
    if (clowntimer > 0 && skateboarding == 1)
        clowntimer--;
    
    if (clowntimer <= 0 && skateboarding == 1)
    {
        state = UnknownEnum.Value_0;
        instance_create(x, y, obj_genericpoofeffect);
    }
    
    if (key_slap2 && character == "V")
    {
        vsp = -5;
        state = UnknownEnum.Value_1;
        image_index = 0;
        sprite_index = spr_playerV_airrevolver;
        image_index = 0;
        
        with (instance_create(x + (xscale * 20), y + 20, obj_shotgunbullet))
        {
            is_solid = 0;
            image_xscale = other.xscale;
        }
        
        scr_soundeffect(54);
    }
    
    if (key_shoot2 && character == "V" && !instance_exists(dynamite_inst))
    {
        vsp = -5;
        state = UnknownEnum.Value_2;
        image_index = 0;
        sprite_index = spr_playerV_dynamitethrow;
        
        with (instance_create(x, y, obj_dynamite))
        {
            image_xscale = other.xscale;
            other.dynamite_inst = id;
            playerid = other.id;
            movespeed = other.movespeed + 4;
            vsp = -6;
        }
    }
    
    if (move == xscale && !key_attack && grounded && skateboarding == 0)
        state = UnknownEnum.Value_0;
    
    if (sprite_index == spr_rollgetup || sprite_index == spr_player_longjump)
        image_speed = 0.4;
    else
        image_speed = abs(movespeed) / 15;
    
    if (!global.option_septmoveset && key_slap2 && !key_up && !chainsawcutscene)
    {
        if ((character == "P" || character == "N") && !shoot)
        {
            if (global.attackstyle == 0 || global.attackstyle == 3)
            {
                suplexmove = 1;
                suplexdashsnd = audio_play_sound(sfx_suplexdash, 1, false);
                sfx_gain(suplexdashsnd);
                state = UnknownEnum.Value_42;
                image_index = 0;
                flash = 1;
                
                if (global.attackstyle == 0)
                {
                    if (!shotgunAnim)
                        sprite_index = spr_suplexdash;
                    else
                        sprite_index = spr_shotgunsuplexdash;
                }
            }
            
            if (global.attackstyle == 2 || global.kungfu)
            {
                randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, 580, 579, 578, spr_punch]);
                image_index = 0;
                state = UnknownEnum.Value_43;
            }
            else if (global.attackstyle == 3)
            {
                particle_set_scale(UnknownEnum.Value_2, xscale, 1);
                create_particle(x, y, UnknownEnum.Value_2, 0);
                movespeed = 2;
            }
            else
            {
                particle_set_scale(UnknownEnum.Value_2, xscale, 1);
                create_particle(x, y, UnknownEnum.Value_2, 0);
            }
            
            scr_shoot_farmerprojectile();
            
            with (instance_create(x, y, obj_superdashcloud))
                image_xscale = other.xscale;
        }
    }
    else if (!global.option_septmoveset && (key_slap2 && (shoot || shotgunAnim || chainsawcutscene) && (!key_up || global.option_septmoveset)))
    {
        if (shoot)
        {
            sprite_index = spr_pistolshot;
            image_index = 0;
            state = UnknownEnum.Value_42;
            shoot = 1;
            flash = 1;
        }
        
        if (shotgunAnim)
        {
            sprite_index = spr_shotgunshoot;
            image_index = 0;
            state = UnknownEnum.Value_42;
            shoot = 1;
            flash = 1;
        }
        
        if (chainsawcutscene)
        {
            sprite_index = spr_chainsawdashstart;
            image_index = 0;
            state = UnknownEnum.Value_41;
        }
        
        if (!instance_exists(parry_inst) && flash == 1)
        {
            parry_inst = instance_create(x, y, obj_parryhitbox);
            _playerid = 1;
            
            if (object_index == obj_player2)
                _playerid = 2;
            
            with (parry_inst)
            {
                player_id = _playerid;
                image_xscale = other.xscale;
            }
        }
        
        with (obj_camera)
        {
            shake_mag = 3;
            shake_mag_acc = 3 / room_speed;
        }
        
        if (!instance_exists(parry_inst) && flash == 1)
        {
            parry_inst = instance_create(x, y, obj_parryhitbox);
            _playerid = 1;
            
            if (object_index == obj_player2)
                _playerid = 2;
            
            with (parry_inst)
            {
                player_id = _playerid;
                image_xscale = other.xscale;
            }
        }
        
        if (shoot)
        {
            if (ispeppino)
            {
                with (instance_create(x + (xscale * 20), y, obj_shotgunbullet))
                {
                    pistol = 1;
                    sprite_index = spr_peppinobullet;
                    image_xscale = other.xscale;
                }
            }
            else
            {
                with (instance_create(x, y, obj_playerbomb))
                {
                    kick = 1;
                    movespeed = 15;
                    image_xscale = other.xscale;
                }
            }
        }
        
        if (shotgunAnim)
        {
            i = 0;
            
            while (abs(i) <= 5)
            {
                with (instance_create(x + (xscale * 30), y + 60, obj_shotgunbullet))
                {
                    image_xscale = other.xscale;
                    sprite_index = sprite10391;
                    spdh = -10;
                    spd = i;
                    shotgun = 1;
                }
                
                i = (-2 * i) + 5;
            }
        }
    }
    
    if (!global.option_septmoveset && grounded)
        scr_douppercut();
    
    scr_dotaunt();
    
    if (skateboarding && sprite_index != spr_clownjump && grounded)
        sprite_index = spr_clown;
    
    if (mortjump)
        sprite_index = spr_player_mortjumpstart;
    
    if (global.attackstyle == 2 && key_slap2)
    {
        randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, 580, 579, 578, spr_punch]);
        image_index = 0;
        state = UnknownEnum.Value_43;
    }
}
