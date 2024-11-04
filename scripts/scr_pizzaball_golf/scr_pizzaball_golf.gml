function scr_pizzaball_golf()
{
    var angle_spd, _mtspd, _i, _my_id;
    
    jspd = 8;
    kicked = 0;
    chair = 0;
    
    if (!meter)
    {
        image_xscale = player.xscale;
        sprite_index = spr_pizzaball_stun;
        x = player.x + (23 * player.xscale);
        y = player.y;
        angle_spd = 2;
        
        if (image_xscale > 0)
        {
            if (player.key_down)
                m_angle -= angle_spd;
            else if (player.key_up)
                m_angle += angle_spd;
            
            if (m_angle >= 90)
                m_angle = 90;
            
            if (m_angle <= -26)
                m_angle = -26;
        }
        else if (image_xscale < 0)
        {
            if (player.key_down)
                m_angle += angle_spd;
            else if (player.key_up)
                m_angle -= angle_spd;
            
            if (m_angle <= 90)
                m_angle = 90;
            
            if (m_angle >= 206)
                m_angle = 206;
        }
        
        if (player.key_slap2 && !player.key_attack)
        {
            meter = 1;
            turn = 0;
            m_meter = 0;
        }
        
        if (player.key_left < 0 && image_xscale > 0 && !player.key_attack)
        {
            player.xscale = -1;
            turn = 1;
            m_angle = 180;
        }
        else if (player.key_right && image_xscale < 0 && !player.key_attack)
        {
            player.xscale = 1;
            m_angle = 0;
            turn = 1;
        }
    }
    else
    {
        _mtspd = 0.025;
        x = player.x + (23 * player.xscale);
        y = player.y;
        
        if (player.sprite_index != player.spr_golfswing)
        {
            if (turn == 1)
            {
                m_meter -= _mtspd;
                
                if (m_meter < 0)
                {
                    turn = 0;
                    m_meter = 0;
                }
            }
            else
            {
                m_meter += _mtspd;
                
                if (m_meter > 1)
                {
                    turn = 1;
                    m_meter = 1;
                }
            }
        }
        
        if (player.key_slap2 && player.sprite_index != player.spr_golfswing)
        {
            with (player)
            {
                state = UnknownEnum.Value_91;
                hsp = 0;
                movespeed = 0;
                image_index = 0;
                sprite_index = spr_golfswing;
            }
        }
        
        _i = 9;
        
        if (!player.ispeppino)
            _i = 7;
        
        if (player.sprite_index == player.spr_golfswing && floor(player.image_index) == _i)
        {
            x = player.x;
            y = player.y - 40;
            global.golfhit++;
            
            if (!scr_solid(x + (2 * image_xscale), y))
                x += (2 * image_xscale);
            
            m_meter += 0.25;
            state = UnknownEnum.Value_0;
            thrown = 1;
            sprite_index = spr_pizzaball_hitwall2;
            image_index = 0;
            meter = 0;
            movespeed = abs(lengthdir_x(m_spd * m_meter, m_angle));
            image_xscale = player.xscale;
            hsp = image_xscale * movespeed;
            vsp = lengthdir_y(m_spd * m_meter, m_angle);
            _my_id = id;
            
            with (obj_camera)
                targetgolf = _my_id;
            
            if (scr_solid(x, y))
            {
                x = player.x;
                y = player.y;
                
                while (scr_solid(x, y))
                    x += player.xscale;
            }
        }
    }
    
    if (player.state != UnknownEnum.Value_148 && player.state != UnknownEnum.Value_91)
    {
        state = UnknownEnum.Value_0;
        meter = 0;
    }
}
