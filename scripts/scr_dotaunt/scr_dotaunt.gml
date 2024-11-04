function scr_dotaunt()
{
    if ((key_taunt2 || input_finisher_buffer > 0) && !skateboarding)
    {
        input_finisher_buffer = 0;
        
        if (!finisher)
        {
            scr_soundeffect(112);
            tauntstoredisgustavo = isgustavo;
            taunttimer = 20;
            tauntstoredmovespeed = movespeed;
            tauntstoredvsp = vsp;
            tauntstoredsprite = sprite_index;
            tauntstoredstate = state;
            state = UnknownEnum.Value_84;
            
            if (supercharged == 1 && key_up)
            {
                image_index = 0;
                sprite_index = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3, spr_supertaunt4);
            }
            else
            {
                taunttimer = 20;
                sprite_index = spr_taunt;
                image_index = random_range(0, 11);
            }
            
            with (instance_create(x, y, obj_taunteffect))
                player = other.id;
        }
    }
}

function scr_dograb()
{
    if (key_slap2 && (!key_up || global.option_septmoveset))
    {
        if ((state != UnknownEnum.Value_0 && state != UnknownEnum.Value_92 && global.option_septmoveset) || chainsawcutscene)
            exit;
        
        suplexmove = true;
        suplexdashsnd = audio_play_sound(sfx_suplexdash, 1, false);
        sfx_gain(suplexdashsnd);
        state = UnknownEnum.Value_42;
        
        if (!global.option_septmoveset)
        {
            if (movespeed < 8)
                movespeed = 8;
        }
        else
        {
            movespeed = 5;
        }
        
        image_index = 0;
        flash = global.option_septmoveset;
        sprite_index = spr_suplexdash;
        
        if (!grounded)
            sprite_index = spr_suplexdashjumpstart;
    }
}

function scr_dochainsaw()
{
    if (key_slap2 && (!key_up || global.option_septmoveset))
    {
        sprite_index = spr_chainsawdashstart;
        image_index = 0;
        state = UnknownEnum.Value_41;
    }
}

function scr_douppercut()
{
    if ((key_slap2 || input_buffer_slap > 0) && key_up && !global.option_septmoveset)
    {
        scr_soundeffect(33);
        state = UnknownEnum.Value_80;
        image_index = 0;
        sprite_index = spr_breakdanceuppercut;
        vsp = -14;
        
        if (!grounded)
            vsp = -10;
        
        if (!ispeppino)
        {
            vsp = -20;
            
            if (!grounded)
                vsp = -21;
        }
        
        movespeed = hsp;
        particle_set_scale(UnknownEnum.Value_4, xscale, 1);
        create_particle(x, y, UnknownEnum.Value_4, 0);
    }
}
