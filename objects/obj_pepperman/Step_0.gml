targetplayer = global.coop ? instance_nearest(x, y, obj_player) : 245;

if (obj_bosscontroller.state == UnknownEnum.Value_144)
    exit;

if (hp <= 0 && state != 145 && state != 162)
{
    if (!thrown && !destroyable)
        boss_destroy(lastplayerid);
}

if (chooseparry_buffer > 0)
    chooseparry_buffer--;

switch (phase)
{
    case UnknownEnum.Value_1:
    case UnknownEnum.Value_2:
        normal_func = boss_pepperman_normal;
        break;
    
    case UnknownEnum.Value_3:
    case UnknownEnum.Value_4:
    case UnknownEnum.Value_5:
    case UnknownEnum.Value_6:
        normal_func = boss_pepperman_phase3normal;
        break;
}

switch (state)
{
    case 145:
        grav = 0.5;
        state_boss_arenaround();
        break;
    
    case UnknownEnum.Value_0:
        grav = 0.5;
        normal_func();
        break;
    
    case UnknownEnum.Value_92:
        grav = 0.5;
        boss_pepperman_jump();
        invincible = 1;
        inv_timer = 2;
        break;
    
    case UnknownEnum.Value_108:
        grav = 0.5;
        boss_pepperman_freefall();
        break;
    
    case UnknownEnum.Value_111:
        grav = 0.5;
        boss_pepperman_freefallland();
        break;
    
    case UnknownEnum.Value_122:
        grav = 0.5;
        boss_pepperman_freefallprep();
        break;
    
    case UnknownEnum.Value_153:
        grav = 0.5;
        boss_pepperman_shoulderbash();
        break;
    
    case 157:
        grav = 0.5;
        boss_pepperman_supershoulderbash();
        break;
    
    case 158:
        grav = 0.5;
        boss_pepperman_superattackstart();
        break;
    
    case 159:
        grav = 0.5;
        boss_pepperman_superattackcharge();
        break;
    
    case UnknownEnum.Value_76:
        grav = 0.5;
        boss_pepperman_superslam();
        break;
    
    case 162:
        grav = 0.5;
        boss_pepperman_fistmatch();
        break;
    
    case 163:
        grav = 0.5;
        boss_pepperman_fistmatchend();
        break;
    
    case UnknownEnum.Value_83:
        grav = 0.5;
        boss_pepperman_shoulder();
        break;
    
    case 161:
        grav = 0.5;
        boss_pepperman_shoulderturn();
        break;
    
    case UnknownEnum.Value_134:
        grav = 0.5;
        state_boss_walk(boss_pepperman_decide_attack);
        invincible = 1;
        inv_timer = 2;
        break;
    
    case 128:
        grav = 0.5;
        boss_pepperman_charge();
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
        stunned = targetstunned;
        break;
    
    case UnknownEnum.Value_138:
        grav = 0.5;
        state_boss_stun();
        
        if (stunned < 0)
            vsp = 0;
        
        break;
}

xscale = image_xscale;
colliding = !(state == UnknownEnum.Value_76 || state == 162 || state == 158 || state == 159);
attacking = state == UnknownEnum.Value_153 || state == UnknownEnum.Value_108 || state == UnknownEnum.Value_122 || state == 157 || state == UnknownEnum.Value_83 || state == UnknownEnum.Value_76 || state == 162 || state == 158 || state == 159 || state == UnknownEnum.Value_134;
