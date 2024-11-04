targetplayer = global.coop ? instance_nearest(x, y, obj_player) : 245;

if (obj_bosscontroller.state == UnknownEnum.Value_144)
    exit;

if (hp <= 0 && state != 145 && state != 162)
{
    if (!thrown && !destroyable)
        boss_destroy(lastplayerid);
}

image_speed = 0.35;

if (knightbuffer > 0)
    knightbuffer--;

switch (phase)
{
    case UnknownEnum.Value_0:
        normal_func = boss_pizzaface_phase1normal;
        break;
    
    case UnknownEnum.Value_1:
        normal_func = boss_pizzahead_phase2normal;
        break;
    
    case UnknownEnum.Value_2:
        normal_func = boss_pizzahead_phase3normal;
        break;
}

switch (state)
{
    case 145:
        grav = 0.5;
        break;
    
    case UnknownEnum.Value_0:
        grav = 0.5;
        normal_func();
        break;
    
    case 226:
        grav = 0.5;
        boss_pizzaface_ram();
        break;
    
    case 222:
        grav = 0.5;
        boss_pizzaface_moustache();
        break;
    
    case 224:
        grav = 0.5;
        boss_pizzaface_eyes();
        break;
    
    case 223:
        grav = 0.5;
        boss_pizzaface_mouth();
        break;
    
    case 225:
        grav = 0.5;
        boss_pizzaface_nose();
        break;
    
    case 227:
        boss_pizzaface_phase2transition();
        break;
    
    case 228:
        boss_pizzahead_look();
        break;
    
    case 229:
        boss_pizzahead_fishing();
        break;
    
    case 231:
        boss_pizzahead_bombrun();
        break;
    
    case 232:
        boss_pizzahead_npcthrow();
        break;
    
    case 233:
        boss_pizzahead_portraitthrow();
        break;
    
    case 234:
        boss_pizzahead_enguarde();
        break;
    
    case 235:
        boss_pizzahead_sexypicture();
        break;
    
    case 236:
        boss_pizzahead_pullinglevel();
        break;
    
    case 237:
        boss_pizzahead_eat();
        break;
    
    case 238:
        boss_pizzahead_surprisebox();
        break;
    
    case 239:
        boss_pizzahead_spinningrun();
        break;
    
    case 240:
        boss_pizzahead_spinningkick();
        break;
    
    case 241:
        boss_pizzahead_spinningpunch();
        break;
    
    case 242:
        boss_pizzahead_groundpunch();
        break;
    
    case 243:
        boss_pizzahead_bigkick();
        break;
    
    case 244:
        boss_pizzahead_slamhead();
        break;
    
    case 245:
        boss_pizzahead_slamhead2();
        break;
    
    case UnknownEnum.Value_134:
        grav = 0.5;
        
        if (grounded)
            state = UnknownEnum.Value_0;
        
        invincible = 1;
        inv_timer = 2;
        break;
    
    case UnknownEnum.Value_61:
        grav = 0.5;
        state_boss_chainsaw();
        break;
    
    case UnknownEnum.Value_84:
        grav = 0.5;
        state_boss_taunt();
        invincible = 1;
        inv_timer = 2;
        break;
    
    case UnknownEnum.Value_147:
        grav = 0.5;
        state_boss_parry();
        invincible = 1;
        inv_timer = 2;
        break;
    
    case UnknownEnum.Value_137:
        grav = 0.5;
        scr_enemy_hit();
        stunned = 30;
        break;
    
    case UnknownEnum.Value_138:
        grav = 0.5;
        state_boss_stun();
        
        if (stunned < 0 && grounded)
            vsp = 0;
        
        break;
}

if (phase == 0 && state != 226)
    invincible = 1;
else
    invincible = 0;

attacking = state == 226 || state == 225 || state == 240 || state == 241 || state == 242 || state == 244 || state == 245;
colliding = state != 226;

if (phase > 0)
{
    mask_index = spr_pizzahead_giddy;
    stunfallspr = spr_pizzahead_giddy;
    walkspr = spr_pizzahead_giddy;
}
