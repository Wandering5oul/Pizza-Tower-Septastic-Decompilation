function scr_player_ratmount()
{
    move = key_left + key_right;
    hsp = xscale * movespeed;
    doublejump = 0;
    
    if (ratgrabbedID != -4 && !instance_exists(ratgrabbedID))
        ratgrabbedID = -4;
    
    if (key_jump)
        input_buffer_jump = 0;
    
    if (move != 0)
    {
        if (move == xscale)
        {
            if (movespeed < ratmount_movespeed)
                movespeed += 0.5;
            else if (floor(movespeed) == ratmount_movespeed)
                movespeed = ratmount_movespeed;
        }
        else
        {
            movespeed = Approach(movespeed, 0, 1);
            
            if (movespeed <= 0)
                xscale = move;
        }
        
        if (movespeed >= ratmount_movespeed && move == xscale && key_down && !place_meeting(x + sign(hsp), y, obj_solid) && !scr_solid_slope(x + sign(hsp), y))
            state = UnknownEnum.Value_201;
        
        if (movespeed < 3 && move != 0)
            image_speed = 0.35;
        else if (movespeed > 3 && movespeed < 6)
            image_speed = 0.45;
        else
            image_speed = 0.6;
    }
    else
    {
        movespeed = Approach(movespeed, 0, 0.5);
    }
    
    if (movespeed > ratmount_movespeed)
        movespeed -= 0.1;
    
    if (!landAnim)
    {
        if (hsp != 0)
        {
            sprite_index = spr_player_ratmountmove;
        }
        else
        {
            image_speed = 0.35;
            
            if (sprite_index != spr_player_ratmountidleanim)
            {
                sprite_index = spr_player_ratmountidle;
                
                if (ratgrabbedID == -4)
                {
                    if (idle < 400)
                        idle++;
                    
                    if (idle >= 150)
                    {
                        sprite_index = spr_player_ratmountidleanim;
                        image_index = 0;
                    }
                }
            }
            else if (floor(image_index) == (image_number - 1))
            {
                idle = 0;
                sprite_index = spr_player_ratmountidle;
            }
        }
        
        if (ratgrabbedID != -4)
        {
            image_speed = 0.35;
            
            if (sprite_index == spr_player_ratmountidle)
                sprite_index = spr_player_ratmountidle2;
            else if (sprite_index == spr_player_ratmountmove)
                sprite_index = spr_player_ratmountmove2;
        }
    }
    else if (floor(image_index) == (image_number - 1))
    {
        landAnim = 0;
        
        if (sprite_index == spr_player_ratmountland)
            sprite_index = spr_player_ratmountidle;
    }
    
    if (sprite_index == spr_player_ratmountland)
        image_speed = 0.35;
    
    if (hsp != 0 && !steppy && floor(image_index) == 7)
    {
        steppy = 1;
        create_particle(x, y + 38, UnknownEnum.Value_1, 0);
    }
    
    if (hsp != 0 && floor(image_index) != 7)
        steppy = 0;
    
    if (input_buffer_jump < 8 && grounded)
    {
        particle_set_scale(UnknownEnum.Value_4, xscale, 1);
        create_particle(x, y, UnknownEnum.Value_4, 0);
        scr_soundeffect(40);
        sprite_index = spr_player_ratmountjump;
        image_index = 0;
        
        if (ratgrabbedID != -4)
            sprite_index = spr_player_ratmountjump2;
        
        jumpAnim = 1;
        state = UnknownEnum.Value_192;
        vsp = -11;
        jumpstop = 0;
    }
    
    if (!grounded)
    {
        state = UnknownEnum.Value_192;
        jumpAnim = 0;
        sprite_index = spr_player_ratmountfall;
    }
    
    if (key_slap2)
    {
        if (ratgrabbedID != -4)
        {
            state = UnknownEnum.Value_194;
            sprite_index = spr_player_ratmountspit;
            image_index = 0;
        }
        else
        {
            state = UnknownEnum.Value_193;
            movespeed = 10;
            sprite_index = spr_player_ratmountattack;
            image_index = 0;
        }
    }
    
    if (key_attack && grounded)
    {
        state = UnknownEnum.Value_198;
        sprite_index = spr_player_ratmountbounce;
        image_index = 0;
        hsp = 0;
        vsp = 0;
        movespeed = 5;
        tauntstoredvsp = -8;
        ratmount_fallingspeed = 0;
    }
    
    with (ratgrabbedID)
        scr_enemy_ratgrabbed();
    
    ratmount_dotaunt();
}

function ratmount_dotaunt()
{
    if (key_taunt2 && state != UnknownEnum.Value_84)
    {
        scr_soundeffect(112);
        tauntstoredisgustavo = 1;
        taunttimer = 20;
        tauntstoredmovespeed = movespeed;
        tauntstoredsprite = sprite_index;
        tauntstoredstate = state;
        tauntstoredvsp = vsp;
        state = UnknownEnum.Value_84;
        sprite_index = spr_player_ratmounttaunt;
        
        with (instance_create(x, y, obj_taunteffect))
            player = other.id;
    }
}
