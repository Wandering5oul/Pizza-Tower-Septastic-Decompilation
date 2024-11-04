image_speed = 0.35;

switch (state)
{
    case 215:
        targetplayer = instance_nearest(x, y, obj_player);
        image_speed = 0.35;
        sprite_index = spr_monstercheese_walk;
        hsp = image_xscale * 4;
        
        if (place_meeting(x + sign(hsp), y, obj_monstersolid) && (!place_meeting(x + sign(hsp), y, obj_monsterslope) || place_meeting(x + sign(hsp), y - 4, obj_solid)))
            image_xscale *= -1;
        
        if (gravdir > 0)
        {
            state = 135;
            gravdir *= -1;
            chase = 0;
        }
        
        scr_monster_detect_audio();
        
        if (scr_monster_detect(300, room_height, targetplayer))
        {
            state = 135;
            gravdir = 1;
            chase = 1;
        }
        
        break;
    
    case 135:
        sprite_index = spr_monstercheese_idle;
        hsp = 0;
        
        if (place_meeting(x, y + (1 * gravdir), obj_solid))
        {
            if (chase)
                state = 216;
            else
                state = 215;
        }
        
        break;
    
    case 216:
        sprite_index = spr_monstercheese_chase;
        
        if (x != targetplayer.x && grounded)
        {
            image_xscale = sign(targetplayer.x - x);
            
            if (abs(x - targetplayer.x) > 50)
                hsp = image_xscale * 8;
            else
                hsp = Approach(hsp, 0, 0.5);
        }
        
        if (targetplayer.y < (y - 250))
            vsp = -14;
        
        if (!point_in_camera(x, y, view_camera[0]))
            state = 218;
        
        break;
    
    case 218:
        targetplayer = instance_nearest(x, y, obj_player);
        hsp = image_xscale * 6;
        sprite_index = spr_monstercheese_chase;
        
        if (place_meeting(x + sign(hsp), y, obj_monstersolid) && (!place_meeting(x + sign(hsp), y, obj_monsterslope) || place_meeting(x + sign(hsp), y - 4, obj_solid)))
            state = 215;
        
        if (scr_monster_detect(300, room_height, targetplayer))
            state = 216;
        
        break;
    
    case 217:
        scr_monsterinvestigate(10, 370, 853);
        break;
}

grav = 0.5 * gravdir;

if (gravdir != 0)
    yscale = sign(gravdir);

scr_monster_collide();
