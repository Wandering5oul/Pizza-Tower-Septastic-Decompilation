function scr_hurtplayer(argument0)
{
    var loseamount;
    
    with (argument0)
    {
        if (global.failcutscene)
            continue;
        
        if (state == UnknownEnum.Value_147)
            continue;
        
        if (state == UnknownEnum.Value_42 && flash == 1)
            continue;
        
        if (state == UnknownEnum.Value_84 || state == UnknownEnum.Value_61)
            continue;
        
        if (global.kungfu)
        {
            if (state == UnknownEnum.Value_205)
            {
                if (sprite_index != spr_player_airattackstart)
                {
                    instance_create(x, y, obj_parryeffect);
                    image_index = 0;
                }
                
                sprite_index = spr_player_airattackstart;
                hsp = -xscale * 2;
            }
            else if (state != UnknownEnum.Value_156 && state != UnknownEnum.Value_137 && !hurted)
            {
                instance_create(x, y, obj_parryeffect);
                
                repeat (5)
                {
                    with (create_debris(x, y, 1288))
                        vsp = irandom_range(-6, -11);
                }
                
                hitLag = 3;
                hitxscale = (x != other.x) ? sign(other.x - x) : -other.image_xscale;
                state = UnknownEnum.Value_137;
                hitstunned = 50;
                hurted = 1;
                alarm[7] = hitstunned + 30;
                hithsp = 12;
                hitvsp = -5;
                hitX = x;
                hitY = y;
                sprite_index = spr_hurt;
                
                if (global.hp > 1)
                {
                    global.hp--;
                    
                    with (obj_camera)
                        healthshaketime = 60;
                }
                else
                {
                    with (obj_music)
                        arena = 0;
                    
                    global.kungfu = 0;
                    
                    if (!instance_exists(obj_fadeout))
                    {
                        with (obj_player)
                            targetRoom = lastroom;
                        
                        instance_create(x, y, obj_fadeout);
                    }
                }
            }
        }
        else if (isgustavo)
        {
            if (!hurted)
            {
                state = UnknownEnum.Value_196;
                movespeed = 12;
                vsp = -5;
                flash = 1;
                scr_soundeffect(50);
                alarm[8] = 100;
                hurted = 1;
                instance_create(x, y, obj_spikehurteffect);
            }
        }
        else if (state == UnknownEnum.Value_70)
        {
        }
        else if ((state == UnknownEnum.Value_47 || state == UnknownEnum.Value_48 || state == UnknownEnum.Value_38 || state == UnknownEnum.Value_49) && cutscene == 0)
        {
        }
        else if (state == UnknownEnum.Value_16)
        {
        }
        else if (state == UnknownEnum.Value_17)
        {
            state = UnknownEnum.Value_16;
            
            with (obj_baddie)
            {
                if (is_controllable && state == UnknownEnum.Value_17 && playerid == other.id)
                    instance_destroy();
            }
        }
        else if (state == UnknownEnum.Value_94)
        {
        }
        else if (state == UnknownEnum.Value_51 && hurted == 0)
        {
        }
        else if (state == UnknownEnum.Value_31)
        {
        }
        else if (state == UnknownEnum.Value_33)
        {
            hsp = -xscale * 4;
            vsp = -5;
            state = UnknownEnum.Value_106;
            sprite_index = spr_bump;
            alarm[5] = 2;
            alarm[8] = 60;
            alarm[7] = 120;
            hurted = 1;
        }
        else if (pizzashield == 1)
        {
            pizzashield = 0;
            
            with (instance_create(x, y, obj_sausageman_dead))
                sprite_index = spr_pizzashield_collectible;
            
            hsp = -xscale * 4;
            vsp = -5;
            state = UnknownEnum.Value_106;
            sprite_index = spr_bump;
            invhurt_buffer = 120;
            alarm[8] = 60;
            alarm[7] = 120;
            hurted = 1;
            scr_soundeffect(50);
        }
        else if (state != UnknownEnum.Value_107 && state != UnknownEnum.Value_196 && state != UnknownEnum.Value_4 && (hurted == 0 || state == UnknownEnum.Value_24 || state == UnknownEnum.Value_29 || state == UnknownEnum.Value_30) && cutscene == 0)
        {
            if (instance_exists(obj_hardmode))
                global.heatmeter_count = (global.heatmeter_threshold - 1) * global.heatmeter_threshold_count;
            
            if (instance_exists(obj_bosscontroller))
                obj_bosscontroller.player_hp -= 30;
            
            global.combo = 0;
            global.combotime = clamp(global.combotime - 15, 0, 60);
            global.heattime = 0;
            global.style -= 25;
            
            if (character == "V")
                global.playerhealth -= 25;
            
            if (state == UnknownEnum.Value_11)
            {
                with (instance_create(x, y, obj_sausageman_dead))
                    sprite_index = spr_mortdead;
                
                repeat (6)
                {
                    with (instance_create(x, y, obj_debris))
                        sprite_index = spr_feather;
                }
                
                grav = 0.5;
            }
            else if (state == UnknownEnum.Value_113 || state == UnknownEnum.Value_115 || state == UnknownEnum.Value_114 || state == UnknownEnum.Value_116)
            {
                repeat (4)
                    create_debris(x, y, 539);
            }
            
            if (global.kungfu)
            {
                if (global.hp > 1)
                {
                    global.hp--;
                    
                    with (obj_camera)
                        healthshaketime = 60;
                }
                else
                {
                    with (obj_music)
                        arena = 0;
                    
                    global.kungfu = 0;
                    
                    if (!instance_exists(obj_fadeout))
                    {
                        with (obj_player)
                            targetRoom = lastroom;
                        
                        instance_create(x, y, obj_fadeout);
                    }
                }
            }
            
            if (state == UnknownEnum.Value_4)
            {
                if (object_index == obj_player1)
                    y = obj_player2.y;
                else
                    y = obj_player1.y;
            }
            
            scr_sleep(100);
            scr_soundeffect(50);
            
            if (irandom(100) <= 50)
            {
                if (ispeppino)
                    scr_soundeffect(222, 226);
                else
                    scr_soundeffect(3, 61, 13, 26);
            }
            
            alarm[8] = 100;
            alarm[7] = 150;
            hurted = 1;
            tv_add_expression(spr_tv_exprhurt, 60, 110);
            
            if (xscale == other.image_xscale)
                sprite_index = spr_hurtjump;
            else
                sprite_index = spr_hurt;
            
            movespeed = 8;
            vsp = -14;
            timeuntilhpback = 300;
            instance_create(x, y, obj_spikehurteffect);
            state = UnknownEnum.Value_107;
            image_index = 0;
            flash = 1;
            global.hurtcounter += 1;
            loseamount = 50 * (global.stylethreshold + 1);
            
            if (global.pizzadelivery == 0)
            {
                if (global.collect > loseamount)
                    global.collect -= loseamount;
                else
                    global.collect = 0;
            }
            
            if (global.pizzadelivery == 0)
            {
                if (global.collect != 0)
                {
                    if (character == "P" || character == "V")
                    {
                        repeat (10)
                        {
                            with (instance_create(x, y, obj_pizzaloss))
                                sprite_index = choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect);
                        }
                    }
                    else
                    {
                        repeat (10)
                            instance_create(x, y, obj_pizzaloss);
                    }
                }
            }
        }
    }
}
