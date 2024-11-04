function scr_player_mach1()
{
    var _railinst, _playerid, i;
    
    image_speed = 0.5;
    landAnim = 0;
    machhitAnim = 0;
    crouchslideAnim = 1;
    dir = xscale;
    move = key_left + key_right;
    
    if (scr_solid(x + xscale, y) && (!place_meeting(x + xscale, y, obj_slope) || scr_solid_slope(x + sign(hsp), y)))
    {
        mach2 = 0;
        state = UnknownEnum.Value_0;
        movespeed = 0;
    }
    
    if (!place_meeting(x, y + 1, obj_railparent))
    {
        hsp = xscale * movespeed;
    }
    else
    {
        _railinst = instance_place(x, y + 1, obj_railparent);
        hsp = (xscale * movespeed) + (_railinst.movespeed * _railinst.dir);
    }
    
    if (xscale != move && move != 0)
    {
        sprite_index = spr_mach1;
        image_index = 0;
        momemtum = 0;
        mach2 = 0;
        movespeed = 6;
        xscale = move;
    }
    
    if (grounded)
    {
        if (movespeed <= 8)
            movespeed += 0.075;
        
        if (movespeed >= 8)
        {
            state = UnknownEnum.Value_104;
            particle_set_scale(UnknownEnum.Value_5, xscale, 1);
            create_particle(x, y, UnknownEnum.Value_5, 0);
        }
        
        if (vsp > 0)
            jumpstop = 0;
        
        if (!instance_exists(dashcloudid))
        {
            with (instance_create(x, y, obj_dashcloud))
            {
                image_xscale = other.xscale;
                other.dashcloudid = id;
            }
        }
        
        if (sprite_index != spr_mach1 && vsp > 0)
        {
            sprite_index = spr_mach1;
            image_index = 0;
        }
        
        if (key_jump)
        {
            scr_soundeffect(40);
            sprite_index = spr_airdash1;
            image_index = 0;
            dir = xscale;
            momemtum = 1;
            vsp = -11;
            jumpAnim = 1;
        }
    }
    else if (sprite_index != spr_airdash1)
    {
        sprite_index = spr_airdash2;
    }
    
    if (sprite_index == spr_airdash1 && floor(image_index) == (image_number - 1))
        sprite_index = spr_airdash2;
    
    if (!key_attack)
    {
        state = UnknownEnum.Value_0;
        image_index = 0;
    }
    
    if (!key_jump2 && !jumpstop && vsp < 0.5)
    {
        vsp /= 20;
        jumpstop = 1;
    }
    
    if (place_meeting(x + xscale, y, obj_solid) && !place_meeting(x + sign(hsp), y, obj_slope))
    {
        movespeed = 0;
        state = UnknownEnum.Value_0;
    }
    
    switch (character)
    {
        case "V":
            if (key_slap2)
            {
                scr_soundeffect(54);
                sprite_index = spr_playerV_airrevolver;
                image_index = 0;
                vsp = -5;
                state = UnknownEnum.Value_1;
                
                with (instance_create(x + (xscale * 20), y + 20, obj_shotgunbullet))
                {
                    is_solid = 0;
                    image_xscale = other.xscale;
                }
            }
            
            if (key_shoot2 && !instance_exists(dynamite_inst))
            {
                image_index = 0;
                sprite_index = spr_playerV_dynamitethrow;
                vsp = -5;
                state = UnknownEnum.Value_2;
                
                with (instance_create(x, y, obj_dynamite))
                {
                    image_xscale = other.xscale;
                    movespeed = other.movespeed + 4;
                    vsp = -6;
                    other.dynamite_inst = id;
                    playerid = other.id;
                }
            }
            
            break;
    }
    
    if (scr_check_groundpound() && !grounded)
    {
        if (!shotgunAnim)
        {
            sprite_index = spr_bodyslamstart;
            image_index = 0;
            state = UnknownEnum.Value_122;
            scr_soundeffect(209);
            vsp = -5;
        }
        else
        {
            sprite_index = spr_player_shotgunjump1;
            image_index = 0;
            state = UnknownEnum.Value_122;
            scr_soundeffect(209);
            vsp = -5;
            
            with (instance_create(x + (xscale * 30), y + 60, obj_shotgunbullet))
            {
                sprite_index = sprite10391;
                spdh = -10;
                spd = 0;
            }
            
            with (instance_create(x + (xscale * 30), y + 60, obj_shotgunbullet))
            {
                sprite_index = sprite10391;
                spdh = -10;
                spd = 5;
            }
            
            with (instance_create(x + (xscale * 30), y + 60, obj_shotgunbullet))
            {
                sprite_index = sprite10391;
                spdh = -10;
                spd = -5;
            }
        }
    }
    
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
}
