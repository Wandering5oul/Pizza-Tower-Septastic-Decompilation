function state_player_normal()
{
    var _railinst, _playerid, i;
    
    mach2 = 0;
    move = key_left + key_right;
    skateboarding = 0;
    momemtum = 0;
    jumpstop = 0;
    
    if (dir != xscale)
    {
        dir = xscale;
        movespeed = 2;
        facehurt = 0;
    }
    
    if (key_taunt2)
    {
        input_finisher_buffer = 60;
        input_attack_buffer = 0;
        input_up_buffer = 0;
        input_down_buffer = 0;
    }
    
    if (!place_meeting(x, y + 1, obj_railparent))
    {
        hsp = move * movespeed;
    }
    else
    {
        _railinst = instance_place(x, y + 1, obj_railparent);
        hsp = (move * movespeed) + (_railinst.movespeed * _railinst.dir);
    }
    
    if (move != 0)
    {
        xscale = move;
        
        if (movespeed < 8)
            movespeed += 0.5;
        else if (floor(movespeed) == 8)
            movespeed = 6;
        
        if (movespeed < 3 && move != 0)
            image_speed = 0.35;
        else if (movespeed > 3 && movespeed < 6)
            image_speed = 0.45;
        else
            image_speed = 0.6;
        
        if (!machslideAnim && !landAnim && !shotgunAnim)
        {
            machslideAnim = 0;
            idle = 0;
            facehurt = 0;
            
            if (shoot)
                sprite_index = spr_pistolwalk;
            else if (mort)
                sprite_index = spr_player_mortwalk;
            else if (global.minutes == 0 && global.seconds == 0)
                sprite_index = spr_hurtwalk;
            else if (global.stylethreshold == 2)
                sprite_index = spr_3hpwalk;
            else if (global.stylethreshold >= 3)
                sprite_index = spr_ragemove;
            else
                sprite_index = spr_move;
        }
        
        if (scr_solid(x + sign(hsp), y) && !scr_solid_slope(x + sign(hsp), y) && xscale == move && !place_meeting(x, y + 1, obj_slope))
            movespeed = 0;
        
        if (!steppy && character != "V" && (floor(image_index == 3) || floor(image_index) == 8))
        {
            create_particle(x, y + 43, UnknownEnum.Value_1, 0);
            steppy = 1;
        }
        
        if (floor(image_index) != 3 && floor(image_index) != 8)
            steppy = 0;
    }
    else
    {
        image_speed = 0.35;
        movespeed = 0;
        
        if (!machslideAnim && !landAnim && !shotgunAnim)
        {
            if (idle < 400)
                idle++;
            
            if (idle >= 150)
            {
                if (sprite_index != spr_idle && floor(image_index) == (image_number - 1))
                {
                    facehurt = 0;
                    idle = 0;
                }
                
                if (sprite_index != spr_idle1 && sprite_index != spr_idle2 && sprite_index != spr_idle3 && sprite_index != spr_idle4 && sprite_index != spr_idle5 && sprite_index != spr_idle6)
                {
                    idleanim = random_range(0, 100);
                    
                    if (irandom(100) <= 25)
                    {
                        if (ispeppino)
                            scr_soundeffect(30, 217, 36, 223);
                        else
                            scr_soundeffect(3, 61, 13, 26);
                    }
                    
                    image_index = 0;
                    
                    if (idleanim <= 16)
                        sprite_index = spr_idle1;
                    else if (idleanim > 16 && idleanim <= 32)
                        sprite_index = spr_idle2;
                    else if (idleanim > 32 && idleanim <= 48)
                        sprite_index = spr_idle3;
                    else if (idleanim > 48 && idleanim <= 64)
                        sprite_index = spr_idle4;
                    else if (idleanim > 64 && idleanim <= 80)
                        sprite_index = spr_idle5;
                    else
                        sprite_index = spr_idle6;
                }
            }
            else if (!facehurt)
            {
                if (windingAnim < 1800 || angry || global.playerhealth == 1 || shoot)
                {
                    start_running = 1;
                    movespeed = 0;
                    
                    if (shoot)
                    {
                        sprite_index = spr_player_pistolidle;
                    }
                    else if (mort)
                    {
                        sprite_index = spr_player_mortidle;
                    }
                    else if (global.minutes == 0 && global.seconds == 0)
                    {
                        sprite_index = spr_hurtidle;
                    }
                    else if (global.panic)
                    {
                        sprite_index = spr_panic;
                    }
                    else if (global.stylethreshold == 2)
                    {
                        sprite_index = spr_3hpidle;
                    }
                    else if (global.stylethreshold >= 3)
                    {
                        sprite_index = spr_rageidle;
                    }
                    else if (chainsawcutscene)
                    {
                        sprite_index = spr_chainsawidle;
                        
                        if (!instance_exists(obj_chainsawpuff))
                            instance_create(x, y, obj_chainsawpuff);
                    }
                    else
                    {
                        sprite_index = spr_idle;
                    }
                }
                else
                {
                    idle = 0;
                    windingAnim--;
                    sprite_index = spr_winding;
                }
            }
            else
            {
                windingAnim = 0;
                sprite_index = spr_facehurt;
            }
        }
    }
    
    if (movespeed > 8)
        movespeed -= 0.1;
    
    if (landAnim)
    {
        if (sprite_index == spr_player_mortland)
        {
            if (floor(image_index) == (image_number - 1))
            {
                landAnim = 0;
                sprite_index = spr_player_mortidle;
                image_index = 0;
            }
        }
        else if (!shotgunAnim)
        {
            if (move == 0)
            {
                movespeed = 0;
                sprite_index = spr_land;
                
                if (floor(image_index) == (image_number - 1))
                    landAnim = 0;
            }
            else
            {
                sprite_index = spr_land2;
                
                if (floor(image_index) == (image_number - 1))
                {
                    landAnim = 0;
                    sprite_index = spr_move;
                    image_index = 0;
                }
            }
        }
        else
        {
            sprite_index = spr_shotgunland;
            
            if (floor(image_index) == (image_number - 1))
            {
                landAnim = 0;
                sprite_index = spr_shotgunidle;
                
                if (move != 0)
                    sprite_index = spr_shotgunwalk;
                
                image_index = 0;
            }
        }
    }
    else if (shotgunAnim && sprite_index != spr_shotgunshoot)
    {
        sprite_index = (move == 0) ? spr_shotgunidle : spr_shotgunwalk;
    }
    
    if (machslideAnim)
        sprite_index = spr_machslideend;
    
    if (floor(image_index) == (image_number - 1))
    {
        switch (sprite_index)
        {
            case spr_machslideend:
                machslideAnim = 0;
                break;
            
            case spr_playerV_revolverend:
                sprite_index = spr_idle;
                break;
            
            case spr_shotgunshoot:
                sprite_index = spr_shotgunidle;
                break;
        }
    }
    
    if (grounded)
    {
        if ((key_jump || (input_buffer_jump < 8 && !key_attack && vsp > 0)) && !key_down)
        {
            scr_soundeffect(40);
            
            if (sprite_index != spr_shotgunshoot)
            {
                sprite_index = spr_jump;
                
                if (shotgunAnim)
                    sprite_index = spr_shotgunjump;
                
                image_index = 0;
            }
            
            particle_set_scale(UnknownEnum.Value_4, xscale, 1);
            create_particle(x, y, UnknownEnum.Value_4, 0);
            vsp = -11;
            state = UnknownEnum.Value_92;
            jumpAnim = 1;
            jumpstop = 0;
            freefallstart = 0;
        }
        
        if (key_down || scr_solid(x, y - 3))
        {
            state = UnknownEnum.Value_100;
            landAnim = 0;
            crouchAnim = 1;
            image_index = 0;
            idle = 0;
        }
    }
    else if (!key_jump)
    {
        if (sprite_index != spr_shotgunshoot)
        {
            if (!shotgunAnim)
                sprite_index = spr_fall;
            else
                sprite_index = spr_shotgunfall;
            
            image_index = 0;
            jumpAnim = 0;
        }
        else
        {
            jumpAnim = 1;
        }
        
        state = UnknownEnum.Value_92;
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
    
    if (key_slap2 && (!key_up || global.option_septmoveset) && !chainsawcutscene)
    {
        if ((character == "P" || character == "N") && !shoot)
        {
            if (global.attackstyle == 0 || global.attackstyle == 3)
            {
                suplexmove = 1;
                suplexdashsnd = audio_play_sound(sfx_suplexdash, 1, false);
                sfx_gain(suplexdashsnd);
                state = UnknownEnum.Value_42;
                movespeed = 5;
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
    else if (key_slap2 && (shoot || shotgunAnim || chainsawcutscene) && (!key_up || global.option_septmoveset))
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
    
    scr_douppercut();
    
    switch (character)
    {
        case "P":
            if (key_attack && state != UnknownEnum.Value_42 && !place_meeting(x + xscale, y, obj_solid) && (!place_meeting(x, y + 1, obj_iceblockslope) || !place_meeting(x + (xscale * 5), y, obj_solid)) && !global.kungfu)
            {
                if (pizzapepper == 0)
                {
                    if (global.attackstyle != 2 || dash_doubletap <= 0)
                    {
                        dash_doubletap = 20;
                        movespeed = 6;
                        sprite_index = spr_mach1;
                        image_index = 0;
                        jumpAnim = 1;
                        state = UnknownEnum.Value_103;
                        
                        if (!global.option_septmoveset)
                            state = UnknownEnum.Value_104;
                    }
                    else if (global.attackstyle == 2 && dash_doubletap > 0)
                    {
                        dash_doubletap = 0;
                        sprite_index = spr_suplexdash;
                        image_index = 0;
                        state = UnknownEnum.Value_45;
                        movespeed = 10;
                    }
                }
            }
            
            if (global.kungfu && key_attack && state != UnknownEnum.Value_42)
            {
                state = UnknownEnum.Value_205;
                sprite_index = spr_player_airattack;
                hsp = 0;
                movespeed = 0;
            }
            
            break;
        
        case "N":
            if (pogochargeactive || pizzapepper > 0)
            {
                if (key_attack2)
                {
                    scr_soundeffect(61);
                    state = UnknownEnum.Value_99;
                    image_index = 0;
                    sprite_index = !key_up ? spr_playerN_jetpackstart : spr_superjumpprep;
                    hsp = 0;
                    vsp = 0;
                }
            }
            else if (key_attack && !key_slap2)
            {
                sprite_index = spr_playerN_pogostart;
                image_index = 0;
                state = UnknownEnum.Value_58;
            }
            
            break;
        
        case "V":
            if (key_attack && !place_meeting(x + xscale, y, obj_solid))
            {
                if (pizzapepper == 0)
                {
                    movespeed = 6;
                    sprite_index = spr_mach1;
                    image_index = 0;
                    jumpAnim = 1;
                    state = UnknownEnum.Value_103;
                }
                else
                {
                    movespeed = 21;
                    sprite_index = spr_crazyrun;
                    jumpAnim = 1;
                    state = UnknownEnum.Value_121;
                    movespeed = 20;
                }
            }
            
            if (key_shoot2 && !instance_exists(dynamite_inst))
            {
                if (move == 0)
                    movespeed = 0;
                
                state = UnknownEnum.Value_2;
                sprite_index = spr_playerV_dynamitethrow;
                image_index = 0;
                
                with (instance_create(x, y, obj_dynamite))
                {
                    image_xscale = other.xscale;
                    movespeed = 6;
                    vsp = -6;
                    other.dynamite_inst = id;
                    playerid = other.id;
                }
            }
            
            if (key_slap2)
            {
                if (move == 0)
                    movespeed = 0;
                
                sprite_index = spr_playerV_revolverstart;
                image_index = 0;
                state = UnknownEnum.Value_1;
            }
            
            break;
    }
    
    scr_dotaunt();
    
    if (sprite_index == spr_shotgunshoot)
    {
        landAnim = 0;
        machslideAnim = 0;
        image_speed = 0.45;
    }
}

function state_pepperman_normal()
{
    pepperman_grab_reset();
    move = key_left + key_right;
    
    if (move != 0 && move == sign(xscale) && movespeed < pepperman_maxhsp_normal)
        movespeed += pepperman_accel;
    else if (move != 0 && move != sign(xscale) && movespeed > 0)
        movespeed -= pepperman_deccel;
    else if (move == 0)
        movespeed -= pepperman_deccel;
    
    if (floor(movespeed) == pepperman_maxhsp_normal)
        movespeed = pepperman_maxhsp_normal;
    
    if (movespeed > pepperman_maxhsp_normal)
        movespeed -= 0.3;
    else if (movespeed < 0)
        movespeed = 0;
    
    if (move != 0 && movespeed == 0)
        xscale = move;
    
    hsp = xscale * movespeed;
    
    if (sprite_index != spr_pepperman_throw)
    {
        if (hsp != 0)
            sprite_index = spr_move;
        else
            sprite_index = spr_idle;
    }
    
    if ((input_buffer_jump < 8 || key_jump) && grounded && vsp > 0)
    {
        scr_soundeffect(40);
        sprite_index = spr_jump;
        image_index = 0;
        vsp = -pepperman_jumpspeed;
        state = UnknownEnum.Value_92;
        
        with (instance_create(x, y - 5, obj_highjumpcloud2))
            image_xscale = other.xscale;
    }
    
    if (!grounded && !key_jump)
    {
        state = UnknownEnum.Value_92;
        sprite_index = spr_fall;
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
        sprite_index = spr_pepperman_idle;
    
    if (move != 0 && (floor(image_index) == 4 || floor(image_index) == 11) && steppy == 0 && character != "V")
    {
        instance_create(x, y + 38, obj_cloudeffect);
        steppy = 1;
    }
    
    if (move != 0 && floor(image_index) != 4 && floor(image_index) != 11)
        steppy = 0;
}

function pepperman_grab_reset()
{
    if (pepperman_grabID != -4)
    {
        if (!instance_exists(pepperman_grabID))
            pepperman_grabID = -4;
    }
}

function scr_player_normal()
{
    if (character != "M")
        state_player_normal();
    else
        state_pepperman_normal();
}
