var spd, _dir;

switch (state)
{
    case UnknownEnum.Value_0:
        targetplayer = instance_nearest(x, y, obj_player);
        
        if (targetplayer.x > (x - 200) && targetplayer.x < (x + 200) && targetplayer.y > y && targetplayer.y < (y + 500))
        {
            state = UnknownEnum.Value_8;
            sprite_index = spr_grabbiehand_hifive;
            image_index = 0;
            shootdir = point_direction(x, y, targetplayer.x, targetplayer.y);
        }
        
        grounded = 0;
        break;
    
    case UnknownEnum.Value_8:
        if (floor(image_index) == (image_number - 1))
        {
            state = 135;
            sprite_index = spr_grabbiehand_fall;
        }
        
        break;
    
    case 135:
        spd = 12;
        shootdir = angle_rotate(shootdir, point_direction(x, y, targetplayer.x, targetplayer.y), turnspeed);
        hsp = lengthdir_x(spd, shootdir);
        vsp = lengthdir_y(spd, shootdir);
        
        if (hsp != 0)
            image_xscale = sign(hsp);
        
        if (grounded)
        {
            state = UnknownEnum.Value_138;
            stunned = 50;
            hsp = 0;
            vsp = 0;
            sprite_index = spr_grabbiehand_catch;
        }
        
        scr_collide();
        break;
    
    case UnknownEnum.Value_138:
        if (stunned > 0)
        {
            stunned--;
        }
        else if (grounded)
        {
            state = UnknownEnum.Value_7;
            sprite_index = spr_grabbiehand_idle;
            grounded = 0;
        }
        
        if (grounded)
            hsp = 0;
        
        scr_collide();
        break;
    
    case UnknownEnum.Value_7:
        _dir = point_direction(x, y, xstart, ystart);
        x = Approach(x, xstart, abs(lengthdir_x(8, _dir)));
        y = Approach(y, ystart, abs(lengthdir_y(8, _dir)));
        
        if (x > (xstart - 8) && x < (xstart + 8) && y > (ystart - 8) && y < (ystart + 8))
        {
            state = UnknownEnum.Value_0;
            x = xstart;
            y = ystart;
        }
        
        break;
    
    case UnknownEnum.Value_55:
        sprite_index = spr_grabbiehand_catch;
        vsp = -6;
        move = playerid.key_left + playerid.key_right;
        hsp = move * 4;
        
        if (move != 0)
            image_xscale = sign(move);
        
        with (playerid)
        {
            hsp = 0;
            vsp = 0;
            x = other.x;
            y = other.y;
            xscale = other.image_xscale;
            state = UnknownEnum.Value_106;
            sprite_index = spr_player_catched;
        }
        
        if (scr_solid(x, y - 1))
        {
            sprite_index = spr_grabbiehand_idle;
            state = UnknownEnum.Value_7;
            
            if (fake)
                instance_destroy();
        }
        
        scr_collide();
        break;
}
