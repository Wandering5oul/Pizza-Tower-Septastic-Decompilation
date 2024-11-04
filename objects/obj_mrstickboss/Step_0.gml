targetplayer = global.coop ? instance_nearest(x, y, obj_player) : 245;

if (hp <= 0 && state != 145)
{
    if (!destroyed && !thrown && !destroyable)
        boss_destroy(lastplayerid);
}

switch (state)
{
    case 145:
        grav = 0.5;
        state_boss_arenaround();
        break;
    
    case UnknownEnum.Value_0:
        grav = 0.5;
        boss_mrstick_normal();
        break;
    
    case 174:
        grav = 0.5;
        boss_mrstick_shield();
        break;
    
    case 175:
        grav = 0.5;
        boss_mrstick_helicopterhat();
        break;
    
    case 176:
        grav = 0.5;
        boss_mrstick_panicjump();
        break;
    
    case UnknownEnum.Value_92:
        grav = 0.5;
        boss_mrstick_jump();
        break;
    
    case 177:
        grav = 0.5;
        boss_mrstick_smokebombstart();
        break;
    
    case 178:
        grav = 0.5;
        boss_mrstick_smokebombcrawl();
        break;
    
    case 179:
        grav = 0.5;
        boss_mrstick_springshoes();
        break;
    
    case 180:
        grav = 0.5;
        boss_mrstick_cardboard();
        break;
    
    case 181:
        grav = 0.5;
        boss_mrstick_cardboardend();
        break;
    
    case 182:
        grav = 0.5;
        boss_mrstick_mockery();
        break;
    
    case UnknownEnum.Value_134:
        grav = 0.5;
        state_boss_walk(boss_mrstick_decide_attack);
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

colliding = !(state == UnknownEnum.Value_92 || state == 180 || state == 181);
attacking = state == 174 || state == UnknownEnum.Value_92 || state == 180 || state == 181 || state == 177;
