function baddiecollisionbox_update(argument0)
{
    var _destroy, _stagger, pepp_grab;
    
    if (argument0.cutscene == 0 && argument0.state != UnknownEnum.Value_10)
    {
        with (argument0)
        {
            _destroy = 0;
            _stagger = 0;
            
            if (instance_exists(other.baddieID) && instakillmove == 1 && other.baddieID.state != UnknownEnum.Value_4 && other.baddieID.thrown == 0 && !other.baddieID.invincible && other.baddieID.instantkillable)
            {
                if (state == UnknownEnum.Value_121 && sprite_index != spr_mach3hit && (character == "P" || character == "V"))
                {
                    if (fightball == 0)
                        sprite_index = spr_mach3hit;
                    
                    image_index = 0;
                    _destroy = 1;
                }
                else if (state == UnknownEnum.Value_97 || (state == UnknownEnum.Value_108 && freefallsmash > 10))
                {
                    _destroy = 1;
                }
                
                if ((state == UnknownEnum.Value_104 || state == UnknownEnum.Value_65) && grounded)
                {
                    machpunchAnim = 1;
                    image_index = 0;
                }
                
                if (!grounded && state != UnknownEnum.Value_108 && key_jump2)
                {
                    if (state == UnknownEnum.Value_104 || (state == UnknownEnum.Value_121 && fightball == 0))
                        sprite_index = spr_mach2jump;
                    
                    suplexmove = 0;
                    vsp = -11;
                }
                
                if (!_destroy && !_stagger)
                {
                    if (other.baddieID.hp > 0)
                    {
                        _stagger = 1;
                        
                        if (state == UnknownEnum.Value_108 && freefallsmash < 10)
                        {
                            vsp = -11;
                            state = UnknownEnum.Value_92;
                            sprite_index = spr_jump;
                        }
                    }
                    else
                    {
                        _destroy = 1;
                    }
                }
                
                if (character == "M" && state == UnknownEnum.Value_108)
                {
                    vsp = -11;
                    state = UnknownEnum.Value_92;
                    sprite_index = spr_jump;
                }
                
                if (_destroy)
                {
                    scr_soundeffect(74);
                    instance_destroy(other.baddieID);
                    
                    if (!other.baddieID.important)
                    {
                        global.hit += 1;
                        global.combotime = 60;
                        global.heattime = 60;
                    }
                }
                
                if (_stagger && other.baddieID.state != UnknownEnum.Value_155)
                {
                    scr_soundeffect(56);
                    
                    with (other.baddieID)
                    {
                        hp -= ((state == UnknownEnum.Value_104 || state == UnknownEnum.Value_65) ? 1 : 2);
                        state = (hp > 0) ? UnknownEnum.Value_155 : UnknownEnum.Value_138;
                        stagger_buffer = stagger_max;
                        stagger_dir = other.xscale;
                    }
                }
            }
            
            pepp_grab = 0;
            
            if (character == "M" && instance_exists(other.baddieID) && (state == UnknownEnum.Value_0 || state == UnknownEnum.Value_92) && state != UnknownEnum.Value_154 && pepperman_grabID == -4 && sprite_index != spr_pepperman_throw && other.baddieID.state == UnknownEnum.Value_155 && other.baddieID.state != UnknownEnum.Value_154 && other.baddieID.state != UnknownEnum.Value_138 && other.baddieID.stuntouchbuffer == 0 && !other.baddieID.thrown && !other.baddieID.invincible)
            {
                other.baddieID.pepperman_grab = 1;
                pepperman_grabID = other.baddieID.id;
                other.baddieID.state = UnknownEnum.Value_4;
                other.baddieID.grabbedby = (object_index == obj_player1) ? 1 : 2;
                pepp_grab = 1;
            }
            
            if (instance_exists(other.baddieID) && y < other.baddieID.y && attacking == 0 && sprite_index != spr_player_mach2jump && (state == UnknownEnum.Value_92 || state == UnknownEnum.Value_103 || state == UnknownEnum.Value_79) && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_stompprep && !other.baddieID.invincible && other.baddieID.stompable)
            {
                scr_soundeffect(52);
                
                if (x != other.baddieID.x)
                    other.baddieID.image_xscale = -sign(other.baddieID.x - x);
                
                image_index = 0;
                other.baddieID.stagger_buffer = other.baddieID.stagger_max;
                other.baddieID.stagger_dir = xscale;
                
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
            
            if (instance_exists(other.baddieID) && !pepp_grab && !_stagger && !_destroy && other.baddieID.thrown == 0 && other.baddieID.stuntouchbuffer == 0 && other.baddieID.vsp > 0 && state != UnknownEnum.Value_124 && state != UnknownEnum.Value_80 && state != UnknownEnum.Value_91 && state != UnknownEnum.Value_76 && state != UnknownEnum.Value_58 && state != UnknownEnum.Value_105 && state != UnknownEnum.Value_154 && other.baddieID.state != UnknownEnum.Value_4 && other.baddieID.state != UnknownEnum.Value_154 && state != UnknownEnum.Value_108 && state != UnknownEnum.Value_79 && state != UnknownEnum.Value_104 && state != UnknownEnum.Value_42 && state != UnknownEnum.Value_107 && other.baddieID.state != 141 && state != UnknownEnum.Value_121 && state != UnknownEnum.Value_65 && state != UnknownEnum.Value_37 && other.baddieID.bumpable && !other.baddieID.invincible)
            {
                scr_soundeffect(56);
                
                if (state != UnknownEnum.Value_51 && state != UnknownEnum.Value_103 && state != UnknownEnum.Value_102 && character != "M")
                    movespeed = 0;
                
                other.baddieID.stuntouchbuffer = 50;
                
                if (other.baddieID.object_index == obj_pizzaball)
                    global.golfhit += 1;
                
                if (x != other.baddieID.x)
                    other.baddieID.image_xscale = -sign(other.baddieID.x - x);
                
                other.baddieID.stagger_buffer = other.baddieID.stagger_max;
                other.baddieID.stagger_dir = xscale;
                other.baddieID.state = (other.baddieID.hp > 0) ? UnknownEnum.Value_155 : UnknownEnum.Value_138;
                other.baddieID.image_index = 0;
            }
            
            if (instance_exists(other.baddieID) && state == UnknownEnum.Value_42 && !other.baddieID.invincible)
            {
                if (other.baddieID.state != UnknownEnum.Value_138)
                {
                    state = UnknownEnum.Value_154;
                    sprite_index = spr_grab;
                    image_speed = 0.35;
                    image_index = 0;
                    other.baddieID.state = UnknownEnum.Value_154;
                    other.baddieID.grabbedby = (object_index == obj_player1) ? 1 : 2;
                }
                else if (other.baddieID.thrown == 0 && (character == "P" || character == "N"))
                {
                    movespeed = 0;
                    image_index = 0;
                    sprite_index = spr_haulingstart;
                    state = UnknownEnum.Value_79;
                    baddiegrabbedID = other.baddieID;
                    other.baddieID.state = UnknownEnum.Value_4;
                    other.baddieID.grabbedby = 1;
                }
                else
                {
                    if (other.baddieID.thrown == 1 && !key_up)
                    {
                        other.baddieID.hsp = xscale * 25;
                        other.baddieID.vsp = 0;
                    }
                    else if (!key_up)
                    {
                        other.baddieID.hsp = xscale * 6;
                        scr_soundeffect(54);
                        image_index = 0;
                        state = UnknownEnum.Value_91;
                        baddiegrabbedID = other.baddieID;
                        movespeed = 0;
                        other.baddieID.vsp = -6;
                        scr_throwenemy();
                    }
                    else
                    {
                        other.baddieID.vsp = -14;
                        other.baddieID.hsp = 0;
                    }
                    
                    sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch);
                    scr_soundeffect(54);
                    image_index = 0;
                    state = UnknownEnum.Value_91;
                    movespeed = 0;
                    scr_throwenemy();
                }
            }
        }
    }
}
