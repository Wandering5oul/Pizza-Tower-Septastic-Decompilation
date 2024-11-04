function scr_player_mach3()
{
    var _railinst, _bump, _playerid, i;
    
    switch (character)
    {
        case "P":
            if (windingAnim < 2000)
                windingAnim++;
            
            if (grounded && sprite_index == spr_player_Sjumpcancel)
                sprite_index = spr_mach4;
            
            if (!place_meeting(x, y + 1, obj_railparent))
            {
                hsp = xscale * movespeed;
            }
            else
            {
                _railinst = instance_place(x, y + 1, obj_railparent);
                hsp = (xscale * movespeed) + (_railinst.movespeed * _railinst.dir);
            }
            
            if (grounded)
            {
                if (scr_slope() && hsp != 0 && movespeed > 10 && movespeed < 18)
                    scr_player_addslopemomentum(global.slopedeccelmach, global.slopeaccelmach);
            }
            
            if (move == xscale && grounded)
            {
                if (movespeed < 20)
                {
                    if (!mach4mode)
                        movespeed += 0.025;
                    else
                        movespeed += 0.1;
                }
            }
            
            mach2 = 100;
            momemtum = 1;
            move = key_right + key_left;
            move2 = key_right2 + key_left2;
            
            if (fightball == 1 && global.coop == 1)
            {
                if (object_index == obj_player1)
                {
                    x = obj_player2.x;
                    y = obj_player2.y;
                }
                
                if (object_index == obj_player2)
                {
                    x = obj_player1.x;
                    y = obj_player1.y;
                }
            }
            
            if (sprite_index == spr_crazyrun)
            {
                if (flamecloud_buffer > 0)
                {
                    flamecloud_buffer--;
                }
                else
                {
                    flamecloud_buffer = 10;
                    
                    with (instance_create(x, y, obj_dashcloud))
                    {
                        image_xscale = other.xscale;
                        sprite_index = spr_flamecloud;
                    }
                }
            }
            
            crouchslideAnim = 1;
            
            if (!key_jump2 && jumpstop == 0 && vsp < 0.5)
            {
                vsp /= 20;
                jumpstop = 1;
            }
            
            if (grounded && vsp > 0)
                jumpstop = 0;
            
            if (input_buffer_jump < 8 && sprite_index != spr_mach3jump && grounded && !(move == 1 && xscale == -1) && !(move == -1 && xscale == 1))
            {
                scr_soundeffect(40);
                
                if (sprite_index != spr_fightball)
                {
                    image_index = 0;
                    sprite_index = spr_mach3jump;
                }
                
                if (character == "P")
                    vsp = -11;
                else
                    vsp = -13;
            }
            else if (input_buffer_jump < 8 && !grounded && key_up && !ispeppino && character == "P" && noisedoublejump)
            {
                scr_player_do_noisecrusher();
            }
            
            if (fightball == 0)
            {
                if (sprite_index == spr_mach3jump && floor(image_index) == (image_number - 1))
                    sprite_index = spr_mach4;
                
                if (floor(image_index) == (image_number - 1) && (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit || sprite_index == spr_dashpadmach))
                    sprite_index = spr_mach4;
                
                if (sprite_index == spr_mach2jump && grounded && vsp > 0)
                    sprite_index = spr_mach4;
                
                if (movespeed > 16 && sprite_index != spr_crazyrun && sprite_index != spr_player_Sjumpcancelstart && sprite_index != spr_taunt)
                {
                    mach4mode = true;
                    flash = 1;
                    sprite_index = spr_crazyrun;
                }
                else if (movespeed <= 16 && sprite_index == spr_crazyrun)
                {
                    sprite_index = spr_mach4;
                }
            }
            
            if (sprite_index == spr_crazyrun && !instance_exists(crazyruneffectid))
            {
                with (instance_create(x, y, obj_crazyrunothereffect))
                {
                    playerid = other.object_index;
                    other.crazyruneffectid = id;
                }
            }
            
            if (sprite_index == spr_mach4 || sprite_index == spr_fightball)
                image_speed = 0.4;
            else if (sprite_index == spr_crazyrun)
                image_speed = 0.75;
            else if (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit || sprite_index == spr_dashpadmach)
                image_speed = 0.4;
            
            if (key_jump)
                input_buffer_jump = 0;
            
            if ((!key_attack && fightball == 0 && !launched && sprite_index != spr_dashpadmach && grounded && (character == "P" || character == "N")) || (character == "S" && (move == 0 || move != xscale) && grounded && fightball == 0))
            {
                if (!launch)
                {
                    sprite_index = spr_machslidestart;
                    scr_soundeffect(117);
                    state = UnknownEnum.Value_105;
                    image_index = 0;
                    launched = 0;
                }
                else
                {
                    xscale *= -1;
                    sprite_index = spr_dashpadmach;
                    image_index = 0;
					// mach 3? also not it (movespeed too high)
                    state = UnknownEnum.Value_121;
                    movespeed = 14;
                    launched = 1;
                    launch = 0;
                    launch_buffer = 60;
                }
            }
            
            if (move == -xscale && grounded && (character == "P" || character == "N") && fightball == 0 && sprite_index != spr_dashpadmach)
            {
                scr_soundeffect(114);
                sprite_index = spr_mach3boost;
                state = UnknownEnum.Value_105;
                image_index = 0;
            }
            
            if (scr_mach_check_dive() && fightball == 0)
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
            
            if (grounded && (place_meeting(x + sign(hsp), y - 16, obj_solid) || scr_solid_slope(x + sign(hsp), y - 16)) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_mach3solid) && !place_meeting(x + hsp, y, obj_metalblock) && place_meeting(x, y + 1, obj_slope))
            {
                wallspeed = movespeed;
                grabclimbbuffer = 0;
                state = UnknownEnum.Value_37;
            }
            
            if (!grounded && (place_meeting(x + sign(hsp), y, obj_climbablewall) || (!global.option_septmoveset && place_meeting(x + sign(hsp), y, obj_solid))) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_metalblock))
            {
                grabclimbbuffer = 0;
                
                if (movespeed < 1)
                    wallspeed = 1;
                else
                    wallspeed = movespeed;
                
                state = UnknownEnum.Value_37;
            }
            
            if (scr_solid(x + xscale, y) && (grounded || global.option_septmoveset) && !place_meeting(x + xscale, y, obj_mach3solid) && !scr_slope() && (scr_solid_slope(x + sign(hsp), y) || (place_meeting(x + sign(hsp), y, obj_solid) && (grounded || global.option_septmoveset))) && !place_meeting(x + sign(hsp), y, obj_metalblock) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_climbablewall))
            {
                _bump = ledge_bump((vsp >= 0) ? 32 : 22);
                
                if (_bump)
                {
                    if (fightball == 0)
                    {
                        sprite_index = spr_hitwall;
                        scr_soundeffect(55);
                        scr_soundeffect(56);
                        
                        with (obj_camera)
                        {
                            shake_mag = 20;
                            shake_mag_acc = 40 / room_speed;
                        }
                        
                        hsp = 0;
                        
                        with (obj_baddie)
                        {
                            if (point_in_camera(x, y, view_camera[0]) && grounded)
                            {
                                stun = 1;
                                alarm[0] = 200;
                                ministun = 0;
                                vsp = -5;
                                hsp = 0;
                            }
                        }
                        
                        flash = 0;
                        state = UnknownEnum.Value_106;
                        hsp = -6 * xscale;
                        vsp = -6;
                        mach2 = 0;
                        image_index = 0;
                        instance_create(x + 10, y + 10, obj_bumpeffect);
                    }
                    else if (fightball == 1)
                    {
                        with (obj_player)
                        {
                            sprite_index = spr_hitwall;
                            scr_soundeffect(55);
                            scr_soundeffect(56);
                            
                            with (obj_camera)
                            {
                                shake_mag = 20;
                                shake_mag_acc = 40 / room_speed;
                            }
                            
                            hsp = 0;
                            
                            with (obj_baddie)
                            {
                                if (point_in_camera(x, y, view_camera[0]))
                                {
                                    stun = 1;
                                    alarm[0] = 200;
                                    ministun = 0;
                                    vsp = -5;
                                    hsp = 0;
                                }
                            }
                            
                            flash = 0;
                            state = UnknownEnum.Value_106;
                            hsp = -6;
                            vsp = -6;
                            mach2 = 0;
                            image_index = 0;
                            instance_create(x + 10, y + 10, obj_bumpeffect);
                        }
                        
                        fightball = 0;
                    }
                }
            }
            
            break;
        
        case "V":
            if (windingAnim < 2000)
                windingAnim++;
            
            if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
                hsp = xscale * movespeed;
            else if (place_meeting(x, y + 1, obj_railh))
                hsp = (xscale * movespeed) - 5;
            else if (place_meeting(x, y + 1, obj_railh2))
                hsp = (xscale * movespeed) + 5;
            
            mach2 = 100;
            momemtum = 1;
            move = key_right + key_left;
            move2 = key_right2 + key_left2;
            
            if (fightball == 1 && global.coop == 1)
            {
                if (object_index == obj_player1)
                {
                    x = obj_player2.x;
                    y = obj_player2.y;
                }
                
                if (object_index == obj_player2)
                {
                    x = obj_player1.x;
                    y = obj_player1.y;
                }
            }
            
            if (movespeed < 24 && grounded)
            {
                if (!instance_exists(crazyruneffectid) && grounded)
                {
                    with (instance_create(x, y, obj_crazyruneffect))
                    {
                        playerid = other.object_index;
                        other.crazyruneffectid = id;
                    }
                    
                    if (sprite_index == spr_crazyrun)
                    {
                        with (instance_create(x, y, obj_dashcloud))
                        {
                            image_xscale = other.xscale;
                            sprite_index = spr_flamecloud;
                        }
                    }
                }
            }
            
            crouchslideAnim = 1;
            
            if (!key_jump2 && jumpstop == 0 && vsp < 0.5)
            {
                vsp /= 20;
                jumpstop = 1;
            }
            
            if (grounded && vsp > 0)
                jumpstop = 0;
            
            if (input_buffer_jump < 8 && grounded && !(move == 1 && xscale == -1) && !(move == -1 && xscale == 1))
            {
                scr_soundeffect(40);
                
                if (sprite_index != spr_fightball)
                {
                    image_index = 0;
                    sprite_index = spr_mach3jump;
                }
                
                vsp = -11;
            }
            
            if (fightball == 0)
            {
                if (sprite_index == spr_mach3jump && floor(image_index) == (image_number - 1))
                    sprite_index = spr_mach4;
                
                if (floor(image_index) == (image_number - 1) && (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit || sprite_index == spr_dashpadmach))
                    sprite_index = spr_mach4;
                
                if (sprite_index == spr_mach2jump && grounded && vsp > 0)
                    sprite_index = spr_mach4;
                
                if (movespeed > 20 && sprite_index != spr_crazyrun && sprite_index != spr_taunt && sprite_index != spr_player_Sjumpcancelstart)
                {
                    flash = 1;
                    sprite_index = spr_crazyrun;
                }
                else if (movespeed <= 20 && sprite_index == spr_crazyrun)
                {
                    sprite_index = spr_mach4;
                }
            }
            
            if (sprite_index == spr_crazyrun && !instance_exists(crazyruneffectid))
            {
                with (instance_create(x, y, obj_crazyrunothereffect))
                {
                    playerid = other.object_index;
                    other.crazyruneffectid = id;
                }
            }
            
            if (key_jump && !grounded)
            {
                image_index = 0;
                sprite_index = spr_player_Sjumpcancelstart;
            }
            
            if (grounded && (sprite_index == spr_player_Sjumpcancelstart || sprite_index == spr_taunt))
                sprite_index = spr_mach4;
            
            if (floor(image_index) == 0 && sprite_index == spr_player_Sjumpcancelstart)
            {
                scr_soundeffect(112);
                taunttimer = 20;
                tauntstoredsprite = sprite_index;
                image_index = random_range(0, 11);
                sprite_index = spr_taunt;
                
                with (instance_create(x, y, obj_taunteffect))
                    player = other.id;
            }
            
            if (sprite_index == spr_taunt)
                taunttimer--;
            else
                tauntimer = 0;
            
            if (taunttimer <= 0 && sprite_index == spr_taunt)
                tauntstoredsprite = sprite_index;
            
            if (sprite_index == spr_mach4 || sprite_index == spr_fightball)
                image_speed = 0.4;
            else if (sprite_index == spr_crazyrun)
                image_speed = 0.75;
            else if (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit)
                image_speed = 0.4;
            
            if (key_jump)
                input_buffer_jump = 0;
            
            if ((!key_attack && fightball == 0 && grounded) || (character == "S" && (move == 0 || move != xscale) && grounded && fightball == 0))
            {
                sprite_index = spr_machslidestart;
                scr_soundeffect(117);
                state = UnknownEnum.Value_105;
                image_index = 0;
            }
            
            if (move == -xscale && grounded && fightball == 0)
            {
                scr_soundeffect(114);
                sprite_index = spr_mach3boost;
                state = UnknownEnum.Value_105;
                image_index = 0;
            }
            
            if (key_down && fightball == 0 && !place_meeting(x, y, obj_dashpad))
            {
                particle_set_scale(UnknownEnum.Value_5, xscale, 1);
                create_particle(x, y, UnknownEnum.Value_5, 0);
                flash = 0;
                state = UnknownEnum.Value_65;
                vsp = 10;
            }
            
            if ((!grounded && place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + sign(hsp), y, 235 || scr_solid_slope(x + sign(hsp), y)) && !place_meeting(x + hsp, y, obj_mach3solid)) || (grounded && (place_meeting(x + hsp, y - 32, obj_solid) || scr_solid_slope(x + sign(hsp), y - 32)) && place_meeting(x, y + 1, obj_slope) && !place_meeting(x + hsp, y, obj_mach3solid)))
            {
                wallspeed = 10;
                state = UnknownEnum.Value_37;
            }
            
            if (scr_solid(x + 1, y) && !place_meeting(x + 1, y, obj_mach3solid) && xscale == 1 && !scr_slope() && (!place_meeting(x + sign(hsp), y, obj_slope) || place_meeting(x + sign(hsp), y, obj_solid)) && (grounded || fightball == 1))
            {
                if (fightball == 0)
                {
                    sprite_index = spr_hitwall;
                    scr_soundeffect(55);
                    scr_soundeffect(56);
                    
                    with (obj_camera)
                    {
                        shake_mag = 20;
                        shake_mag_acc = 40 / room_speed;
                    }
                    
                    hsp = 0;
                    image_speed = 0.35;
                    
                    with (obj_baddie)
                    {
                        if (point_in_camera(x, y, view_camera[0]))
                        {
                            stun = 1;
                            alarm[0] = 200;
                            ministun = 0;
                            vsp = -5;
                            hsp = 0;
                        }
                    }
                    
                    flash = 0;
                    state = UnknownEnum.Value_106;
                    hsp = -2.5;
                    vsp = -3;
                    mach2 = 0;
                    image_index = 0;
                    instance_create(x + 10, y + 10, obj_bumpeffect);
                }
                else if (fightball == 1)
                {
                    with (obj_player)
                    {
                        sprite_index = spr_hitwall;
                        scr_soundeffect(55);
                        scr_soundeffect(56);
                        
                        with (obj_camera)
                        {
                            shake_mag = 20;
                            shake_mag_acc = 40 / room_speed;
                        }
                        
                        hsp = 0;
                        image_speed = 0.35;
                        
                        with (obj_baddie)
                        {
                            if (point_in_camera(x, y, view_camera[0]))
                            {
                                stun = 1;
                                alarm[0] = 200;
                                ministun = 0;
                                vsp = -5;
                                hsp = 0;
                            }
                        }
                        
                        flash = 0;
                        state = UnknownEnum.Value_106;
                        hsp = -2.5;
                        vsp = -3;
                        mach2 = 0;
                        image_index = 0;
                        instance_create(x + 10, y + 10, obj_bumpeffect);
                    }
                    
                    fightball = 0;
                }
            }
            
            if (scr_solid(x - 1, y) && !place_meeting(x - 1, y, obj_mach3solid) && xscale == -1 && !scr_slope() && (!place_meeting(x + sign(hsp), y, obj_slope) || place_meeting(x + sign(hsp), y, obj_solid)) && (grounded || fightball == 1))
            {
                if (fightball == 0)
                {
                    sprite_index = spr_hitwall;
                    scr_soundeffect(55);
                    scr_soundeffect(56);
                    
                    with (obj_camera)
                    {
                        shake_mag = 20;
                        shake_mag_acc = 40 / room_speed;
                    }
                    
                    hsp = 0;
                    image_speed = 0.35;
                    
                    with (obj_baddie)
                    {
                        if (point_in_camera(x, y, view_camera[0]))
                        {
                            stun = 1;
                            alarm[0] = 200;
                            ministun = 0;
                            vsp = -5;
                            hsp = 0;
                        }
                    }
                    
                    flash = 0;
                    state = UnknownEnum.Value_106;
                    hsp = 2.5;
                    vsp = -3;
                    mach2 = 0;
                    image_index = 0;
                    instance_create(x - 10, y + 10, obj_bumpeffect);
                }
                else if (fightball == 1)
                {
                    with (obj_player)
                    {
                        sprite_index = spr_hitwall;
                        scr_soundeffect(55);
                        scr_soundeffect(56);
                        
                        with (obj_camera)
                        {
                            shake_mag = 20;
                            shake_mag_acc = 40 / room_speed;
                        }
                        
                        hsp = 0;
                        image_speed = 0.35;
                        
                        with (obj_baddie)
                        {
                            if (point_in_camera(x, y, view_camera[0]))
                            {
                                stun = 1;
                                alarm[0] = 200;
                                ministun = 0;
                                vsp = -5;
                                hsp = 0;
                            }
                        }
                        
                        flash = 0;
                        state = UnknownEnum.Value_106;
                        hsp = -2.5;
                        vsp = -3;
                        mach2 = 0;
                        image_index = 0;
                        instance_create(x + 10, y + 10, obj_bumpeffect);
                    }
                    
                    fightball = 0;
                }
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
                    playerid = other.id;
                    other.dynamite_inst = id;
                    movespeed = other.movespeed + 4;
                    vsp = -6;
                }
            }
            
            break;
        
        case "N":
            hsp = xscale * movespeed;
            move = key_right + key_left;
            
            if (fightball == 0)
                vsp = 0;
            
            if (key_up && fightball == 0)
                vsp = -3;
            
            if (key_down && fightball == 0)
                vsp = 3;
            
            if (movespeed < 24 && move == xscale)
            {
                if (!instance_exists(crazyruneffectid) && grounded)
                {
                    with (instance_create(x, y, obj_crazyruneffect))
                    {
                        playerid = other.object_index;
                        other.crazyruneffectid = id;
                    }
                    
                    if (sprite_index == spr_crazyrun)
                    {
                        with (instance_create(x, y, obj_dashcloud))
                        {
                            image_xscale = other.xscale;
                            sprite_index = spr_flamecloud;
                        }
                    }
                }
            }
            
            if (key_attack2 && character == "N" && fightball == 0)
            {
                sprite_index = spr_playerN_pogostart;
                image_index = 0;
                state = UnknownEnum.Value_58;
                pogospeed = movespeed;
            }
            
            if (fightball == 0)
            {
                if (movespeed > 20 && sprite_index != spr_crazyrun)
                {
                    flash = 1;
                    sprite_index = spr_crazyrun;
                }
                else if (movespeed <= 20 && sprite_index == spr_crazyrun)
                {
                    sprite_index = spr_playerN_jetpackboost;
                }
            }
            
            if (character == "N" && key_jump2 && fightball == 0)
            {
                scr_soundeffect(40);
                scr_soundeffect(127);
                jumpstop = 0;
                vsp = -15;
                state = UnknownEnum.Value_92;
                sprite_index = spr_playerN_noisebombspinjump;
                image_index = 0;
                particle_set_scale(UnknownEnum.Value_5, xscale, 1);
                create_particle(x, y, UnknownEnum.Value_5, 0);
            }
            
            if (key_down && fightball == 0 && !place_meeting(x, y, obj_dashpad) && grounded)
            {
                with (instance_create(x, y, obj_jumpdust))
                    image_xscale = other.xscale;
                
                flash = 0;
                sprite_index = spr_playerN_jetpackslide;
                state = UnknownEnum.Value_65;
            }
            
            if (!key_jump2 && jumpstop == 0 && vsp < 0.5 && fightball == 1)
            {
                vsp /= 20;
                jumpstop = 1;
            }
            
            if (grounded && vsp > 0 && fightball == 1)
                jumpstop = 0;
            
            if (input_buffer_jump < 8 && grounded && !(move == 1 && xscale == -1) && !(move == -1 && xscale == 1) && fightball == 1)
            {
                scr_soundeffect(40);
                
                if (sprite_index != spr_fightball)
                {
                    image_index = 0;
                    sprite_index = spr_mach3jump;
                }
                
                vsp = -11;
            }
            
            if (scr_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, obj_mach3solid) && (!place_meeting(x + sign(hsp), y, obj_slope) || place_meeting(x + sign(hsp), y, obj_solid)) && !place_meeting(x + sign(hsp), y, obj_metalblock) && character != "V" && !place_meeting(x + sign(hsp), y, obj_destructibles) && character != "V" && !place_meeting(x + sign(hsp), y, obj_hungrypillar))
            {
                pizzapepper = 0;
                sprite_index = spr_hitwall;
                scr_soundeffect(55);
                scr_soundeffect(56);
                
                with (obj_camera)
                {
                    shake_mag = 20;
                    shake_mag_acc = 40 / room_speed;
                }
                
                hsp = 0;
                image_speed = 0.35;
                
                with (obj_baddie)
                {
                    if (point_in_camera(x, y, view_camera[0]))
                    {
                        stun = 1;
                        alarm[0] = 200;
                        ministun = 0;
                        vsp = -5;
                        hsp = 0;
                    }
                }
                
                flash = 0;
                state = UnknownEnum.Value_106;
                hsp = 2.5;
                vsp = -3;
                mach2 = 0;
                image_index = 0;
                instance_create(x - 10, y + 10, obj_bumpeffect);
            }
            
            break;
    }
    
    if (!instance_exists(dashcloudid) && grounded && !place_meeting(x, y + 1, obj_water))
    {
        with (instance_create(x, y, obj_superdashcloud))
        {
            if (other.fightball == 1)
                instance_create(obj_player.x, obj_player.y, obj_slapstar);
            
            image_xscale = other.xscale;
            other.dashcloudid = id;
        }
    }
    
    if (!instance_exists(dashcloudid) && grounded && place_meeting(x, y + 1, obj_water))
    {
        with (instance_create(x, y, obj_superdashcloud))
        {
            if (other.fightball == 1)
                instance_create(obj_player.x, obj_player.y, obj_slapstar);
            
            image_xscale = other.xscale;
            sprite_index = spr_watereffect;
            other.dashcloudid = id;
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
    
    if (!instance_exists(chargeeffectid))
    {
        with (instance_create(x, y, obj_chargeeffect))
        {
            playerid = other.object_index;
            other.chargeeffectid = id;
        }
    }
    
    if (sprite_index == spr_mach4 || sprite_index == spr_fightball)
        image_speed = 0.4;
    else if (sprite_index == spr_crazyrun)
        image_speed = 0.75;
    else if (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit)
        image_speed = 0.4;
    else
        image_speed = 0.4;
    
    if (scr_check_superjump() && fightball == 0 && character == "P" && grounded && sprite_index != spr_dashpadmach && !place_meeting(x, y, obj_dashpad))
    {
        sprite_index = spr_superjumpprep;
        state = UnknownEnum.Value_99;
        hsp = 0;
        image_index = 0;
    }
    
    if (global.attackstyle == 2 && key_slap2)
    {
        randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, 580, 579, 578, spr_punch]);
        image_index = 0;
        state = UnknownEnum.Value_43;
    }
}
