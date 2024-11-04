switch (state)
{
    case UnknownEnum.Value_126:
        scr_enemy_idle();
        break;
    
    case UnknownEnum.Value_130:
        scr_enemy_turn();
        break;
    
    case UnknownEnum.Value_134:
        scr_enemy_walk();
        break;
    
    case UnknownEnum.Value_136:
        scr_enemy_land();
        break;
    
    case UnknownEnum.Value_137:
        scr_enemy_hit();
        break;
    
    case UnknownEnum.Value_138:
        scr_enemy_stun();
        break;
    
    case UnknownEnum.Value_4:
        scr_enemy_grabbed();
        break;
}

if (!instance_exists(obj_slaphitbox))
    slapped = 0;

stunned = 100;

if (cigar == 0)
{
    landspr = spr_noisesatellite;
    idlespr = spr_noisesatellite;
    fallspr = spr_noisesatellite;
    hitceillingspr = spr_noisesatellite;
    stunfalltransspr = spr_noisesatellite;
    hitwallspr = spr_noisesatellite;
    stunfallspr = spr_noisesatellitestun;
    rollingspr = spr_noisesatellite;
    walkspr = spr_noisesatellite;
    turnspr = spr_noisesatellite;
    flyingspr = spr_noisesatellite;
    hitspr = spr_noisesatellite;
    stunlandspr = spr_noisesatellite;
    stunspr = spr_noisesatellite;
    recoveryspr = spr_noisesatellite;
    stompedspr = spr_noisesatellite;
    grabbedspr = spr_noisesatellitestun;
}

if (state != UnknownEnum.Value_4)
    depth = 0;

if (state != UnknownEnum.Value_138)
    thrown = 0;

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;
