function scr_playersounds()
{
    with (obj_player)
    {
        if (state != UnknownEnum.Value_150 && sprite_index != spr_knightpepstart && state != UnknownEnum.Value_52 && state != UnknownEnum.Value_61 && state != UnknownEnum.Value_112 && state != UnknownEnum.Value_98 && state != UnknownEnum.Value_59 && state != UnknownEnum.Value_89 && state != UnknownEnum.Value_9 && state != UnknownEnum.Value_146)
        {
            if (!scr_transformationcheck())
            {
                if (!transformationsnd)
                {
                    transformationsnd = true;
                    
                    if (irandom(100) <= 70)
                    {
                        if (ispeppino)
                        {
                            scr_soundeffect(1, 176, 193);
                        }
                        else
                        {
                            scr_soundeffect(174);
                            audio_sound_pitch(vsfxN_transfo, 1.4);
                        }
                    }
                    
                    scr_soundeffect(215);
                }
            }
            else if (transformationsnd)
            {
                transformationsnd = false;
                
                if (irandom(100) <= 70)
                {
                    if (ispeppino)
                    {
                        scr_soundeffect(30, 36, 6);
                    }
                    else
                    {
                        scr_soundeffect(174);
                        audio_sound_pitch(vsfxN_transfo, 0.7);
                    }
                }
                
                scr_soundeffect(225);
            }
        }
        
        if (ispeppino)
        {
            if (sprite_index == spr_mach1 && !audio_is_playing(sfx_mach1) && grounded)
            {
                mach1snd = audio_play_sound(sfx_mach1, 1, false);
                sfx_gain(mach1snd);
            }
            else if (sprite_index != spr_mach1 || !grounded || move == -xscale)
            {
                audio_stop_sound(mach1snd);
            }
            
            if ((sprite_index == spr_mach || state == UnknownEnum.Value_37) && !audio_is_playing(sfx_mach2))
            {
                mach2snd = audio_play_sound(sfx_mach2, 1, false);
                sfx_gain(mach2snd);
            }
            else if (sprite_index != spr_mach && state != UnknownEnum.Value_37)
            {
                audio_stop_sound(mach2snd);
            }
            
            if (state == UnknownEnum.Value_121 && sprite_index != spr_crazyrun && !audio_is_playing(sfx_mach3))
            {
                mach3snd = audio_play_sound(sfx_mach3, 1, false);
                sfx_gain(mach3snd);
            }
            else if (state != UnknownEnum.Value_121 || sprite_index == spr_crazyrun)
            {
                audio_stop_sound(mach3snd);
            }
            
            if (sprite_index == spr_crazyrun && !audio_is_playing(sfx_mach4))
            {
                mach4snd = audio_play_sound(sfx_mach4, 1, false);
                sfx_gain(mach4snd);
            }
            else if (sprite_index != spr_crazyrun)
            {
                audio_stop_sound(mach4snd);
            }
        }
        else
        {
            if (sprite_index == spr_mach1 && !audio_is_playing(sfx_mach1N) && grounded)
            {
                mach1snd = audio_play_sound(sfx_mach1N, 1, false);
                sfx_gain(mach1snd);
            }
            else if (sprite_index != spr_mach1 || !grounded || move == -xscale)
            {
                audio_stop_sound(mach1snd);
            }
            
            if ((sprite_index == spr_mach || state == UnknownEnum.Value_37) && !audio_is_playing(sfx_mach2N))
            {
                mach2snd = audio_play_sound(sfx_mach2N, 1, false);
                sfx_gain(mach2snd);
            }
            else if (sprite_index != spr_mach && state != UnknownEnum.Value_37)
            {
                audio_stop_sound(mach2snd);
            }
            
            if (state == UnknownEnum.Value_121 && sprite_index != spr_crazyrun && !audio_is_playing(sfx_mach3N))
            {
                mach3snd = audio_play_sound(sfx_mach3N, 1, false);
                sfx_gain(mach3snd);
            }
            else if (state != UnknownEnum.Value_121 || sprite_index == spr_crazyrun)
            {
                audio_stop_sound(mach3snd);
            }
            
            if (sprite_index == spr_crazyrun && !audio_is_playing(sfx_mach4N))
            {
                mach4snd = audio_play_sound(sfx_mach4N, 1, false);
                sfx_gain(mach4snd);
            }
            else if (sprite_index != spr_crazyrun)
            {
                audio_stop_sound(mach4snd);
            }
            
            if (grounded)
            {
                if ((sprite_index == spr_mach || state == UnknownEnum.Value_37) && !audio_is_playing(sfx_mach2stepN))
                {
                    mach2stepsnd = audio_play_sound(sfx_mach2stepN, 1, false);
                    sfx_gain(mach2stepsnd);
                }
                else if (sprite_index != spr_mach && state != UnknownEnum.Value_37)
                {
                    audio_stop_sound(mach2stepsnd);
                }
                
                if (state == UnknownEnum.Value_121 && sprite_index != spr_crazyrun && !audio_is_playing(sfx_mach3stepN))
                {
                    mach3stepsnd = audio_play_sound(sfx_mach3stepN, 1, false);
                    sfx_gain(mach3stepsnd);
                }
                else if (state != UnknownEnum.Value_121 || sprite_index == spr_crazyrun)
                {
                    audio_stop_sound(mach3stepsnd);
                }
                
                if (sprite_index == spr_crazyrun && !audio_is_playing(sfx_mach4stepN))
                {
                    mach4stepsnd = audio_play_sound(sfx_mach4stepN, 1, false);
                    sfx_gain(mach4stepsnd);
                }
                else if (sprite_index != spr_crazyrun)
                {
                    audio_stop_sound(mach4stepsnd);
                }
            }
            else
            {
                audio_stop_sound(mach2stepsnd);
                audio_stop_sound(mach3stepsnd);
                audio_stop_sound(mach4stepsnd);
            }
        }
        
        if (state == UnknownEnum.Value_38 && !audio_is_playing(sfx_knightslide))
        {
            knightslide = audio_play_sound(sfx_knightslide, 1, false);
            sfx_gain(knightslide);
        }
        else if (state != UnknownEnum.Value_38 && audio_is_playing(sfx_knightslide))
        {
            audio_stop_sound(knightslide);
        }
        
        if (state == UnknownEnum.Value_108 && vsp > 8 && !audio_is_playing(sfx_groundpoundloop))
        {
            groundpoundloop = audio_play_sound(sfx_groundpoundloop, 1, false);
            sfx_gain(groundpoundloop);
        }
        else if (state != UnknownEnum.Value_108 && audio_is_playing(sfx_groundpoundloop))
        {
            audio_stop_sound(groundpoundloop);
        }
        
        if ((sprite_index == spr_bombpeprun || sprite_index == spr_bombpeprunabouttoexplode) && !audio_is_playing(sfx_bombpep1))
        {
            bombpep1snd = audio_play_sound(sfx_bombpep1, 1, false);
            sfx_gain(bombpep1snd);
        }
        else if (sprite_index != spr_bombpeprun && sprite_index != spr_bombpeprunabouttoexplode && audio_is_playing(sfx_bombpep1))
        {
            audio_stop_sound(bombpep1snd);
        }
        
        if (state != UnknownEnum.Value_99 && audio_is_playing(superjumpprepsnd))
            audio_stop_sound(superjumpprepsnd);
        
        if (state != UnknownEnum.Value_99 && audio_is_playing(superjumpholdsnd))
            audio_stop_sound(superjumpholdsnd);
        
        if (sprite_index == spr_tumblestart && !audio_is_playing(sfx_tumble1) && floor(image_index) < 11)
            tumble1snd = audio_play_sound(sfx_tumble1, 1, false);
        
        sfx_gain(tumble1snd);
        
        if (sprite_index == spr_tumblestart && floor(image_index) == 11 && !audio_is_playing(sfx_tumble2))
        {
            tumble2snd = audio_play_sound(sfx_tumble2, 1, false);
            sfx_gain(tumble2snd);
            audio_stop_sound(tumble1snd);
        }
        
        if ((sprite_index == spr_tumble || sprite_index == spr_machroll) && !audio_is_playing(sfx_tumble3))
        {
            tumble3snd = audio_play_sound(sfx_tumble3, 1, false);
            sfx_gain(tumble3snd);
        }
        
        if (state != UnknownEnum.Value_5 && sprite_index != spr_machroll)
        {
            audio_stop_sound(tumble1snd);
            audio_stop_sound(tumble2snd);
            audio_stop_sound(tumble3snd);
        }
        
        if (audio_is_playing(suplexdashsnd) && state != UnknownEnum.Value_42)
            audio_stop_sound(suplexdashsnd);
        
        if (state == UnknownEnum.Value_306)
        {
            if (sprite_index == spr_playerN_wallbounce)
            {
                audio_stop_sound(tornadosnd);
                
                if (!audio_is_playing(sfx_machcancel))
                {
                    machcancelsnd = audio_play_sound(sfx_machcancel, 1, false);
                    sfx_gain(machcancelsnd);
                }
            }
            else
            {
                audio_stop_sound(machcancelsnd);
                
                if (!grounded && !audio_is_playing(sfx_tornado))
                {
                    audio_stop_sound(sfx_tornadoground);
                    tornadosnd = audio_play_sound(sfx_tornado, 1, false);
                    sfx_gain(tornadosnd);
                }
                
                if (grounded && !audio_is_playing(sfx_tornadoground))
                {
                    audio_stop_sound(sfx_tornado);
                    tornadosnd = audio_play_sound(sfx_tornadoground, 1, false);
                    sfx_gain(tornadosnd);
                }
            }
        }
        else
        {
            audio_stop_sound(tornadosnd);
            audio_stop_sound(machcancelsnd);
        }
        
        if ((sprite_index == spr_playerN_sidewayspin || sprite_index == spr_playerN_sidewayspinend) && !audio_is_playing(sfx_airspinstart) && !audio_is_playing(sfx_airspin))
        {
            airspinsnd = audio_play_sound(sfx_airspin, 1, false);
            sfx_gain(airspinsnd);
        }
        else if (sprite_index != spr_playerN_sidewayspin && sprite_index != spr_playerN_sidewayspinend)
        {
            audio_stop_sound(airspinsnd);
            audio_stop_sound(sfx_airspinstart);
        }
    }
}
