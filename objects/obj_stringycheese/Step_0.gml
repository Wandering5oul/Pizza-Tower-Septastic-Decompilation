var _dir, spd, tx, ty, _xs, dis, m, tspd, t;

targetplayer = instance_nearest(x, y, obj_player);

switch (state)
{
    case UnknownEnum.Value_0:
        _dir = point_direction(x, y, targetplayer.x, targetplayer.y);
        spd = (shootbuffer > 0) ? 3 : 10;
        tx = targetplayer.x;
        ty = targetplayer.y;
        
        if (point_distance(x, y, handx, handy) >= (maxhandlen - 20))
        {
            tx = x + lengthdir_x(maxhandlen, _dir);
            ty = y + lengthdir_y(maxhandlen, _dir);
            _dir = point_direction(x, y, tx, ty);
        }
        
        handx = Approach(handx, tx, spd);
        handy = Approach(handy, ty, spd);
        
        if (handy < y)
            handy = y;
        
        drawhandx = lerp(drawhandx, handx, 0.5);
        drawhandy = lerp(drawhandy, handy, 0.5);
        
        if (shootbuffer > 0)
            shootbuffer--;
        
        if (shootbuffer <= 0 && place_meeting(handx, handy, obj_player))
        {
            playerid = instance_place(handx, handy, obj_player);
            state = UnknownEnum.Value_15;
        }
        
        break;
    
    case UnknownEnum.Value_15:
        handx = playerid.x;
        handy = playerid.y;
        
        if (handy < (y - 20))
        {
            state = UnknownEnum.Value_0;
            break;
        }
        else
        {
            drawhandx = handx;
            drawhandy = handy;
            
            with (playerid)
            {
                if (y > other.y)
                {
                    _xs = 0;
                    
                    if (x != other.x)
                        _xs = -sign(x - other.x);
                    
                    dis = 120;
                    m = (abs(x - other.x) > dis) ? abs(hsp) : (abs(hsp) - max(0, abs(hsp) - 2));
                    
                    if (hsp == 0)
                        m = _xs;
                    
                    hsp_carry = _xs * abs(m);
                    
                    if (y < (other.y - other.maxhandlen))
                        vsp = 20;
                    
                    if (y > (other.y + other.maxhandlen) && y > other.y)
                    {
                        other.state = UnknownEnum.Value_19;
                        other.shootbuffer = 60;
                        state = UnknownEnum.Value_211;
                        stringid = other.id;
                    }
                }
            }
            
            break;
        }
    
    case UnknownEnum.Value_19:
        if (shootbuffer > 0)
        {
            shootbuffer--;
            handy = playerid.y;
            handx = playerid.x;
            drawhandx = handx;
            drawhandy = handy;
        }
        else
        {
            _dir = point_direction(playerid.x, playerid.y, x, y);
            tspd = 20;
            
            with (playerid)
            {
                t = (x > other.x) ? 40 : -40;
                
                if (x > (other.x - 32) && x < (other.x + 32))
                    t = 0;
                
                hsp = lengthdir_x(tspd, _dir + t);
                movespeed = abs(hsp);
                
                if (hsp != 0)
                    xscale = sign(hsp);
                
                dir = xscale;
                vsp = -abs(lengthdir_y(tspd + 8, _dir));
                state = UnknownEnum.Value_212;
                sprite_index = spr_superspringplayer;
                image_index = 0;
                jumpAnim = 1;
                momemtum = 1;
            }
            
            state = UnknownEnum.Value_0;
            shootbuffer = 30;
        }
        
        break;
}
