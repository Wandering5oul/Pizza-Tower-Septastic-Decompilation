targetplayer = global.coop ? instance_nearest(x, y, obj_player) : 245;

if (hp <= 0 && state != 145)
{
    if (!destroyed && !thrown && !destroyable)
        boss_destroy(lastplayerid);
}

if (chooseparry_buffer > 0)
    chooseparry_buffer--;

if ((state == UnknownEnum.Value_42 || state == UnknownEnum.Value_102 || state == 167 || state == 171 || state == 173 || (state == UnknownEnum.Value_58 && pogochargeactive) || state == UnknownEnum.Value_77) && alarm[0] <= 0)
    alarm[0] = 6;

switch (state)
{
    case 145:
        grav = 0.5;
        state_boss_arenaround();
        movespeed = 0;
        inv_timer = 2;
        invincible = 1;
        break;
    
    case UnknownEnum.Value_0:
        grav = 0.5;
        boss_noise_normal();
        break;
    
    case UnknownEnum.Value_106:
        grav = 0.5;
        state_boss_bump();
        break;
    
    case UnknownEnum.Value_42:
        grav = 0.5;
        boss_noise_handstandjump();
        break;
    
    case UnknownEnum.Value_102:
        grav = 0.5;
        boss_noise_crouchslide();
        break;
    
    case UnknownEnum.Value_77:
        grav = 0.5;
        boss_noise_skateboard();
        break;
    
    case 167:
        grav = 0.5;
        boss_noise_skateboardturn();
        break;
    
    case UnknownEnum.Value_92:
        grav = 0.5;
        boss_noise_jump();
        break;
    
    case UnknownEnum.Value_74:
        grav = 0.5;
        boss_noise_throwing();
        break;
    
    case UnknownEnum.Value_58:
        grav = 0.5;
        boss_noise_pogo();
        break;
    
    case 170:
        grav = 0.5;
        boss_noise_jetpackstart();
        break;
    
    case 171:
        grav = 0.5;
        boss_noise_jetpack();
        break;
    
    case 173:
        grav = 0.5;
        boss_noise_jetpackspin();
        break;
    
    case UnknownEnum.Value_134:
        grav = 0.5;
        state_boss_walk(boss_noise_do_attack);
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

angry = phase > 6;
attacking = state == UnknownEnum.Value_42 || state == UnknownEnum.Value_102 || state == UnknownEnum.Value_77 || state == 167 || state == UnknownEnum.Value_58 || state == 170 || state == 171 || state == 173 || state == UnknownEnum.Value_74;
