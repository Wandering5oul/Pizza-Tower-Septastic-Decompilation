function state_player_jump()
{
    var _playerid;
    
    landAnim = 1;
    
    if (!momemtum)
        hsp = move * movespeed;
    else
        hsp = xscale * movespeed;
    
    if (key_taunt2)
    {
        input_finisher_buffer = 60;
        input_attack_buffer = 0;
        input_up_buffer = 0;
        input_down_buffer = 0;
    }
    
    if (dir != xscale)
    {
        dir = xscale;
        movespeed = 2;
        facehurt = 0;
    }
    
    if (move != xscale)
        movespeed = 2;
    
    move = key_left + key_right;
    
    if (movespeed == 0)
        momemtum = 0;
    
    if (scr_solid(x + hsp, y))
    {
        movespeed = 0;
        mach2 = 0;
    }
    
    if (move != 0)
    {
        xscale = move;
        
        if (movespeed < 8)
            movespeed += 0.5;
        else if (floor(movespeed) == 8)
            movespeed = 6;
        
        if (scr_solid(x + xscale, y) && move == xscale)
            movespeed = 0;
    }
    else
    {
        movespeed = 0;
    }
    
    if (movespeed > 8)
        movespeed -= 0.1;
    
    if (ladderbuffer > 0)
        ladderbuffer--;
    
    if (!jumpstop)
    {
        if (!key_jump2 && vsp < 0.5 && !stompAnim)
        {
            vsp /= 20;
            jumpstop = 1;
        }
        else if (scr_solid(x, y - 1) && !jumpAnim)
        {
            vsp = grav;
            jumpstop = 1;
        }
    }
    
    if (character == "N")
    {
        if (key_jump && wallclingcooldown == 10)
        {
            if (place_meeting(x + xscale, y, obj_solid))
            {
                scr_soundeffect(69);
                sprite_index = spr_playerN_wallclingstart;
                image_index = 0;
                state = UnknownEnum.Value_109;
                xscale *= -1;
                vsp = 0;
                doublejump = 0;
            }
            else if (!doublejump && sprite_index != spr_freefall && sprite_index != spr_facestomp)
            {
                scr_soundeffect(127);
                sprite_index = spr_playerN_doublejump;
                image_index = 0;
                jumpstop = 0;
                vsp = -9;
                doublejump = 1;
                particle_set_scale(UnknownEnum.Value_4, xscale, 1);
                create_particle(x, y, UnknownEnum.Value_4, 0);
            }
        }
    }
    
    if (global.mort && (sprite_index == spr_mortdoublejump || sprite_index == spr_mortdoublejumpstart))
    {
        if (vsp > 6)
            vsp = 6;
        
        if (!key_jump2)
        {
            grav = 0.5;
            sprite_index = spr_fall;
        }
    }
    
    if (key_jump)
    {
        if (global.mort && sprite_index != spr_mortdoublejump)
        {
            repeat (6)
                create_debris(x, y, spr_feather);
            
            scr_soundeffect(127);
            sprite_index = spr_mortdoublejump;
            image_index = 0;
            jumpstop = 0;
            grav = 0.25;
            mort = 1;
        }
    }
    
    if (grounded)
    {
        if (input_buffer_jump < 8 && !key_down && !key_attack && vsp > 0 && !(sprite_index == spr_facestomp || sprite_index == spr_freefall))
        {
            scr_soundeffect(40);
            stompAnim = 0;
            vsp = -11;
            state = UnknownEnum.Value_92;
            jumpAnim = 1;
            jumpstop = 0;
            freefallstart = 0;
            
            if (sprite_index != spr_shotgunshoot)
            {
                sprite_index = spr_jump;
                
                if (shotgunAnim)
                    sprite_index = spr_shotgunjump;
                
                image_index = 0;
            }
            
            particle_set_scale(UnknownEnum.Value_4, xscale, 1);
            create_particle(x, y, UnknownEnum.Value_4, 0);
        }
        
        if (vsp > 0 && !key_attack)
        {
            scr_soundeffect(69);
            
            if (key_attack || sprite_index == spr_shotgunshoot)
                landAnim = 0;
            
            if (sprite_index == spr_mortdoublejump || sprite_index == spr_mortdoublejumpstart)
                sprite_index = spr_player_mortland;
            
            if (sprite_index != spr_shotgunshoot)
                image_index = 0;
            
            input_buffer_secondjump = 0;
            state = UnknownEnum.Value_0;
            jumpAnim = 1;
            jumpstop = 0;
            freefallstart = 0;
            create_particle(x, y, UnknownEnum.Value_12, 0);
        }
    }
    else if (character == "P" && !ispeppino && key_up && noisedoublejump && input_buffer_jump < 8 && !key_down && !key_attack)
    {
        freefallstart = 0;
        railmomentum = 0;
        
        if (place_meeting(x, y + 1, obj_railparent))
            railmomentum = 1;
        
        scr_player_do_noisecrusher();
    }
    
    if (key_jump)
        input_buffer_jump = 0;
    
    if (vsp > 5 && sprite_index != spr_mortdoublejump)
        fallinganimation++;
    
    if (fallinganimation >= 40 && fallinganimation < 80)
        sprite_index = spr_facestomp;
    else if (fallinganimation >= 80)
        sprite_index = spr_freefall;
    
    if (!stompAnim)
    {
        if (!jumpAnim)
        {
            switch (sprite_index)
            {
                case spr_mortdoublejumpstart:
                    sprite_index = spr_mortdoublejump;
                    break;
                
                case spr_playerN_doublejump:
                    sprite_index = spr_playerN_doublejumpfall;
                    break;
                
                case spr_airdash1:
                    sprite_index = spr_airdash2;
                    break;
                
                case spr_shotgunjump:
                    sprite_index = spr_shotgunfall;
                    break;
                
                case spr_playerV_superjump:
                    sprite_index = spr_playerV_fall;
                    break;
                
                case spr_jump:
                    sprite_index = spr_fall;
                    break;
                
                case spr_suplexcancel:
                    sprite_index = spr_fall;
                    break;
                
                case spr_player_backflip:
                    sprite_index = spr_fall;
                    break;
                
                case spr_player_Sjumpstart:
                    sprite_index = spr_player_Sjump;
                    break;
                
                case spr_player_shotgunjump1:
                    sprite_index = spr_player_shotgunjump2;
                    break;
                
                case spr_shotgun_shootair:
                    sprite_index = spr_shotgunfall;
                    break;
                
                case spr_shotgunshoot:
                    sprite_index = spr_shotgunfall;
                    break;
                
                case spr_stompprep:
                    sprite_index = spr_stomp;
                    break;
            }
        }
    }
    else if (sprite_index == spr_stompprep && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_stomp;
    }
    
    if (scr_check_groundpound() && !global.kungfu)
    {
        if (!shotgunAnim)
        {
            sprite_index = spr_bodyslamstart;
            image_index = 0;
            state = UnknownEnum.Value_122;
            scr_soundeffect(209);
            vsp = (character == "P") ? -5 : -7;
        }
        else
        {
            scr_soundeffect(54);
            sprite_index = spr_shotgunjump1;
            image_index = 0;
            state = UnknownEnum.Value_122;
            scr_soundeffect(209);
            vsp = -11;
            
            with (instance_create(x + (xscale * 30), y + 60, obj_shotgunbullet))
            {
                image_xscale = other.xscale;
                sprite_index = sprite10391;
                spdh = -10;
                spd = 0;
                shotgun = 1;
            }
            
            with (instance_create(x + (xscale * 30), y + 60, obj_shotgunbullet))
            {
                image_xscale = other.xscale;
                sprite_index = sprite10391;
                spdh = -10;
                spd = 5;
                shotgun = 1;
            }
            
            with (instance_create(x + (xscale * 30), y + 60, obj_shotgunbullet))
            {
                image_xscale = other.xscale;
                sprite_index = sprite10391;
                spdh = -10;
                spd = -5;
                shotgun = 1;
            }
        }
    }
    
    if (sprite_index == spr_player_suplexcancel)
        image_speed = 0.4;
    else
        image_speed = 0.35;
    
    if (grounded && (sprite_index == spr_facestomp || sprite_index == spr_freefall))
    {
        scr_soundeffect(55);
        image_index = 0;
        sprite_index = spr_bodyslamland;
        state = UnknownEnum.Value_111;
        
        with (obj_baddie)
        {
            if (point_in_camera(x, y, view_camera[0]))
            {
                vsp = -7;
                hsp = 0;
            }
        }
        
        with (obj_camera)
        {
            shake_mag = 10;
            shake_mag_acc = 30 / room_speed;
        }
    }
    
    if (key_slap2 && (character == "P" || character == "N") && sprite_index != spr_suplexbump && !shoot && !chainsawcutscene)
    {
        if (global.attackstyle == 0 || global.attackstyle == 3)
        {
            if (global.attackstyle == 0)
            {
                if (!shotgunAnim)
                    sprite_index = spr_suplexdash;
                else
                    sprite_index = spr_shotgunsuplexdash;
            }
            
            image_index = 0;
            flash = 1;
            suplexmove = 1;
            suplexdashsnd = audio_play_sound(sfx_suplexdash, 1, false);
            sfx_gain(suplexdashsnd);
            state = UnknownEnum.Value_42;
            movespeed = 5;
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
            image_index = 0;
        }
        else
        {
            particle_set_scale(UnknownEnum.Value_2, xscale, 1);
            create_particle(x, y, UnknownEnum.Value_2, 0);
        }
    }
    else if (key_slap2 && sprite_index != spr_suplexbump && chainsawcutscene)
    {
        sprite_index = spr_chainsawdashstart;
        image_index = 0;
        state = UnknownEnum.Value_41;
    }
    
    if (key_shoot2 && shotgunAnim)
    {
        scr_soundeffect(54);
        
        with (instance_create(x, y, obj_pistoleffect))
            image_xscale = other.xscale;
        
        sprite_index = spr_shotgunshoot;
        jumpAnim = 1;
        image_index = 0;
        
        with (instance_create(x + (xscale * 20), y + 20, obj_shotgunbullet))
        {
            image_xscale = other.xscale;
            shotgun = 1;
        }
        
        with (instance_create(x + (xscale * 20), y + 20, obj_shotgunbullet))
        {
            image_xscale = other.xscale;
            spdh = 4;
            shotgun = 1;
        }
        
        with (instance_create(x + (xscale * 20), y + 20, obj_shotgunbullet))
        {
            image_xscale = other.xscale;
            spdh = -4;
            shotgun = 1;
        }
    }
    
    if (key_slap2 && shoot)
    {
        if (!shotgunAnim)
        {
            flash = 1;
            
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
            
            if (global.mort)
            {
                with (instance_create(x + (xscale * 20), y, obj_shotgunbullet))
                {
                    image_xscale = other.xscale;
                    sprite_index = spr_mortprojectile;
                }
                
                sprite_index = spr_mortthrow;
                image_index = 0;
                state = UnknownEnum.Value_72;
                mort = 1;
                
                with (obj_camera)
                {
                    shake_mag = 3;
                    shake_mag_acc = 3 / room_speed;
                }
            }
            else if (character != "V" && shoot)
            {
                sprite_index = spr_pistolshot;
                image_index = 0;
                movespeed = 5;
                state = UnknownEnum.Value_42;
                shoot = 1;
                
                with (obj_camera)
                {
                    shake_mag = 3;
                    shake_mag = 3 / room_speed;
                }
                
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
            else if (character != "V")
            {
            }
        }
    }
    
    switch (character)
    {
        case "P":
            if (key_attack && grounded && fallinganimation < 40)
            {
                jumpAnim = 1;
                
                if (pizzapepper == 0)
                {
                    sprite_index = spr_mach1;
                    image_index = 0;
                    movespeed = 6;
                    state = UnknownEnum.Value_103;
                }
                else
                {
                    sprite_index = spr_crazyrun;
                    movespeed = 20;
                    state = UnknownEnum.Value_121;
                }
            }
            
            break;
        
        case "V":
            if (key_attack && grounded && fallinganimation < 40)
            {
                jumpAnim = 1;
                
                if (pizzapepper == 0)
                {
                    sprite_index = spr_mach1;
                    image_index = 0;
                    movespeed = 6;
                    state = UnknownEnum.Value_103;
                }
                else
                {
                    sprite_index = spr_crazyrun;
                    movespeed = 20;
                    state = UnknownEnum.Value_121;
                }
            }
            
            if (key_shoot2 && !instance_exists(dynamite_inst))
            {
                sprite_index = spr_playerV_dynamitethrow;
                image_index = 0;
                
                if (move == 0)
                    movespeed = 0;
                
                state = UnknownEnum.Value_2;
                
                with (instance_create(x, y, obj_dynamite))
                {
                    image_xscale = other.xscale;
                    other.dynamite_inst = id;
                    playerid = other.id;
                    movespeed = 6;
                    vsp = -6;
                }
            }
            
            if (sprite_index == spr_playerV_superjump && floor(image_index) == (image_number - 1))
                create_particle(x, y + 25, UnknownEnum.Value_7, 0);
            
            if (key_slap2)
            {
                sprite_index = spr_playerV_airrevolver;
                image_index = 0;
                vsp = -5;
                state = UnknownEnum.Value_1;
                
                with (instance_create(x + (xscale * 20), y + 20, obj_shotgunbullet))
                {
                    is_solid = 0;
                    image_xscale = other.xscale;
                }
                
                scr_soundeffect(54);
            }
            
            break;
        
        case "N":
            if (key_attack2 && (pogochargeactive || pizzapepper > 0))
            {
                scr_soundeffect(61);
                
                if (!key_up)
                    sprite_index = spr_playerN_jetpackstart;
                else
                    sprite_index = spr_superjumpprep;
                
                image_index = 0;
                hsp = 0;
                vsp = 0;
                state = UnknownEnum.Value_99;
            }
            
            if (key_attack && !pogochargeactive && !key_slap2 && pizzapepper == 0)
            {
                sprite_index = spr_playerN_pogostart;
                image_index = 0;
                state = UnknownEnum.Value_58;
            }
            
            break;
    }
    
    if (!key_attack || move != xscale)
        mach2 = 0;
    
    if (floor(image_index) == (image_number - 1))
        jumpAnim = 0;
    
    scr_dotaunt();
    
    if (sprite_index == spr_shotgunshoot)
    {
        landAnim = 0;
        machslideAnim = 0;
        image_speed = 0.45;
        
        if (image_index > (image_number - 1))
            sprite_index = spr_shotgunfall;
    }
}

function state_pepperman_jump()
{
    pepperman_grab_reset();
    move = key_left + key_right;
    
    if (move != 0 && move == sign(xscale) && movespeed < pepperman_maxhsp_normal)
        movespeed += pepperman_accel_air;
    else if (move != 0 && move != sign(xscale) && movespeed > 0)
        movespeed -= pepperman_deccel_air;
    else if (move == 0)
        movespeed -= pepperman_deccel_air;
    
    if (floor(movespeed) == pepperman_maxhsp_normal)
        movespeed = pepperman_maxhsp_normal;
    
    if (movespeed > pepperman_maxhsp_normal)
        movespeed -= 0.3;
    else if (movespeed < 0)
        movespeed = 0;
    
    if (move != 0 && movespeed == 0)
        xscale = move;
    
    hsp = xscale * movespeed;
    
    if (sprite_index == spr_jump && floor(image_index) == (image_number - 1))
        sprite_index = spr_fall;
    
    if (!key_jump2 && jumpstop == 0 && vsp < 0.5)
    {
        vsp /= 20;
        jumpstop = 1;
    }
    
    if (grounded && vsp > 0)
    {
        state = UnknownEnum.Value_0;
        instance_create(x, y - 5, obj_landcloud);
    }
    
    if (scr_check_groundpound() && !grounded)
    {
        state = UnknownEnum.Value_108;
        freefallsmash = 12;
        vsp = 14;
        sprite_index = spr_bodyslamfall;
    }
    
    if (key_attack && (!place_meeting(x + xscale, y, obj_solid) || place_meeting(x + xscale, y, obj_destructibles)) && pepperman_grabID == -4 && sprite_index != spr_pepperman_throw)
    {
        if (move != 0)
            xscale = move;
        
        state = UnknownEnum.Value_153;
        sprite_index = spr_pepperman_shoulderstart;
        image_index = 0;
        scr_soundeffect(73);
    }
    
    if (sprite_index == spr_pepperman_throw && floor(image_index) == (image_number - 1))
        sprite_index = spr_pepperman_fall;
    
    if (key_jump)
        input_buffer_jump = 0;
    
    if (ladderbuffer > 0)
        ladderbuffer--;
    
    scr_dotaunt();
}

function scr_player_jump()
{
    if (character != "M")
        state_player_jump();
    else
        state_pepperman_jump();
}
