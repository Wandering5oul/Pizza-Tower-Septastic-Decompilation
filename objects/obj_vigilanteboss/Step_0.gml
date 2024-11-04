var ch;

targetplayer = global.coop ? instance_nearest(x, y, obj_player) : 245;

if (hp <= 0 && state != 145 && state != 162)
{
    if (!thrown && !destroyable)
        boss_destroy(lastplayerid);
}

if ((state == UnknownEnum.Value_103 || state == UnknownEnum.Value_105 || state == UnknownEnum.Value_102 || state == UnknownEnum.Value_82 || state == UnknownEnum.Value_80 || state == 166 || state == UnknownEnum.Value_42) && alarm[0] <= 0)
    alarm[0] = 6;

if (chooseparry_buffer > 0)
    chooseparry_buffer--;

if (important && honor && nexthonor && phase > UnknownEnum.Value_3 && state != 160)
{
    ch = 0;
    
    with (obj_player)
    {
        if (state == UnknownEnum.Value_41)
            ch = 1;
    }
    
    if (instance_exists(obj_shotgunbullet) || ch)
    {
        nexthonor = 0;
        
        with (obj_tv)
        {
            showtext = 1;
            message = "NO HONOR";
            alarm[0] = 200;
        }
    }
}

switch (phase)
{
    case UnknownEnum.Value_4:
    case UnknownEnum.Value_5:
    case UnknownEnum.Value_6:
        normal_func = boss_vigilante_normal_phase4;
        break;
    
    default:
        normal_func = boss_vigilante_normal;
}

switch (state)
{
    case 145:
        grav = 0.5;
        state_boss_arenaround();
        honor = nexthonor;
        break;
    
    case UnknownEnum.Value_0:
        grav = 0.5;
        normal_func();
        break;
    
    case 149:
        grav = 0.5;
        boss_vigilante_float();
        break;
    
    case UnknownEnum.Value_1:
        grav = 0.5;
        boss_vigilante_revolver();
        break;
    
    case UnknownEnum.Value_103:
        grav = 0.5;
        boss_vigilante_mach1();
        break;
    
    case UnknownEnum.Value_102:
        grav = 0.5;
        boss_vigilante_crouchslide();
        break;
    
    case UnknownEnum.Value_105:
        grav = 0.5;
        boss_vigilante_machslide();
        break;
    
    case UnknownEnum.Value_106:
        grav = 0.5;
        state_boss_bump();
        break;
    
    case UnknownEnum.Value_92:
        grav = 0.5;
        boss_vigilante_jump();
        break;
    
    case UnknownEnum.Value_2:
        grav = 0.5;
        boss_vigilante_dynamite();
        break;
    
    case 128:
        grav = 0.5;
        boss_vigilante_charge();
        break;
    
    case UnknownEnum.Value_80:
        grav = 0.5;
        boss_vigilante_punch();
        break;
    
    case 164:
        grav = 0.5;
        boss_vigilante_groundpunchstart();
        break;
    
    case UnknownEnum.Value_122:
        grav = 0.5;
        boss_vigilante_freefallprep();
        break;
    
    case UnknownEnum.Value_108:
        grav = 0.5;
        boss_vigilante_freefall();
        break;
    
    case UnknownEnum.Value_111:
        grav = 0.5;
        boss_vigilante_freefallland();
        break;
    
    case 166:
        grav = 0.5;
        boss_vigilante_millionpunch();
        break;
    
    case UnknownEnum.Value_82:
        grav = 0.5;
        boss_vigilante_uppunch();
        break;
    
    case UnknownEnum.Value_42:
        grav = 0.5;
        boss_vigilante_handstandjump();
        break;
    
    case 158:
        grav = 0.5;
        boss_vigilante_superattackstart();
        break;
    
    case 160:
        grav = 0.5;
        boss_vigilante_superattack();
        break;
    
    case UnknownEnum.Value_134:
        grav = 0.5;
        state_boss_walk(boss_vigilante_decide_attack);
        inv_timer = 2;
        invincible = 1;
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
        normalattack_cooldown = normalattack_max[phase - 1];
        break;
    
    case UnknownEnum.Value_137:
        grav = 0.5;
        scr_enemy_hit();
        stunned = targetstunned;
        break;
    
    case UnknownEnum.Value_138:
        grav = 0.5;
        state_boss_stun();
        
        if (stunned < 0)
            vsp = 0;
        
        break;
}

if (hitstate == 160 || state == 160)
{
    with (lastplayerid)
    {
        if (state != UnknownEnum.Value_137 && state != UnknownEnum.Value_156)
        {
            if (sprite_index == spr_player_pistolshot && image_index > (image_number - 1))
                sprite_index = spr_player_pistolidle;
            
            if (sprite_index != spr_player_pistolshot && sprite_index != spr_idle && other.state == 160 && other.duel_buffer > 0)
                sprite_index = spr_idle;
        }
    }
}

attacking = state == UnknownEnum.Value_1 || state == UnknownEnum.Value_103 || state == 128 || state == UnknownEnum.Value_80 || state == 164 || state == 166 || state == UnknownEnum.Value_108 || state == UnknownEnum.Value_82 || state == UnknownEnum.Value_42 || state == 160 || state == 158 || state == UnknownEnum.Value_102;
