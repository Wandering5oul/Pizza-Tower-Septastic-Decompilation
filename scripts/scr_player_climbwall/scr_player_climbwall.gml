function scr_player_climbwall()
{
    var t, _bump;
    
    switch (character)
    {
        case "P":
            if (windingAnim < 200)
                windingAnim++;
            
            move = key_left + key_right;
            suplexmove = 0;
            vsp = -wallspeed;
            t = (sprite_index == spr_chainsawclimbwall) ? 28 : 24;
            
            if (wallspeed < t && move == xscale)
                wallspeed += 0.15;
            
            if (place_meeting(x, y, obj_verticalhallway))
                verticalbuffer = 2;
            
            crouchslideAnim = 1;
            
            if (sprite_index != spr_chainsawclimbwall)
            {
                sprite_index = !skateboarding ? spr_machclimbwall : spr_clownwallclimb;
            }
            else if (grabclimbbuffer <= 0)
            {
                wallspeed -= 4;
                sprite_index = !skateboarding ? spr_machclimbwall : spr_clownwallclimb;
            }
            
            if (key_slap2 && chainsawcutscene && !skateboarding && sprite_index != spr_chainsawclimbwall)
            {
                wallspeed += 4;
                sprite_index = spr_chainsawclimbwall;
                image_index = 0;
                grabclimbbuffer = 30;
            }
            
            if (grabclimbbuffer > 0)
                grabclimbbuffer--;
            
            if (!key_attack && !skateboarding && grabclimbbuffer <= 0 && sprite_index != spr_chainsawclimbwall)
            {
                state = UnknownEnum.Value_0;
                movespeed = 0;
            }
            
            if (verticalbuffer <= 0 && place_meeting(x, y - 1, obj_solid) && !place_meeting(x, y - 1, obj_verticalhallway) && !place_meeting(x, y - 1, obj_destructibles) && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)) && !place_meeting(x - sign(hsp), y, obj_slope))
            {
                trace("climbwall hit head");
                
                if (!skateboarding)
                {
                    sprite_index = spr_superjumpland;
                    scr_soundeffect(55);
                    image_index = 0;
                    state = UnknownEnum.Value_123;
                    machhitAnim = 0;
                }
                else if (!key_jump)
                {
                    state = UnknownEnum.Value_106;
                    hsp = -2.5 * xscale;
                    vsp = -3;
                    mach2 = 0;
                    wallspeed = 0;
                    image_index = 0;
                }
            }
            
            if (verticalbuffer <= 0 && !scr_solid(x + xscale, y) && !place_meeting(x, y, obj_verticalhallway) && !place_meeting(x, y - 12, obj_verticalhallway))
            {
                trace("climbwall out");
                instance_create(x, y, obj_jumpdust);
                vsp = 0;
                
                if (sprite_index == spr_chainsawclimbwall)
                {
                    _bump = ledge_bump(24);
                    state = UnknownEnum.Value_41;
                    sprite_index = spr_chainsawdash;
                    movespeed = wallspeed;
                }
                else if ((wallspeed >= 6 && wallspeed < 12) || skateboarding)
                {
                    _bump = ledge_bump(24);
                    state = UnknownEnum.Value_104;
                    movespeed = wallspeed;
                }
                else if (wallspeed >= 12)
                {
                    _bump = ledge_bump(24);
                    state = UnknownEnum.Value_121;
                    sprite_index = spr_mach4;
                    movespeed = wallspeed;
                }
            }
            
            if (ispeppino && key_jump)
            {
                if (sprite_index == spr_chainsawclimbwall)
                {
                    movespeed = 12;
                    state = UnknownEnum.Value_41;
                    image_index = 0;
                    sprite_index = spr_chainsawdash;
                }
                else
                {
                    movespeed = 10;
                    state = UnknownEnum.Value_104;
                    image_index = 0;
                    sprite_index = spr_walljumpstart;
                    
                    if (skateboarding)
                        sprite_index = spr_clownjump;
                }
                
                vsp = -11;
                xscale *= -1;
                jumpstop = 0;
                walljumpbuffer = 4;
            }
            
            if (verticalbuffer <= 0 && ((grounded && wallspeed <= 0) || wallspeed <= 0) && !skateboarding)
            {
                state = UnknownEnum.Value_92;
                sprite_index = spr_fall;
            }
            
            image_speed = 0.6;
            
            if (!instance_exists(obj_cloudeffect))
                instance_create(x, y + 43, obj_cloudeffect);
            
            if (!ispeppino && !skateboarding && !global.option_septmoveset)
            {
                with (instance_create(x, y, obj_noiseeffect))
                    sprite_index = spr_noisewalljumpeffect;
                
                sprite_index = spr_playerN_wallbounce;
                state = UnknownEnum.Value_306;
                savedmove = xscale;
                vsp = -(17 * (1 - (noisewalljump * 0.15)));
                noisewalljump++;
                hsp = 0;
                movespeed = 0;
                image_index = 0;
                scr_soundeffect(197);
            }
            
            break;
        
        case "V":
            if (windingAnim < 200)
                windingAnim++;
            
            move = key_left + key_right;
            suplexmove = 0;
            vsp = -wallspeed;
            
            if (wallspeed < 24 && move == xscale)
                wallspeed += 0.1;
            
            crouchslideAnim = 1;
            sprite_index = spr_machclimbwall;
            
            if (!key_attack)
            {
                state = UnknownEnum.Value_0;
                movespeed = 0;
            }
            
            if (scr_solid(x, y - 1) && !place_meeting(x, y - 1, obj_destructibles) && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)) && !place_meeting(x - sign(hsp), y, obj_slope))
            {
                sprite_index = spr_superjumpland;
                scr_soundeffect(55);
                image_index = 0;
                state = UnknownEnum.Value_123;
                machhitAnim = 0;
            }
            
            if (!scr_solid(x + xscale, y) && !place_meeting(x, y, obj_verticalhallway))
            {
                instance_create(x, y, obj_jumpdust);
                vsp = 0;
                
                if (movespeed >= 6)
                    state = UnknownEnum.Value_104;
                
                if (movespeed >= 12)
                {
                    state = UnknownEnum.Value_121;
                    sprite_index = spr_mach4;
                }
            }
            
            if (key_jump)
            {
                movespeed = 8;
                state = UnknownEnum.Value_104;
                image_index = 0;
                sprite_index = spr_walljumpstart;
                vsp = -11;
                xscale *= -1;
                jumpstop = 0;
            }
            
            if ((grounded && wallspeed <= 0) || wallspeed <= 0)
            {
                state = UnknownEnum.Value_92;
                sprite_index = spr_fall;
            }
            
            image_speed = 0.6;
            
            if (!instance_exists(obj_cloudeffect))
                instance_create(x, y + 43, obj_cloudeffect);
            
            break;
        
        case "N":
            hsp = 0;
            
            if (sprite_index == spr_playerN_wallclingstart && floor(image_index) == (image_number - 1))
                sprite_index = spr_playerN_wallcling;
            
            if (sprite_index == spr_playerN_wallcling)
                vsp = 2;
            else
                vsp = 0;
            
            wallclingcooldown = 0;
            
            if (floor(image_index) == (image_number - 1) || !key_jump2)
            {
                vsp = -15;
                state = UnknownEnum.Value_92;
                sprite_index = spr_playerN_jump;
                image_index = 0;
            }
            
            if (key_jump)
            {
                vsp = -15;
                state = UnknownEnum.Value_92;
                sprite_index = spr_playerN_jump;
                image_index = 0;
            }
            
            image_speed = 0.35;
            break;
    }
}
