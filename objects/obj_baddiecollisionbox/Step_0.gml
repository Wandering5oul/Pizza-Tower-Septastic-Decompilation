var i, _obj_player, _playerindex, lag, _ms, _prevstate, pepp_grab;

if (!instance_exists(baddieID) && room != custom_lvl_room)
    instance_destroy();

if (instance_exists(baddieID))
{
    x = baddieID.x;
    y = baddieID.y;
    image_xscale = baddieID.image_xscale;
}

for (i = 0; i < 2; i++)
{
    _obj_player = asset_get_index(concat("obj_player", i + 1));
    _playerindex = i + 1;
    
    if (instance_exists(baddieID) && place_meeting(x, y, _obj_player) && _obj_player.cutscene == 0)
    {
        if (baddieID.state != UnknownEnum.Value_4 && !baddieID.invincible && baddieID.state != UnknownEnum.Value_17)
        {
            with (_obj_player)
            {
                if (instance_exists(other.baddieID) && y < other.baddieID.y && attacking == 0 && !global.kungfu && sprite_index != spr_player_mach2jump && ((state == UnknownEnum.Value_3 && vsp > 0) || state == UnknownEnum.Value_92 || state == UnknownEnum.Value_103 || state == UnknownEnum.Value_79) && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_stompprep && !other.baddieID.invincible)
                {
                    scr_soundeffect(52);
                    image_index = 0;
                    
                    if (other.baddieID.object_index != obj_tank)
                    {
                        if (x != other.baddieID.x)
                            other.baddieID.image_xscale = -sign(other.baddieID.x - x);
                        
                        other.baddieID.hsp = xscale * 5;
                        other.baddieID.vsp = -5;
                        other.baddieID.state = UnknownEnum.Value_138;
                        
                        if (other.baddieID.stunned < 100)
                            other.baddieID.stunned = 100;
                        
                        other.baddieID.xscale = 1.4;
                        other.baddieID.yscale = 0.6;
                    }
                    
                    if (key_jump2)
                    {
                        instance_create(x, y + 50, obj_stompeffect);
                        stompAnim = 1;
                        vsp = -14;
                        
                        if (state == UnknownEnum.Value_92)
                            sprite_index = spr_stompprep;
                    }
                    else
                    {
                        instance_create(x, y + 50, obj_stompeffect);
                        stompAnim = 1;
                        vsp = -9;
                        
                        if (state == UnknownEnum.Value_92)
                            sprite_index = spr_stompprep;
                    }
                }
                
                if (instance_exists(other.baddieID) && state == UnknownEnum.Value_41 && sprite_index != spr_chainsawhitwall && sprite_index != spr_chainsawcrouch && !array_contains(chainsawd, other.baddieID))
                {
                    image_index = 0;
                    sprite_index = spr_chainsawhit;
                    baddiegrabbedID = other.baddieID;
                    other.baddieID.state = UnknownEnum.Value_4;
                    other.baddieID.grabbedby = _playerindex;
                    array_push(chainsawd, other.baddieID);
                }
                
                if (instance_exists(other.baddieID) && state == UnknownEnum.Value_44)
                {
                    other.baddieID.grabbedby = _playerindex;
                    other.baddieID.state = UnknownEnum.Value_4;
                    other.baddieID.hp = -99;
                    
                    if (key_down)
                    {
                        sprite_index = spr_piledriver;
                        vsp = -5;
                        state = UnknownEnum.Value_76;
                        image_index = 0;
                        image_speed = 0.35;
                    }
                    else
                    {
                        sprite_index = choose(spr_finishingblow1, spr_finishingblow2, spr_finishingblow3, spr_finishingblow4, spr_finishingblow5);
                        image_index = 0;
                        hsp = 0;
                        movespeed = 0;
                        state = UnknownEnum.Value_6;
                    }
                }
                
                if (instance_exists(other.baddieID) && other.baddieID.state != 204 && !other.baddieID.invincible && state == UnknownEnum.Value_193)
                {
                    other.baddieID.ratplayerid = id;
                    other.baddieID.state = 204;
                    ratgrabbedID = other.baddieID.id;
                    state = UnknownEnum.Value_191;
                }
                
                if (instance_exists(other.baddieID) && other.baddieID.invtime == 0 && ((other.baddieID.object_index != obj_bigcheese && other.baddieID.object_index != obj_pepbat) || state != UnknownEnum.Value_5) && ((state == UnknownEnum.Value_42 && global.attackstyle == 1) || instakillmove == 1) && other.baddieID.state != UnknownEnum.Value_4 && !other.baddieID.invincible && other.baddieID.instantkillable && state != UnknownEnum.Value_41)
                {
                    if (state == UnknownEnum.Value_121 && sprite_index != spr_mach3hit && (character == "P" || character == "V"))
                    {
                        if (fightball == 0)
                            sprite_index = spr_mach3hit;
                        
                        image_index = 0;
                    }
                    
                    other.baddieID.invtime = 25;
                    
                    if (object_index == obj_player1)
                        other.baddieID.grabbedby = 1;
                    else
                        other.baddieID.grabbedby = 2;
                    
                    scr_soundeffect(74);
                    
                    if (!other.baddieID.important)
                    {
                        if (state == UnknownEnum.Value_121)
                            global.style += (10 + global.combo);
                        else
                            global.style += (5 + global.combo);
                    }
                    
                    if (state == UnknownEnum.Value_121)
                        other.baddieID.mach3destroy = 1;
                    
                    if (!other.baddieID.killprotection && !global.kungfu)
                    {
                        other.baddieID.hp -= 99;
                        other.baddieID.instakilled = 1;
                    }
                    
                    if (!other.baddieID.important)
                    {
                        global.combotime = 60;
                        global.heattime = 60;
                        global.combo += 1;
                    }
                    
                    global.hit += 1;
                    supercharge++;
                    
                    if (!grounded && state != UnknownEnum.Value_108 && (key_jump2 || input_buffer_jump == 0))
                    {
                        if (state == UnknownEnum.Value_121 && fightball == 0)
                            sprite_index = spr_player_mach2jump;
                        
                        suplexmove = 0;
                        vsp = -11;
                    }
                    
                    if (character == "M" && state == UnknownEnum.Value_108)
                    {
                        vsp = -11;
                        state = UnknownEnum.Value_92;
                        sprite_index = spr_jump;
                    }
                    
                    if (state != UnknownEnum.Value_61)
                    {
                        tauntstoredmovespeed = movespeed;
                        tauntstoredsprite = sprite_index;
                        tauntstoredstate = state;
                        tauntstoredvsp = vsp;
                    }
                    
                    if (state == UnknownEnum.Value_42 && !key_slap)
                    {
                        image_index = random_range(0, image_number - 1);
                        
                        if (grounded)
                            sprite_index = spr_player_groundedattack;
                        else
                            sprite_index = spr_player_ungroundedattack;
                    }
                    
                    lag = 5;
                    other.baddieID.hitLag = lag;
                    other.baddieID.hitX = other.baddieID.x;
                    other.baddieID.hitY = other.baddieID.y;
                    other.baddieID.hp -= 1;
                    hitLag = lag;
                    hitX = x;
                    hitY = y;
                    instance_create(other.baddieID.x, other.baddieID.y, obj_parryeffect);
                    other.baddieID.alarm[3] = 3;
                    other.baddieID.state = UnknownEnum.Value_137;
                    other.baddieID.image_xscale = -xscale;
                    instance_create(x, y, obj_slapstar);
                    instance_create(x, y, obj_slapstar);
                    instance_create(x, y, obj_slapstar);
                    instance_create(x, y, obj_baddiegibs);
                    instance_create(x, y, obj_baddiegibs);
                    instance_create(x, y, obj_baddiegibs);
                    
                    with (obj_camera)
                    {
                        shake_mag = 3;
                        shake_mag_acc = 3 / room_speed;
                    }
                    
                    if (key_up)
                    {
                        other.baddieID.hitvsp = -11;
                        other.baddieID.hithsp = 0;
                    }
                    else if (key_down)
                    {
                        other.baddieID.hitvsp = 11;
                        other.baddieID.hithsp = 0;
                    }
                    else
                    {
                        other.baddieID.hitvsp = -2;
                        other.baddieID.hithsp = -other.baddieID.image_xscale * 8;
                    }
                    
                    state = UnknownEnum.Value_61;
                }
                else if (state == UnknownEnum.Value_42 && global.attackstyle == 0)
                {
                    if (sprite_index == spr_suplexdash)
                    {
                        image_index = 0;
                        sprite_index = spr_haulingstart;
                        state = UnknownEnum.Value_79;
                        baddiegrabbedID = other.baddieID;
                        grabbingenemy = 1;
                        other.baddieID.state = UnknownEnum.Value_4;
                        other.baddieID.grabbedby = _playerindex;
                    }
                    else if (sprite_index == spr_player_lunge)
                    {
                        DoFinisher();
                    }
                }
                else if (state == UnknownEnum.Value_42 && global.attackstyle == 3)
                {
                    _ms = movespeed;
                    movespeed = 0;
                    baddiegrabbedID = other.baddieID;
                    grabbingenemy = 1;
                    _prevstate = other.baddieID.state;
                    other.baddieID.state = UnknownEnum.Value_4;
                    other.baddieID.grabbedby = _playerindex;
                    
                    if (global.pummeltest)
                    {
                        if (image_index > 6)
                        {
                            if (key_up)
                            {
                                state = UnknownEnum.Value_6;
                                sprite_index = spr_uppercutfinishingblow;
                                image_index = 4;
                                movespeed = 0;
                            }
                            else if (key_down)
                            {
                                sprite_index = spr_piledriver;
                                vsp = -5;
                                state = UnknownEnum.Value_76;
                                image_index = 4;
                                image_speed = 0.35;
                            }
                            else
                            {
                                state = UnknownEnum.Value_6;
                                sprite_index = spr_player_lungehit;
                                image_index = 0;
                            }
                        }
                        else
                        {
                            other.baddieID.state = _prevstate;
                            grabbingenemy = 0;
                            movespeed = _ms;
                        }
                    }
                    else
                    {
                        image_index = 0;
                        
                        if (key_up)
                        {
                            state = UnknownEnum.Value_6;
                            sprite_index = spr_uppercutfinishingblow;
                            image_index = 4;
                            movespeed = 0;
                        }
                        else if (key_down)
                        {
                            sprite_index = spr_piledriver;
                            vsp = -5;
                            state = UnknownEnum.Value_76;
                            image_index = 4;
                            image_speed = 0.35;
                        }
                        else
                        {
                            state = UnknownEnum.Value_6;
                            sprite_index = spr_player_lungehit;
                            image_index = 0;
                        }
                    }
                }
                
                if (place_meeting(x, y + 1, other) && state == UnknownEnum.Value_58 && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_playerN_pogobounce && !other.baddieID.invincible)
                {
                    switch (pogochargeactive)
                    {
                        case 0:
                            pogospeedprev = 0;
                            other.baddieID.vsp = -3;
                            scr_soundeffect(52);
                            other.baddieID.state = UnknownEnum.Value_138;
                            
                            if (other.baddieID.stunned < 100)
                                other.baddieID.stunned = 100;
                            
                            sprite_index = spr_playerN_pogobounce;
                            break;
                        
                        case 1:
                            pogospeedprev = 0;
                            scr_throwenemy();
                            sprite_index = spr_playerN_pogobouncemach;
                            break;
                    }
                    
                    instance_create(x, y + 50, obj_stompeffect);
                    image_index = 0;
                    movespeed = 0;
                    vsp = 0;
                }
                
                pepp_grab = 0;
                
                if (character == "M" && instance_exists(other.baddieID) && (state == UnknownEnum.Value_0 || state == UnknownEnum.Value_92) && pepperman_grabID == -4 && sprite_index != spr_pepperman_throw && other.baddieID.state == UnknownEnum.Value_138 && other.baddieID.stuntouchbuffer == 0 && !other.baddieID.thrown && !other.baddieID.invincible)
                {
                    other.baddieID.pepperman_grab = 1;
                    pepperman_grabID = other.baddieID.id;
                    other.baddieID.state = UnknownEnum.Value_4;
                    other.baddieID.grabbedby = _playerindex;
                    pepp_grab = 1;
                }
                
                if (instance_exists(other.baddieID) && other.baddieID.object_index != obj_bigcheese && (state == UnknownEnum.Value_5 || state == UnknownEnum.Value_104 || sprite_index == spr_chainsawcrouch) && other.baddieID.state != UnknownEnum.Value_80 && other.baddieID.state != UnknownEnum.Value_137 && !pepp_grab && other.baddieID.thrown == 0 && other.baddieID.stuntouchbuffer <= 0 && other.baddieID.state != UnknownEnum.Value_4 && other.baddieID.state != UnknownEnum.Value_41 && other.baddieID.state != UnknownEnum.Value_61 && !other.baddieID.invincible)
                {
                    lag = 5;
                    other.baddieID.stuntouchbuffer = 15;
                    
                    with (other.baddieID)
                    {
                        xscale = 0.8;
                        yscale = 1.3;
                        hp -= 1;
                        instance_create(x, y, obj_bangeffect);
                        state = UnknownEnum.Value_137;
                        image_xscale = -other.xscale;
                        hithsp = ((other.x + ((other.movespeed + 0.5) * 60 * other.xscale)) - x) / 60;
                        hitvsp = (other.y - 180 - y) / 60;
                        hitLag = lag;
                        hitX = x;
                        hitY = y;
                        invtime = lag + 5;
                        flash = 1;
                    }
                    
                    tauntstoredstate = state;
                    tauntstoredsprite = sprite_index;
                    tauntstoredmovespeed = movespeed;
                    tauntstoredvsp = 0;
                    state = UnknownEnum.Value_61;
                    hitLag = lag;
                    hitX = x;
                    hitY = y;
                    scr_soundeffect(54);
                    
                    repeat (2)
                    {
                        with (create_debris(x, y, 1288))
                            vsp = irandom_range(-6, -11);
                    }
                    
                    instance_create(other.x, other.y, obj_parryeffect);
                }
                
                if (character != "M" && instance_exists(other.baddieID) && state == UnknownEnum.Value_55 && !other.baddieID.invincible)
                {
                    if (instance_exists(other.baddieID) && y < (other.baddieID.y - 50) && attacking == 0 && state != UnknownEnum.Value_42 && other.baddieID.state != UnknownEnum.Value_4 && sprite_index != spr_player_mach2jump && (state == UnknownEnum.Value_92 || state == UnknownEnum.Value_103 || (state == UnknownEnum.Value_79 && sprite_index != spr_swingding)) && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_stompprep && !other.baddieID.invincible)
                    {
                        scr_soundeffect(52);
                        
                        if (x != other.baddieID.x)
                            other.baddieID.image_xscale = -sign(other.baddieID.x - x);
                        
                        image_index = 0;
                        other.baddieID.state = UnknownEnum.Value_138;
                        
                        if (other.baddieID.stunned < 100)
                            other.baddieID.stunned = 100;
                        
                        if (key_jump2)
                        {
                            instance_create(x, y + 50, obj_stompeffect);
                            stompAnim = 1;
                            other.baddieID.image_index = 0;
                            vsp = -14;
                            
                            if (state != UnknownEnum.Value_79)
                                sprite_index = spr_stompprep;
                        }
                        else
                        {
                            instance_create(x, y + 50, obj_stompeffect);
                            stompAnim = 1;
                            other.baddieID.image_index = 0;
                            vsp = -9;
                            
                            if (state != UnknownEnum.Value_79)
                                sprite_index = spr_stompprep;
                        }
                    }
                    
                    if (other.baddieID.thrown == 0 && (character == "P" || character == "N"))
                    {
                        movespeed = 0;
                        image_index = 0;
                        sprite_index = spr_haulingstart;
                        state = UnknownEnum.Value_79;
                        other.baddieID.state = UnknownEnum.Value_4;
                        other.baddieID.grabbedby = _playerindex;
                    }
                }
            }
        }
    }
}
