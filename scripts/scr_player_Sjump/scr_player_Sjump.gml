function scr_player_Sjump()
{
    var key_sjumpcancel;
    
    hsp = 0;
    mach2 = 0;
    jumpAnim = 1;
    dashAnim = 1;
    landAnim = 0;
    moveAnim = 1;
    stopAnim = 1;
    crouchslideAnim = 1;
    crouchAnim = 0;
    machhitAnim = 0;
    key_sjumpcancel = key_down2;
    
    if (!global.option_septmoveset)
        key_sjumpcancel = key_slap2 || key_attack2;
    
    move = key_right + key_left;
    
    if ((sprite_index == spr_superjump || sprite_index == spr_superspringplayer) && (character == "N" || character == "P"))
        vsp = sjumpvsp;
    
    sjumpvsp -= 0.1;
    
    if (character == "V" && image_index > 3)
        vsp = -11;
    
    if (sprite_index == spr_player_supersidejump)
    {
        if (a < 25)
            a++;
        
        hsp = xscale * a;
        vsp = 0;
    }
    
    if (scr_solid(x, y - 1) && !place_meeting(x, y - 1, obj_destructibles))
    {
        pizzapepper = 0;
        a = 0;
        
        if (sprite_index == spr_player_supersidejump)
            sprite_index = spr_player_supersidejumpland;
        
        if (sprite_index == spr_superjump || sprite_index == spr_superspringplayer)
            sprite_index = spr_superjumpland;
        
        with (obj_camera)
        {
            shake_mag = 10;
            shake_mag_acc = 30 / room_speed;
        }
        
        with (obj_baddie)
        {
            if (point_in_camera(x, y, view_camera[0]))
            {
                image_index = 0;
                
                if (grounded)
                    vsp = -7;
            }
        }
        
        scr_soundeffect(55);
        image_index = 0;
        state = UnknownEnum.Value_123;
        machhitAnim = 0;
    }
    else if (key_sjumpcancel && character == "P" && sprite_index != spr_superspringplayer && sprite_index != spr_player_Sjumpcancelstart)
    {
        if (ispeppino)
        {
            image_index = 0;
            sprite_index = spr_player_Sjumpcancelstart;
        }
        else
        {
            image_speed = 0.5;
            
            if (move != 0)
                xscale = move;
            
            input_buffer_slap = 0;
            key_slap = 0;
            key_slap2 = 0;
            jumpstop = 1;
            vsp = -5;
            state = UnknownEnum.Value_104;
            movespeed = 12;
            sprite_index = spr_playerN_sidewayspin;
            image_index = 0;
            
            with (instance_create(x, y, obj_crazyrunothereffect))
                image_xscale = other.xscale;
            
            particle_set_scale(5, xscale, 1);
            create_particle(x, y, 5, 0);
            scr_soundeffect(196);
            return 1;
        }
    }
    
    if (sprite_index == spr_player_Sjumpcancelstart)
    {
        vsp = 0;
        
        if (move != 0)
            xscale = move;
        
        if (floor(image_index) == (image_number - 1))
        {
            vsp = -5;
            movespeed = 12;
            image_index = 0;
            sprite_index = spr_player_Sjumpcancel;
            state = UnknownEnum.Value_5;
            
            if (!global.option_septmoveset)
                state = UnknownEnum.Value_121;
            
            with (instance_create(x, y, obj_crazyruneffect))
                image_xscale = other.xscale;
        }
    }
    
    if (character == "N" && key_jump2)
    {
        scr_soundeffect(40);
        scr_soundeffect(127);
        jumpstop = 0;
        vsp = -15;
        state = UnknownEnum.Value_92;
        sprite_index = spr_playerN_noisebombspinjump;
        image_index = 0;
        
        with (instance_create(x, y, obj_jumpdust))
            image_xscale = other.xscale;
    }
    
    if (!ispeppino && character == "P" && sprite_index == spr_superjump)
        hsp = move * 3;
    
    if (character == "V" && floor(image_index) == (image_number - 1))
    {
        state = UnknownEnum.Value_92;
        sprite_index = spr_playerV_fall;
    }
    
    image_speed = 0.5;
    scr_collide();
}
