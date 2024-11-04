var hit;

if (!instance_exists(bossID) && bossID != -4 && state != UnknownEnum.Value_98 && !fakedeath)
{
    state = UnknownEnum.Value_98;
    alarm[1] = room_speed * 4;
}

if (player_hp <= 0)
{
    fakedeath = 0;
    
    if (state != UnknownEnum.Value_8 && state != UnknownEnum.Value_89)
    {
        if (endroundfunc != -4)
            endroundfunc();
        
        depth = obj_player1.depth + 1;
        state = UnknownEnum.Value_8;
        
        with (bossID)
            player_destroy(lastplayerid);
    }
    else if (bossID.state != UnknownEnum.Value_61 && state != UnknownEnum.Value_89)
    {
        state = UnknownEnum.Value_89;
        alarm[1] = room_speed * 4;
    }
}

if (instance_exists(bossID))
{
    if (bossID.destroyed && !fakedeath)
    {
        depth = bossID.depth + 1;
        state = UnknownEnum.Value_8;
    }
}

switch (state)
{
    case UnknownEnum.Value_144:
        with (obj_player)
        {
            state = UnknownEnum.Value_146;
            xscale = (x > (room_width / 2)) ? -1 : 1;
            image_blend = make_colour_hsv(0, 0, 255);
        }
        
        with (par_boss)
        {
            state = UnknownEnum.Value_146;
            x = xstart;
        }
        
        if (playerx != 0)
        {
            playerx += 5;
        }
        else if (!flashed)
        {
            flash = 1;
            flashed = 1;
            alarm[2] = 0.15 * room_speed;
        }
        
        if (bossx != (room_width - sprite_get_width(bossspr)))
            bossx -= 5;
        
        if (vsy != 0)
            vsy += 5;
        
        flamey -= 4;
        
        if (intro_buffer > 0)
        {
            intro_buffer--;
        }
        else if (use_countdown)
        {
            state = 145;
        }
        else
        {
            state = UnknownEnum.Value_0;
            
            with (obj_player)
            {
                if (object_index != obj_player2 || global.coop)
                    state = UnknownEnum.Value_0;
            }
            
            with (par_boss)
                state = UnknownEnum.Value_0;
        }
        
        break;
    
    case 145:
        if (timer_buffer > 0)
        {
            timer_buffer--;
            instance_destroy(obj_noisebossbomb);
            
            with (obj_player)
            {
                if (state != UnknownEnum.Value_146 && state != UnknownEnum.Value_95 && state != UnknownEnum.Value_137 && !instance_exists(obj_fadeout))
                {
                    if (state == UnknownEnum.Value_137 || state == UnknownEnum.Value_61)
                    {
                        hitLag = 0;
                        x = hitX;
                        y = hitY;
                    }
                    
                    movespeed = 0;
                    hsp = 0;
                    vsp = 0;
                    sprite_index = spr_idle;
                    image_speed = 0.35;
                    xscale = (x > (room_width / 2)) ? -1 : 1;
                    image_blend = make_colour_hsv(0, 0, 255);
                    state = UnknownEnum.Value_146;
                    visible = true;
                    image_alpha = 1;
                }
                
                if (state == UnknownEnum.Value_146)
                    state_player_arenaround();
            }
            
            with (par_boss)
            {
                if (state == UnknownEnum.Value_137 || state == UnknownEnum.Value_61)
                {
                    hitLag = 0;
                    x = hitX;
                    y = hitY;
                }
                
                if (colliding && state != 180 && state != 181)
                {
                    state = 145;
                    attack_cooldown = attack_max[phase - 1];
                }
            }
        }
        else
        {
            if (startroundfunc != -4)
                startroundfunc();
            
            minutes = maxminutes;
            seconds = maxseconds;
            alarm[0] = room_speed;
            state = UnknownEnum.Value_0;
            
            with (obj_player)
            {
                if (object_index == obj_player1 || global.coop)
                    state = UnknownEnum.Value_0;
            }
            
            with (par_boss)
                state = UnknownEnum.Value_0;
        }
        
        break;
    
    case UnknownEnum.Value_8:
        instance_destroy(obj_baddiespawner);
        instance_destroy(obj_baddie);
        
        if (player_hp > 0)
        {
            if (!instance_exists(bossID) || bossID.state != UnknownEnum.Value_137)
            {
                fade -= 0.05;
                fade = clamp(fade, 0, 1);
            }
        }
        else
        {
            hit = 0;
            
            with (obj_player)
            {
                if (state == UnknownEnum.Value_137)
                    hit = 1;
            }
            
            if (!hit)
            {
                fade -= 0.05;
                fade = clamp(fade, 0, 1);
            }
        }
        
        break;
    
    case UnknownEnum.Value_98:
    case UnknownEnum.Value_89:
        fade -= 0.05;
        fade = clamp(fade, 0, 1);
        break;
}
