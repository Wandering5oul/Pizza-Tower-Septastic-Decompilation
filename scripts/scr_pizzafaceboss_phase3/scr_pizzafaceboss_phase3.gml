function boss_pizzahead_phase3normal()
{
    hsp = 0;
    sprite_index = spr_pizzahead_phase3idle;
    hitplayer = 0;
    
    if (attackbuffer > 0)
    {
        attackbuffer--;
    }
    else
    {
        attackbuffer = 30;
        state = 243;
        
        switch (state)
        {
            case 239:
                sprite_index = spr_pizzahead_dash;
                
                if (x != targetplayer.x)
                    image_xscale = sign(targetplayer.x - x);
                
                break;
            
            case 243:
                if (x != targetplayer.x)
                    image_xscale = sign(targetplayer.x - x);
                
                sprite_index = spr_pizzahead_bigkick;
                kickinst = instance_create(x, y, obj_pizzahead_kickhitbox);
                
                with (kickinst)
                {
                    dir = other.image_xscale;
                    image_xscale = 0;
                }
                
                kickbuffer = 100;
                break;
        }
    }
}

function boss_pizzahead_spinningrun()
{
    if (x != targetplayer.x)
        image_xscale = sign(targetplayer.x - x);
    
    hsp = image_xscale * 10;
    
    if (abs(x - targetplayer.x) < 200)
    {
        state = choose(240, 242, 244);
        ds_list_clear(hitlist);
        
        switch (state)
        {
            case 240:
                kickbuffer = 20;
                sprite_index = spr_pizzahead_spinningkick;
                break;
            
            case 242:
                sprite_index = spr_pizzahead_groundpunch;
                break;
            
            case 244:
                sprite_index = spr_pizzahead_headslam;
                slambuffer = 30;
                break;
        }
    }
}

function boss_pizzahead_spinningkick()
{
    hsp = Approach(hsp, 0, 0.3);
    
    if (kickbuffer > 0)
    {
        kickbuffer--;
    }
    else
    {
        state = UnknownEnum.Value_0;
        
        if (x != targetplayer.x)
            image_xscale = sign(targetplayer.x - x);
        
        if (!hitplayer && irandom(100) > 50)
        {
            hsp = image_xscale * 10;
            state = 241;
            kickbuffer = 20;
            sprite_index = spr_pizzahead_spinningpunch;
        }
    }
}

function boss_pizzahead_spinningpunch()
{
    hsp = Approach(hsp, 0, 0.3);
    
    if (kickbuffer > 0)
    {
        kickbuffer--;
    }
    else
    {
        state = UnknownEnum.Value_0;
        
        if (x != targetplayer.x)
            image_xscale = sign(targetplayer.x - x);
    }
}

function boss_pizzahead_groundpunch()
{
    hsp = Approach(hsp, 0, 0.2);
    
    if (hsp == 0)
    {
        state = UnknownEnum.Value_0;
        
        if (x != targetplayer.x)
            image_xscale = sign(targetplayer.x - x);
    }
}

function boss_pizzahead_bigkick()
{
    hsp = 0;
    
    if (kickbuffer > 0)
    {
        kickbuffer--;
    }
    else
    {
        state = UnknownEnum.Value_0;
        instance_destroy(kickinst);
    }
}

function boss_pizzahead_slamhead()
{
    hsp = Approach(hsp, 0, 1);
    
    if (slambuffer > 0)
    {
        slambuffer--;
    }
    else
    {
        state = UnknownEnum.Value_0;
        
        if (x != targetplayer.x)
            image_xscale = sign(targetplayer.x - x);
        
        if (!hitplayer)
        {
            hsp = image_xscale * 10;
            state = 245;
            sprite_index = spr_pizzahead_headslam2;
        }
    }
}

function boss_pizzahead_slamhead2()
{
    hsp = Approach(hsp, 0, 0.2);
    
    if (hsp == 0)
    {
        state = UnknownEnum.Value_0;
        
        if (x != targetplayer.x)
            image_xscale = sign(targetplayer.x - x);
    }
}
