function scr_pizzagoblin_throw()
{
    if (!variable_global_exists("throw_frame"))
    {
        global.throw_frame = 0;
        global.throw_frame[371] = 9;
        global.throw_frame[373] = 5;
        global.throw_frame[372] = 18;
        global.throw_frame[367] = 6;
        global.throw_frame[386] = 2;
        global.throw_frame[386] = 2;
        global.throw_frame[387] = 2;
        global.throw_frame[388] = 2;
        global.throw_frame[369] = 2;
        global.throw_frame[370] = 8;
        global.throw_frame[377] = 11;
        global.throw_frame[381] = 0;
        global.throw_frame[707] = 0;
        global.throw_frame[380] = 15;
        global.throw_frame[379] = 3;
        global.throw_frame[378] = 2;
        global.throw_frame[167] = 6;
        global.throw_frame[359] = 9;
        global.throw_frame[360] = 9;
        global.throw_frame[335] = 9;
        global.throw_frame[169] = 13;
        global.throw_frame[396] = 3;
        global.throw_frame[784] = 3;
        global.throw_frame[213] = 11;
        global.throw_sprite = spr_plug;
        global.throw_sprite[371] = 265;
        global.throw_sprite[373] = 289;
        global.throw_sprite[372] = 537;
        global.throw_sprite[367] = 374;
        global.throw_sprite[386] = 519;
        global.throw_sprite[386] = 519;
        global.throw_sprite[387] = 402;
        global.throw_sprite[388] = 432;
        global.throw_sprite[369] = 375;
        global.throw_sprite[370] = 451;
        global.throw_sprite[377] = 467;
        global.throw_sprite[381] = 383;
        global.throw_sprite[707] = 383;
        global.throw_sprite[380] = 477;
        global.throw_sprite[379] = 427;
        global.throw_sprite[378] = 530;
        global.throw_sprite[167] = 556;
        global.throw_sprite[359] = 582;
        global.throw_sprite[360] = 582;
        global.throw_sprite[335] = 582;
        global.throw_sprite[169] = 1877;
        global.throw_sprite[396] = 2769;
        global.throw_sprite[784] = 2769;
        global.throw_sprite[213] = 2572;
        global.reset_timer = 0;
        global.reset_timer[371] = 200 / (global.stylethreshold + 1);
        global.reset_timer[373] = 200 / (global.stylethreshold + 1);
        global.reset_timer[372] = 100 / (global.stylethreshold + 1);
        global.reset_timer[367] = 400;
        global.reset_timer[386] = 100;
        global.reset_timer[386] = 100 / (global.stylethreshold + 1);
        global.reset_timer[387] = 200 / (global.stylethreshold + 1);
        global.reset_timer[388] = 200 / (global.stylethreshold + 1);
        global.reset_timer[369] = 100 / (global.stylethreshold + 1);
        global.reset_timer[370] = 200 / (global.stylethreshold + 1);
        global.reset_timer[377] = 200 / (global.stylethreshold + 1);
        global.reset_timer[381] = 100 / (global.stylethreshold + 1);
        global.reset_timer[707] = 200 / (global.stylethreshold + 1);
        global.reset_timer[380] = 100 / (global.stylethreshold + 1);
        global.reset_timer[379] = 200 / (global.stylethreshold + 1);
        global.reset_timer[378] = 100 / (global.stylethreshold + 1);
        global.reset_timer[167] = 60 / (global.stylethreshold + 1);
        global.reset_timer[359] = 60 / (global.stylethreshold + 1);
        global.reset_timer[360] = 60 / (global.stylethreshold + 1);
        global.reset_timer[335] = 60 / (global.stylethreshold + 1);
        global.reset_timer[169] = 10 / (global.stylethreshold + 1);
        global.reset_timer[396] = 100 / (global.stylethreshold + 1);
        global.reset_timer[784] = 100 / (global.stylethreshold + 1);
        global.reset_timer[213] = 100 / (global.stylethreshold + 1);
    }
    
    hsp = 0;
    
    if (place_meeting(x, y + 1, obj_railh))
        hsp = -5;
    else if (place_meeting(x, y + 1, obj_railh2))
        hsp = 5;
    
    if (floor(image_index) == (image_number - 1))
    {
        state = UnknownEnum.Value_134;
        sprite_index = walkspr;
    }
    
    if (bombreset <= 0 && floor(image_index) == global.throw_frame[object_index])
    {
        bombreset = global.reset_timer[object_index];
        sprite_index = global.throw_sprite[object_index];
        
        if (point_in_rectangle(x, y, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])))
            scr_soundeffect(48);
        
        switch (object_index)
        {
            case obj_pizzagoblin:
                with (instance_create(x, y, obj_pizzagoblinbomb))
                {
                    defused = 1;
                    movespeed = 5;
                    image_xscale = other.image_xscale;
                    vsp = -8;
                }
                
                break;
            
            case obj_canongoblin:
                with (instance_create(x, y - 20, obj_canongoblinbomb))
                    image_xscale = other.image_xscale;
                
                break;
            
            case obj_noisegoblin:
                with (instance_create(x, y, obj_noisegoblin_arrow))
                {
                }
                
                break;
            
            case obj_cheeserobot:
                with (instance_create(x, y, obj_cheeseblob))
                {
                    sprite_index = spr_cheeserobot_goop;
                    image_xscale = other.image_xscale;
                    hsp = other.image_xscale * 8;
                    vsp = 0;
                    grav = 0;
                }
                
                break;
            
            case obj_spitcheese:
                with (instance_create(x + (image_xscale * 6), y - 6, obj_spitcheesespike))
                {
                    image_xscale = other.image_xscale;
                    hsp = other.image_xscale * 5;
                    vsp = -6;
                }
                
                break;
            
            case obj_trash:
            case obj_invtrash:
                with (instance_create(x + (image_xscale * 6), y - 6, obj_cheeseball))
                {
                    image_xscale = other.image_xscale;
                    hsp = other.image_xscale * 5;
                    vsp = -4;
                }
                
                break;
            
            case obj_robot:
                with (instance_create(x, y, obj_robotknife))
                {
                    image_xscale = other.image_xscale;
                    hsp = other.image_xscale * 5;
                }
                
                break;
            
            case obj_kentukykenny:
                with (instance_create(x, y, obj_kentukykenny_projectile))
                    image_xscale = other.image_xscale;
                
                break;
            
            case obj_pizzard:
                with (instance_create(x, y, obj_pizzard_bolt))
                    image_xscale = other.image_xscale;
                
                break;
            
            case obj_swedishmonkey:
                if (global.stylethreshold >= 3)
                {
                    with (instance_create(x, y, obj_evilbanana))
                    {
                        baddieID = other.id;
                        image_xscale = other.image_xscale;
                        hsp = -other.image_xscale * 4;
                        vsp = -5;
                    }
                }
                else
                {
                    with (instance_create(x, y, obj_slipnslide))
                    {
                        baddieID = other.id;
                        image_xscale = other.image_xscale;
                        hsp = -other.image_xscale * 4;
                        vsp = -5;
                    }
                }
                
                with (obj_slipnslide)
                {
                    if (baddieID == other.id)
                        banana += 1;
                }
                
                with (obj_evilbanana)
                {
                    if (baddieID == other.id)
                        banana += 1;
                }
                
                break;
            
            case obj_pepgoblin:
                with (instance_create(x, y, obj_pepgoblin_kickhitbox))
                {
                    baddieID = other.id;
                    image_xscale = other.image_xscale;
                }
                
                break;
            
            case obj_pepbat:
                with (instance_create(x, y, obj_pepgoblin_kickhitbox))
                {
                    baddieID = other.id;
                    image_xscale = other.image_xscale;
                }
                
                break;
            
            case obj_pickle:
                attacking = 0;
                
                with (instance_create(x, y, obj_forkhitbox))
                {
                    ID = other.id;
                    image_xscale = other.image_xscale;
                    sprite_index = other.sprite_index;
                }
                
                break;
            
            case obj_tank:
                with (instance_create(x + (image_xscale * 6), y - 6, obj_canongoblinbomb))
                {
                    image_xscale = other.image_xscale;
                    hsp = other.image_xscale * 5;
                }
                
                break;
            
            case obj_thug_blue:
            case obj_thug_red:
                with (instance_create(x + (8 * image_xscale), y, obj_robotknife))
                {
                    image_xscale = other.image_xscale;
                    hsp = other.image_xscale * 5;
                }
                
                break;
            
            case obj_rancher:
                with (instance_create(x + (image_xscale * 6), y + 26, obj_rancher_bullet))
                    image_xscale = other.image_xscale;
                
                break;
            
            case obj_smokingpizzaslice:
                substate = choose(UnknownEnum.Value_134, UnknownEnum.Value_126, UnknownEnum.Value_126);
                
                if (substate == UnknownEnum.Value_134)
                    image_xscale = choose(-1, 1, -image_xscale);
                
                substate_buffer = substate_max;
                
                with (instance_create(x + (50 * image_xscale), y + 20, obj_smokingprojectile))
                    image_xscale = other.image_xscale;
                
                break;
            
            case obj_thug_green:
                with (instance_create(x + (8 * image_xscale), y, obj_junkenemy))
                {
                    image_xscale = other.image_xscale;
                    hsp = other.image_xscale * 7;
                    vsp = -8;
                }
                
                break;
            
            case obj_miniufo:
                instance_create(x, y, obj_warplaser);
                break;
            
            case obj_miniufo_grounded:
                with (instance_create(x + (8 * image_xscale), y, obj_enemybullet))
                {
                    sprite_index = spr_ufogrounded_bullet;
                    image_xscale = other.image_xscale;
                }
                
                break;
            
            case obj_kentukybomber:
                instance_create(x + (8 * image_xscale), y, obj_kentukybomb);
                break;
            
            case obj_bazookabaddie:
                instance_create(x + (8 * image_xscale), y, obj_bazooka);
                break;
        }
    }
    
    if (!grounded && hsp < 0)
        hsp += 0.1;
    else if (!grounded && hsp > 0)
        hsp -= 0.1;
}
