enum UnknownEnum {
	Value_0,
	Value_1,
	Value_2,
	Value_3,
	Value_4,
	Value_5,
	Value_6,
	Value_7,
	Value_8,
	Value_9,
	Value_10,
	Value_11,
	Value_12,
	Value_13,
	Value_14,
	Value_15,
	Value_16,
	Value_17,
	Value_18,
	Value_19,
	Value_20,
	Value_21,
	Value_22,
	Value_23,
	Value_24,
	Value_25,
	Value_26,
	Value_27,
	Value_28,
	Value_29,
	Value_30,
	Value_31,
	Value_32,
	Value_33,
	Value_34,
	Value_35,
	Value_36,
	Value_37,
	Value_38,
	Value_39,
	Value_40,
	Value_41,
	Value_42,
	Value_43,
	Value_44,
	Value_45,
	Value_46,
	Value_47,
	Value_48,
	Value_49,
	Value_50,
	Value_51,
	Value_52,
	Value_53,
	Value_54,
	Value_55,
	Value_56,
	Value_57,
	Value_58,
	Value_59,
	Value_60,
	Value_61,
	Value_62,
	Value_64,
	Value_65,
	Value_66,
	Value_67,
	Value_68,
	Value_69,
	Value_70,
	Value_71,
	Value_72,
	Value_73,
	Value_74,
	Value_75,
	Value_76,
	Value_77,
	Value_78,
	Value_79,
	Value_80,
	Value_81,
	Value_82,
	Value_83,
	Value_84,
	Value_85,
	Value_86,
	Value_87,
	Value_88,
	Value_89,
	Value_90,
	Value_91,
	Value_92,
	Value_93,
	Value_94,
	Value_95,
	Value_96,
	Value_97,
	Value_98,
	Value_99,
	Value_100,
	Value_101,
	Value_102,
	Value_103,
	Value_104,
	Value_105,
	Value_106,
	Value_107,
	Value_108,
	Value_109,
	Value_111,
	Value_112,
	Value_113,
	Value_114,
	Value_115,
	Value_116,
	Value_117,
	Value_118,
	Value_119,
	Value_120,
	Value_121,
	Value_122,
	Value_123,
	Value_124,
	Value_125,
	Value_126,
	Value_129,
	Value_130,
	Value_134,
	Value_136,
	Value_137,
	Value_138,
	Value_144,
	Value_146,
	Value_147,
	Value_148,
	Value_150,
	Value_152,
	Value_153,
	Value_154,
	Value_155,
	Value_156,
	Value_165,
	Value_183,
	Value_184,
	Value_185,
	Value_186,
	Value_187,
	Value_190,
	Value_191,
	Value_192,
	Value_193,
	Value_194,
	Value_195,
	Value_196,
	Value_197,
	Value_198,
	Value_200,
	Value_201,
	Value_202,
	Value_203,
	Value_205,
	Value_206,
	Value_207,
	Value_209,
	Value_210,
	Value_211,
	Value_212,
	Value_213,
	Value_214,
	Value_221,
	// not a different set surprisingly
	Value_305,
	Value_306,
}

prevhsp = hsp;
prevmove = move;
prevmovespeed = movespeed;
previcemovespeed = icemovespeed;
prevstate = state;
prevxscale = xscale;

if (character == "P" && !ispeppino && !isgustavo)
{
    if (grounded && vsp > 0)
    {
        noisewalljump = 0;
        noisedoublejump = 1;
    }
}

if (character == "P" && !ispeppino && !skateboarding && ((scr_check_superjump() && key_jump2) || key_superjump) && state != UnknownEnum.Value_121 && grounded && vsp > 0 && (state == UnknownEnum.Value_0 || state == UnknownEnum.Value_104))
{
    sprite_index = spr_superjumpprep;
    state = UnknownEnum.Value_99;
    hsp = 0;
    image_index = 0;
}

switch (state)
{
    case UnknownEnum.Value_0:
        scr_player_normal();
        break;
    
    case UnknownEnum.Value_1:
        scr_player_revolver();
        break;
    
    case UnknownEnum.Value_2:
        scr_player_dynamite();
        break;
    
    case UnknownEnum.Value_3:
        scr_player_boots();
        break;
    
    case UnknownEnum.Value_4:
        scr_player_grabbed();
        break;
    
    case UnknownEnum.Value_6:
        scr_player_finishingblow();
        break;
    
    case UnknownEnum.Value_5:
        scr_player_tumble();
        break;
    
    case UnknownEnum.Value_18:
        scr_player_titlescreen();
        break;
    
    case UnknownEnum.Value_7:
        scr_player_ejected();
        break;
    
    case UnknownEnum.Value_10:
        scr_player_firemouth();
        break;
    
    case UnknownEnum.Value_9:
        scr_player_fireass();
        break;
    
    case UnknownEnum.Value_8:
        scr_player_transitioncutscene();
        break;
    
    case UnknownEnum.Value_19:
        scr_playerN_hookshot();
        break;
    
    case UnknownEnum.Value_23:
        scr_player_slap();
        break;
    
    case UnknownEnum.Value_20:
        scr_player_tacklecharge();
        break;
    
    case UnknownEnum.Value_24:
        scr_player_cheesepep();
        break;
    
    case UnknownEnum.Value_26:
        scr_player_cheesepepjump();
        break;
    
    case UnknownEnum.Value_27:
        scr_player_cheesepepfling();
        break;
    
    case UnknownEnum.Value_21:
        scr_player_cheeseball();
        break;
    
    case UnknownEnum.Value_22:
        scr_player_cheeseballclimbwall();
        break;
    
    case UnknownEnum.Value_29:
        scr_player_cheesepepstickside();
        break;
    
    case UnknownEnum.Value_30:
        scr_player_cheesepepstickup();
        break;
    
    case UnknownEnum.Value_25:
        scr_player_cheesepepstick();
        break;
    
    case UnknownEnum.Value_28:
        scr_player_cheesepeplaunch();
        break;
    
    case UnknownEnum.Value_33:
        scr_player_boxxedpep();
        break;
    
    case UnknownEnum.Value_35:
        scr_player_boxxedpepjump();
        break;
    
    case UnknownEnum.Value_34:
        scr_player_boxxedpepspin();
        break;
    
    case UnknownEnum.Value_36:
        scr_player_pistolaim();
        break;
    
    case UnknownEnum.Value_37:
        scr_player_climbwall();
        break;
    
    case UnknownEnum.Value_38:
        scr_player_knightpepslopes();
        break;
    
    case UnknownEnum.Value_39:
        scr_player_portal();
        break;
    
    case UnknownEnum.Value_40:
        scr_player_secondjump();
        break;
    
    case UnknownEnum.Value_41:
        scr_player_chainsawbump();
        break;
    
    case UnknownEnum.Value_42:
        scr_player_handstandjump();
        break;
    
    case UnknownEnum.Value_43:
        scr_player_lungeattack();
        break;
    
    case UnknownEnum.Value_44:
        scr_player_lungegrab();
        break;
    
    case UnknownEnum.Value_45:
        scr_player_dashtumble();
        break;
    
    case UnknownEnum.Value_153:
        scr_player_shoulderbash();
        break;
    
    case UnknownEnum.Value_46:
        scr_player_gottreasure();
        break;
    
    case UnknownEnum.Value_47:
        scr_player_knightpep();
        break;
    
    case UnknownEnum.Value_48:
        scr_player_knightpepattack();
        break;
    
    case UnknownEnum.Value_49:
        scr_player_knightpepbump();
        break;
    
    case UnknownEnum.Value_50:
        scr_player_meteorpep();
        break;
    
    case UnknownEnum.Value_51:
        scr_player_bombpep();
        break;
    
    case UnknownEnum.Value_54:
        scr_player_bombpepup();
        break;
    
    case UnknownEnum.Value_53:
        scr_player_bombpepside();
        break;
    
    case UnknownEnum.Value_52:
        scr_player_bombgrab();
        break;
    
    case UnknownEnum.Value_55:
        scr_player_grabbing();
        break;
    
    case UnknownEnum.Value_56:
        scr_player_chainsawpogo();
        break;
    
    case UnknownEnum.Value_57:
        scr_player_shotgunjump();
        break;
    
    case UnknownEnum.Value_59:
        scr_player_stunned();
        break;
    
    case UnknownEnum.Value_60:
        scr_player_highjump();
        break;
    
    case UnknownEnum.Value_61:
        scr_player_chainsaw();
        break;
    
    case UnknownEnum.Value_137:
        scr_player_hit();
        break;
    
    case UnknownEnum.Value_156:
        scr_player_thrown();
        break;
    
    case UnknownEnum.Value_62:
        scr_player_facestomp();
        break;
    
    case UnknownEnum.Value_64:
        scr_player_timesup();
        break;
    
    case UnknownEnum.Value_65:
        scr_player_machroll();
        break;
    
    case UnknownEnum.Value_72:
        scr_player_pistol();
        break;
    
    case UnknownEnum.Value_66:
        scr_player_shotgun();
        break;
    
    case UnknownEnum.Value_67:
        scr_player_shotguncrouch();
        break;
    
    case UnknownEnum.Value_68:
        scr_player_shotguncrouchjump();
        break;
    
    case UnknownEnum.Value_69:
        scr_player_shotgunshoot();
        break;
    
    case UnknownEnum.Value_71:
        scr_player_shotgunfreefall();
        break;
    
    case UnknownEnum.Value_70:
        scr_player_shotgundash();
        break;
    
    case UnknownEnum.Value_73:
        scr_player_machfreefall();
        break;
    
    case UnknownEnum.Value_74:
        scr_player_throwing();
        break;
    
    case UnknownEnum.Value_76:
        scr_player_superslam();
        break;
    
    case UnknownEnum.Value_75:
        scr_player_slam();
        break;
    
    case UnknownEnum.Value_77:
        scr_player_skateboard();
        break;
    
    case UnknownEnum.Value_78:
        scr_player_grind();
        break;
    
    case UnknownEnum.Value_79:
        scr_player_grab();
        break;
    
    case UnknownEnum.Value_80:
        scr_player_punch();
        break;
    
    case UnknownEnum.Value_81:
        scr_player_backkick();
        break;
    
    case UnknownEnum.Value_82:
        scr_player_uppunch();
        break;
    
    case UnknownEnum.Value_83:
        scr_player_shoulder();
        break;
    
    case UnknownEnum.Value_84:
        scr_player_backbreaker();
        break;
    
    case UnknownEnum.Value_85:
        scr_player_graffiti();
        break;
    
    case UnknownEnum.Value_86:
        scr_player_bossdefeat();
        break;
    
    case UnknownEnum.Value_88:
        scr_player_bossintro();
        break;
    
    case UnknownEnum.Value_96:
        scr_player_smirk();
        break;
    
    case UnknownEnum.Value_87:
        scr_player_pizzathrow();
        break;
    
    case UnknownEnum.Value_89:
        scr_player_gameover();
        break;
    
    case UnknownEnum.Value_123:
        scr_player_Sjumpland();
        break;
    
    case UnknownEnum.Value_122:
        scr_player_freefallprep();
        break;
    
    case UnknownEnum.Value_120:
        scr_player_runonball();
        break;
    
    case UnknownEnum.Value_118:
        scr_player_boulder();
        break;
    
    case UnknownEnum.Value_90:
        scr_player_keyget();
        break;
    
    case UnknownEnum.Value_91:
        scr_player_tackle();
        break;
    
    case UnknownEnum.Value_94:
        scr_player_slipnslide();
        break;
    
    case UnknownEnum.Value_93:
        scr_player_ladder();
        break;
    
    case UnknownEnum.Value_92:
        scr_player_jump();
        break;
    
    case UnknownEnum.Value_98:
        scr_player_victory();
        break;
    
    case UnknownEnum.Value_95:
        scr_player_comingoutdoor();
        break;
    
    case UnknownEnum.Value_97:
        scr_player_Sjump();
        break;
    
    case UnknownEnum.Value_99:
        scr_player_Sjumpprep();
        break;
    
    case UnknownEnum.Value_100:
        scr_player_crouch();
        break;
    
    case UnknownEnum.Value_101:
        scr_player_crouchjump();
        break;
    
    case UnknownEnum.Value_102:
        scr_player_crouchslide();
        break;
    
    case UnknownEnum.Value_103:
        scr_player_mach1();
        break;
    
    case UnknownEnum.Value_104:
        scr_player_mach2();
        break;
    
    case UnknownEnum.Value_121:
        scr_player_mach3();
        break;
    
    case UnknownEnum.Value_105:
        scr_player_machslide();
        break;
    
    case UnknownEnum.Value_106:
        scr_player_bump();
        break;
    
    case UnknownEnum.Value_107:
        scr_player_hurt();
        break;
    
    case UnknownEnum.Value_108:
        scr_player_freefall();
        break;
    
    case UnknownEnum.Value_111:
        scr_player_freefallland();
        break;
    
    case UnknownEnum.Value_109:
        scr_player_hang();
        break;
    
    case UnknownEnum.Value_112:
        scr_player_door();
        break;
    
    case UnknownEnum.Value_113:
        scr_player_barrel();
        break;
    
    case UnknownEnum.Value_114:
        scr_player_barreljump();
        break;
    
    case UnknownEnum.Value_116:
        scr_player_barrelslide();
        break;
    
    case UnknownEnum.Value_115:
        scr_player_barrelclimbwall();
        break;
    
    case UnknownEnum.Value_117:
        scr_player_current();
        break;
    
    case UnknownEnum.Value_119:
    case UnknownEnum.Value_152:
        scr_player_taxi();
        break;
    
    case UnknownEnum.Value_58:
        scr_player_pogo();
        break;
    
    case UnknownEnum.Value_31:
        scr_player_rideweenie();
        break;
    
    case UnknownEnum.Value_32:
        scr_player_motorcycle();
        break;
    
    case UnknownEnum.Value_124:
        scr_player_faceplant();
        break;
    
    case UnknownEnum.Value_16:
        scr_player_ghost();
        break;
    
    case UnknownEnum.Value_17:
        scr_player_ghostpossess();
        break;
    
    case UnknownEnum.Value_11:
        scr_player_mort();
        break;
    
    case UnknownEnum.Value_12:
        scr_player_mortjump();
        break;
    
    case UnknownEnum.Value_13:
        scr_player_mortattack();
        break;
    
    case UnknownEnum.Value_14:
        scr_player_morthook();
        break;
    
    case UnknownEnum.Value_15:
        scr_player_hook();
        break;
    
    case UnknownEnum.Value_144:
        scr_player_arenaintro();
        break;
    
    case UnknownEnum.Value_146:
        scr_player_actor();
        break;
    
    case UnknownEnum.Value_147:
        scr_player_parry();
        break;
    
    case UnknownEnum.Value_148:
        scr_player_golf();
        break;
    
    case UnknownEnum.Value_150:
        scr_player_tube();
        break;
    
    case UnknownEnum.Value_154:
        scr_player_pummel();
        break;
    
    case UnknownEnum.Value_165:
        scr_player_slipbanan();
        break;
    
    case UnknownEnum.Value_183:
        scr_player_bombdelete();
        break;
    
    case UnknownEnum.Value_184:
        scr_player_rocket();
        break;
    
    case UnknownEnum.Value_185:
        scr_player_rocketslide();
        break;
    
    case UnknownEnum.Value_186:
        scr_player_gotoplayer();
        break;
    
    case UnknownEnum.Value_187:
        scr_player_trickjump();
        break;
    
    case UnknownEnum.Value_190:
        scr_player_ridecow();
        break;
    
    case UnknownEnum.Value_191:
        scr_player_ratmount();
        break;
    
    case UnknownEnum.Value_196:
        scr_player_ratmounthurt();
        break;
    
    case UnknownEnum.Value_192:
        scr_player_ratmountjump();
        break;
    
    case UnknownEnum.Value_193:
        scr_player_ratmountattack();
        break;
    
    case UnknownEnum.Value_194:
        scr_player_ratmountspit();
        break;
    
    case UnknownEnum.Value_195:
        scr_player_ratmountclimbwall();
        break;
    
    case UnknownEnum.Value_197:
        scr_player_ratmountgroundpound();
        break;
    
    case UnknownEnum.Value_198:
        scr_player_ratmountbounce();
        break;
    
    case UnknownEnum.Value_200:
        scr_player_ratmountballoon();
        break;
    
    case UnknownEnum.Value_202:
        scr_player_ratmountgrind();
        break;
    
    case UnknownEnum.Value_201:
        scr_player_ratmounttumble();
        break;
    
    case UnknownEnum.Value_203:
        scr_player_ratmounttrickjump();
        break;
    
    case UnknownEnum.Value_205:
        scr_player_blockstance();
        break;
    
    case UnknownEnum.Value_206:
        scr_player_balloon();
        break;
    
    case UnknownEnum.Value_207:
        scr_player_debugstate();
        break;
    
    case UnknownEnum.Value_209:
        scr_player_trashjump();
        break;
    
    case UnknownEnum.Value_210:
        scr_player_trashroll();
        break;
    
    case UnknownEnum.Value_211:
        scr_player_stringfling();
        break;
    
    case UnknownEnum.Value_212:
        scr_player_stringjump();
        break;
    
    case UnknownEnum.Value_213:
        scr_player_noisejetpack();
        break;
    
    case UnknownEnum.Value_214:
        scr_player_spiderweb();
        break;
    
    case UnknownEnum.Value_221:
        scr_player_animatronic();
        break;
    
    case UnknownEnum.Value_306:
        scr_playerN_machcancel();
        break;
    
    case UnknownEnum.Value_305:
        scr_player_noisecrusher();
        break;
}

if (array_length(chainsawd) > 0 && state != UnknownEnum.Value_41)
    chainsawd = [];

if (state != UnknownEnum.Value_221)
    animatronic_buffer = 360;

if (state == UnknownEnum.Value_33 && grounded && vsp > 0)
    boxxedpepjump = boxxedpepjumpmax;

if (state != UnknownEnum.Value_42 && state != UnknownEnum.Value_5)
    crouchslipbuffer = 0;

if (state != UnknownEnum.Value_121 && (state != UnknownEnum.Value_61 || tauntstoredstate != UnknownEnum.Value_121))
    mach4mode = false;

if (verticalbuffer > 0)
    verticalbuffer--;

scr_slope_angle();

if (grounded && vsp > 0)
{
    icemomentum = place_meeting(x, y + 1, obj_iceblock) || place_meeting(x, y + 1, obj_iceblockslope);
}
else if (icemomentum)
{
    if (xscale != dir && movespeed != 0 && state == UnknownEnum.Value_92)
    {
        icedir = -xscale;
        icemovespeed = 8;
    }
    
    if (move == 0)
        icemovespeed = 0;
}

if (!grounded)
    icemomentum = 0;

if (!icemomentum && state != UnknownEnum.Value_105)
    icedir = -xscale;

if (state == UnknownEnum.Value_37)
    icemomentum = 0;

hsp_carry += (icedir * icemovespeed);
icemovespeed = Approach(icemovespeed, 0, 0.1);

if (state == UnknownEnum.Value_92 || state == UnknownEnum.Value_103 || state == UnknownEnum.Value_104 || state == UnknownEnum.Value_121)
    scr_do_noisejetpack();

if (walljumpbuffer > 0)
    walljumpbuffer--;

if (grounded && vsp > 0 && state != UnknownEnum.Value_213)
    jetpackfuel = jetpackmax;

if (state == UnknownEnum.Value_203 || state == UnknownEnum.Value_191 || state == UnknownEnum.Value_193 || state == UnknownEnum.Value_198 || state == UnknownEnum.Value_195 || state == UnknownEnum.Value_197 || state == UnknownEnum.Value_196 || state == UnknownEnum.Value_192 || state == UnknownEnum.Value_194 || state == 199 || state == UnknownEnum.Value_200 || state == UnknownEnum.Value_201 || state == UnknownEnum.Value_202)
    isgustavo = 1;
else
    isgustavo = 0;

if (tauntstoredisgustavo)
{
    isgustavo = 1;
    
    if (state != UnknownEnum.Value_84 && state != UnknownEnum.Value_147 && state != UnknownEnum.Value_85)
        tauntstoredisgustavo = 0;
}

if (state != UnknownEnum.Value_121)
{
    launch = 0;
    launched = 0;
    launch_buffer = 0;
}

if (launch_buffer > 0)
    launch_buffer--;
else
    launched = 0;

if (state != UnknownEnum.Value_6)
    finishingblow = 0;

if (dash_doubletap > 0)
    dash_doubletap--;

if (cow_buffer > 0)
    cow_buffer--;

if (state == UnknownEnum.Value_43)
    lunge_buffer = 14;

if (blur_effect > 0)
{
    blur_effect--;
}
else if (state == UnknownEnum.Value_5 || state == UnknownEnum.Value_198 || state == UnknownEnum.Value_193 || state == UnknownEnum.Value_42 || (state == UnknownEnum.Value_116 && movespeed >= barrel_rollspeed_threshold) || (state == UnknownEnum.Value_79 && sprite_index == spr_swingding && swingdingdash <= 0) || (state == UnknownEnum.Value_80 && (sprite_index == spr_player_breakdanceuppercut || sprite_index == spr_player_breakdanceuppercutend)) || state == UnknownEnum.Value_108 || state == UnknownEnum.Value_43)
{
    blur_effect = 2;
    
    with (create_blur_afterimage(x, y, sprite_index, image_index - 1, xscale))
        playerid = other.id;
}

if (state != UnknownEnum.Value_79)
    grabbingenemy = 0;

if (state != UnknownEnum.Value_104 && state != UnknownEnum.Value_121 && state != UnknownEnum.Value_187 && state != UnknownEnum.Value_201 && state != UnknownEnum.Value_203)
{
    ramp = 0;
    ramp_points = 0;
}

if (state != UnknownEnum.Value_112 && place_meeting(x, y, obj_boxofpizza))
    state = UnknownEnum.Value_100;

if (shoot_buffer > 0)
    shoot_buffer--;

if (cheesepep_buffer > 0)
    cheesepep_buffer--;

if (state != UnknownEnum.Value_29)
    yscale = 1;

if (invhurt_buffer > 0)
    invhurt_buffer--;

if (state == UnknownEnum.Value_107)
{
    if (hurt_buffer > 0)
    {
        hurt_buffer--;
    }
    else
    {
        invhurt_buffer = invhurt_max;
        hurt_buffer = -1;
    }
}
else
{
    if (hurt_buffer > 0)
        invhurt_buffer = invhurt_max;
    
    hurt_buffer = -1;
}

if (room == Realtitlescreen && instance_exists(obj_mainmenuselect))
    state = UnknownEnum.Value_18;

if (wallclingcooldown < 10)
    wallclingcooldown++;

if (!instance_exists(superchargedeffectid) && supercharged)
{
    with (instance_create(x, y, obj_superchargeeffect))
    {
        playerid = other.id;
        other.superchargedeffectid = id;
    }
}

if (state != UnknownEnum.Value_97)
    sjumpvsp = -12;

if (state != UnknownEnum.Value_108)
    freefallvsp = 15;

if (supercharge >= 9)
    supercharged = 1;

if (!instance_exists(pizzashieldid) && pizzashield == 1)
{
    with (instance_create(x, y, obj_pizzashield))
    {
        playerid = other.object_index;
        other.pizzashieldid = id;
    }
}

if (visible == false && state == UnknownEnum.Value_95)
{
    coopdelay++;
    image_index = 0;
    
    if (coopdelay == 50)
    {
        visible = true;
        coopdelay = 0;
    }
}

if (global.coop == 1)
{
    if ((state == UnknownEnum.Value_80 || state == UnknownEnum.Value_42) && !(obj_player2.state == UnknownEnum.Value_80 || obj_player2.state == UnknownEnum.Value_42))
        fightballadvantage = 1;
    else if (!(obj_player2.state == UnknownEnum.Value_80 || obj_player2.state == UnknownEnum.Value_42))
        fightballadvantage = 0;
}

if (state != UnknownEnum.Value_58 && state != UnknownEnum.Value_84)
{
    pogospeed = 6;
    pogospeedprev = 0;
}

scr_playersounds();

if (grounded)
    doublejump = 0;

if (pogochargeactive == 1)
{
    if (flashflicker == 0)
    {
        if (pogochargeactive == 1 && sprite_index == spr_playerN_pogofall)
            sprite_index = spr_playerN_pogofallmach;
        
        if (pogochargeactive == 1 && sprite_index == spr_playerN_pogobounce)
            sprite_index = spr_playerN_pogobouncemach;
    }
    
    flashflicker = 1;
    pogocharge--;
}
else
{
    flashflicker = 0;
}

if (state != UnknownEnum.Value_74)
    kickbomb = 0;

if (pogocharge == 0)
{
    pogochargeactive = 0;
    pogocharge = 100;
}

if (flashflicker == 1)
{
    flashflickertime++;
    
    if (flashflickertime == 20)
    {
        flash = 1;
        flashflickertime = 0;
    }
}

if (state != UnknownEnum.Value_121 && state != UnknownEnum.Value_4)
    fightball = 0;

if (state != UnknownEnum.Value_4 && state != UnknownEnum.Value_107)
{
    if (grounded && state != UnknownEnum.Value_55)
        suplexmove = 0;
}

if (state != UnknownEnum.Value_108 && (state != UnknownEnum.Value_61 || tauntstoredstate != UnknownEnum.Value_108))
    freefallsmash = 0;

if (global.playerhealth <= 0 && state != UnknownEnum.Value_89)
{
    image_index = 0;
    sprite_index = spr_playerV_dead;
    state = UnknownEnum.Value_89;
}

if (state == UnknownEnum.Value_89 && y > (room_height * 2))
{
    targetDoor = "D";
    scr_playerreset();
    
    if (global.coop == 1)
    {
        with (obj_player2)
        {
            scr_playerreset();
            targetDoor = "D";
        }
    }
    
    with (obj_player)
    {
        targetDoor = "D";
        room = hub_reception;
    }
}

if (mort == 1)
{
    if (state != UnknownEnum.Value_11 && state != UnknownEnum.Value_12 && !doublejump)
        mort = 0;
}

if (baddiegrabbedID == 449 && (state == UnknownEnum.Value_79 || state == UnknownEnum.Value_76 || state == UnknownEnum.Value_20))
    state = UnknownEnum.Value_0;

if (!(state == UnknownEnum.Value_79 || state == UnknownEnum.Value_76 || state == UnknownEnum.Value_104))
{
    baddiegrabbedID = 449;
    heavy = 0;
}

if (cutscene == 1 && state != UnknownEnum.Value_186)
    global.heattime = 60;

if (anger == 0)
    angry = 0;

if (anger > 0)
{
    angry = 1;
    anger -= 1;
}

if (sprite_index == spr_winding && state != UnknownEnum.Value_0)
    windingAnim = 0;

if (state != UnknownEnum.Value_79)
    swingdingbuffer = 0;

if (state != UnknownEnum.Value_55 && state != UnknownEnum.Value_113 && state != UnknownEnum.Value_34 && state != UnknownEnum.Value_35 && state != UnknownEnum.Value_5 && state != UnknownEnum.Value_16 && state != UnknownEnum.Value_17 && sprite_index != spr_player_mortjump)
    grav = 0.5;
else if (state == UnknownEnum.Value_113 || state == UnknownEnum.Value_5)
    grav = 0.6;
else if (state == UnknownEnum.Value_16 || state == UnknownEnum.Value_17)
    grav = 0;
else if (state == UnknownEnum.Value_34)
    grav = 0.2;
else if (state == UnknownEnum.Value_35)
    grav = 0.4;

if (state == UnknownEnum.Value_113 && key_jump2 && !jumpstop)
    grav = 0.4;

if (sprite_index == spr_player_idlevomit && image_index > 28 && image_index < 43)
    instance_create(x + random_range(-5, obj_tubeleft), y + 46, obj_vomit);

if (sprite_index == spr_player_idlevomitblood && image_index > 28 && image_index < 43)
{
    with (instance_create(x + random_range(-5, obj_tubeleft), y + 46, obj_vomit))
        sprite_index = spr_vomit2;
}

if (global.stylethreshold >= 2 && !instance_exists(angryeffectid) && state == UnknownEnum.Value_0 && character != "V")
{
    with (instance_create(x, y, obj_angrycloud))
    {
        playerid = other.object_index;
        other.angryeffectid = id;
    }
}

if (object_index == obj_player1)
{
    if (global.combofreeze > 0)
        global.combofreeze--;
    
    if (global.combo != global.previouscombo && !is_bossroom())
    {
        if (global.combo > global.highest_combo)
            global.highest_combo = global.combo;
        
        global.previouscombo = global.combo;
        
        if ((global.combo % 5) == 0 && global.combo != 0)
        {
            instance_destroy(obj_combotitle);
            
            with (instance_create(x, y - 80, obj_combotitle))
            {
                title = floor(global.combo / 5);
                event_perform(ev_step, ev_step_normal);
            }
        }
    }
    
    if (state != UnknownEnum.Value_112 && state != UnknownEnum.Value_66 && state != UnknownEnum.Value_150 && state != UnknownEnum.Value_119 && state != UnknownEnum.Value_46 && state != UnknownEnum.Value_98 && state != UnknownEnum.Value_146 && state != UnknownEnum.Value_95 && (state != UnknownEnum.Value_47 && (sprite_index != spr_knightpepstart && sprite_index != spr_knightpepthunder)) && !instance_exists(obj_fadeout))
    {
        if (global.combotime > 0 && global.combofreeze <= 0)
            global.combotime -= 0.15;
    }
    
    if (global.heattime > 0)
        global.heattime -= 0.15;
    
    if (global.combotime <= 0 && global.combo >= 1)
    {
        if (global.combo >= 1)
            scr_soundeffect(68);
        
        global.savedcombo = global.combo;
        global.combotime = 0;
        global.combo = 0;
        
        with (obj_camera)
        {
            if (comboend)
            {
                comboend = false;
                event_perform(ev_alarm, 4);
            }
        }
        
        supercharge = 0;
    }
    
    if (global.heattime <= 0 && global.style > -1 && global.stylelock == 0)
        global.style -= 0.05;
}

if (key_jump && !grounded && (state == UnknownEnum.Value_104 || state == UnknownEnum.Value_121) && (state != (UnknownEnum.Value_37 & walljumpbuffer)) <= 0)
    input_buffer_walljump = 24;

if (key_jump)
    input_buffer_jump = 0;

if (input_buffer_jump < 8)
    input_buffer_jump++;

if (input_buffer_secondjump < 8)
    input_buffer_secondjump++;

if (input_buffer_highjump < 8)
    input_buffer_highjump++;

if (input_attack_buffer > 0)
    input_attack_buffer--;

if (input_finisher_buffer > 0)
    input_finisher_buffer--;

if (input_up_buffer > 0)
    input_up_buffer--;

if (input_down_buffer > 0)
    input_down_buffer--;

if (input_buffer_walljump > 0)
    input_buffer_walljump--;

if (key_slap2)
    input_buffer_slap = 8;
else
    input_buffer_slap = 0;

if (key_particles == 1)
    create_particle(x + random_range(-25, 25), y + random_range(-35, 25), UnknownEnum.Value_10, 0);

if (inv_frames == 0 && hurted == 0 && state != UnknownEnum.Value_16)
    image_alpha = 1;

if (state == UnknownEnum.Value_80 || (state == UnknownEnum.Value_92 && sprite_index == spr_playerN_noisebombspinjump) || state == UnknownEnum.Value_20 || state == UnknownEnum.Value_77 || state == UnknownEnum.Value_47 || state == UnknownEnum.Value_33 || state == UnknownEnum.Value_24 || state == UnknownEnum.Value_38 || state == UnknownEnum.Value_48 || state == UnknownEnum.Value_51 || state == UnknownEnum.Value_62 || state == UnknownEnum.Value_73 || state == UnknownEnum.Value_62 || state == UnknownEnum.Value_121 || state == UnknownEnum.Value_108 || state == UnknownEnum.Value_97)
    attacking = 1;
else
    attacking = 0;

if (state == UnknownEnum.Value_74 || state == UnknownEnum.Value_81 || state == UnknownEnum.Value_83 || state == UnknownEnum.Value_82)
    grabbing = 1;
else
    grabbing = 0;

if (((state == UnknownEnum.Value_198 || state == UnknownEnum.Value_305) && vsp >= 0) || state == UnknownEnum.Value_306 || sprite_index == spr_tumble || state == UnknownEnum.Value_34 || state == UnknownEnum.Value_210 || state == UnknownEnum.Value_209 || state == UnknownEnum.Value_70 || (state == UnknownEnum.Value_71 && (sprite_index == spr_shotgunjump2 || sprite_index == spr_shotgunjump3)) || state == UnknownEnum.Value_97 || state == UnknownEnum.Value_184 || state == UnknownEnum.Value_41 || state == UnknownEnum.Value_80 || state == UnknownEnum.Value_124 || state == UnknownEnum.Value_31 || state == UnknownEnum.Value_121 || (state == UnknownEnum.Value_92 && sprite_index == spr_playerN_noisebombspinjump) || (state == UnknownEnum.Value_107 && thrown == 1) || state == UnknownEnum.Value_37 || state == UnknownEnum.Value_108 || state == UnknownEnum.Value_9 || state == UnknownEnum.Value_10 || state == UnknownEnum.Value_19 || state == UnknownEnum.Value_77 || state == 63 || state == UnknownEnum.Value_97 || state == UnknownEnum.Value_73 || state == UnknownEnum.Value_20 || (state == UnknownEnum.Value_76 && sprite_index == spr_piledriver) || state == UnknownEnum.Value_47 || state == UnknownEnum.Value_48 || state == UnknownEnum.Value_38 || state == UnknownEnum.Value_33 || state == UnknownEnum.Value_24 || state == UnknownEnum.Value_21 || state == UnknownEnum.Value_165 || state == UnknownEnum.Value_153)
    instakillmove = 1;
else
    instakillmove = 0;

if ((state == UnknownEnum.Value_198 || state == UnknownEnum.Value_305) && vsp < 0)
    stunmove = 1;
else
    stunmove = 0;

if (flash == 1 && alarm[0] <= 0)
    alarm[0] = 0.15 * room_speed;

if (state != UnknownEnum.Value_121 && state != UnknownEnum.Value_105)
    autodash = 0;

if ((state != UnknownEnum.Value_92 && state != UnknownEnum.Value_101 && state != UnknownEnum.Value_23) || vsp < 0)
    fallinganimation = 0;

if (state != UnknownEnum.Value_111 && state != UnknownEnum.Value_0 && state != UnknownEnum.Value_105 && state != UnknownEnum.Value_92)
    facehurt = 0;

if (state != UnknownEnum.Value_0 && state != UnknownEnum.Value_105)
    machslideAnim = 0;

if (state != UnknownEnum.Value_0 && state != UnknownEnum.Value_191)
{
    idle = 0;
    dashdust = 0;
}

if (state != UnknownEnum.Value_103 && state != UnknownEnum.Value_26 && state != UnknownEnum.Value_19 && state != UnknownEnum.Value_42 && state != UnknownEnum.Value_0 && state != UnknownEnum.Value_104 && state != UnknownEnum.Value_121 && state != UnknownEnum.Value_122 && state != UnknownEnum.Value_47 && state != UnknownEnum.Value_66 && state != UnknownEnum.Value_38)
    momemtum = 0;

if (state != UnknownEnum.Value_97 && state != UnknownEnum.Value_99)
    a = 0;

if (state != UnknownEnum.Value_62)
    facestompAnim = 0;

if (state != UnknownEnum.Value_108 && state != UnknownEnum.Value_62 && state != UnknownEnum.Value_76 && state != UnknownEnum.Value_111)
    superslam = 0;

if (state != UnknownEnum.Value_104)
    machpunchAnim = 0;

if (state != UnknownEnum.Value_92 && state != UnknownEnum.Value_57)
    ladderbuffer = 0;

if (state != UnknownEnum.Value_92)
    stompAnim = 0;

if ((state == UnknownEnum.Value_121 || state == UnknownEnum.Value_104) && macheffect == 0)
{
    macheffect = 1;
    toomuchalarm1 = 6;
    
    with (create_mach3effect(x, y, sprite_index, image_index - 1))
    {
        playerid = other.object_index;
        image_xscale = other.xscale;
    }
}

if (!(state == UnknownEnum.Value_121) && !(state == UnknownEnum.Value_104))
    macheffect = 0;

if (toomuchalarm1 > 0)
{
    toomuchalarm1 -= 1;
    
    if (toomuchalarm1 <= 0 && (state == UnknownEnum.Value_121 || state == UnknownEnum.Value_104))
    {
        with (create_mach3effect(x, y, sprite_index, image_index - 1))
        {
            playerid = other.object_index;
            image_xscale = other.xscale;
        }
        
        toomuchalarm1 = 6;
    }
}

if ((y > (room_height + 300) || y < -800) && !place_meeting(x, y, obj_verticalhallway) && !verticalhallway && state != UnknownEnum.Value_89 && state != UnknownEnum.Value_186)
{
    visible = true;
    
    if (room != rm_levelselect)
    {
        with (obj_camera)
        {
            shake_mag = 3;
            shake_mag_acc = 3 / room_speed;
        }
        
        if (state == UnknownEnum.Value_17)
        {
            state = UnknownEnum.Value_16;
            sprite_index = spr_ghostidle;
        }
        
        state = UnknownEnum.Value_146;
        visible = false;
        hsp = 0;
        vsp = 0;
        scr_soundeffect(55);
        
        with (instance_create(x, y + 540, obj_technicaldifficulty))
        {
            bg_index = !other.ispeppino;
            sprite = spr_technicaldifficulty;
            
            if (other.isgustavo)
                sprite = spr_technicaldifficultyG;
            
            if (!other.ispeppino)
                sprite = spr_technicaldifficultyN;
            
            player_index = irandom(sprite_get_number(sprite) - 1);
            playerid = other.id;
        }
        
        vsp = 10;
    }
    else
    {
        x = roomstartx;
        y = roomstarty;
    }
}

if (character == "S")
{
    if (state == UnknownEnum.Value_101 || state == UnknownEnum.Value_100)
        state = UnknownEnum.Value_0;
}

if (character != "M")
{
    if (!place_meeting(x, y, obj_solid))
    {
        if (state != UnknownEnum.Value_16 && state != UnknownEnum.Value_35 && state != UnknownEnum.Value_34 && !(state == UnknownEnum.Value_106 && sprite_index == spr_tumbleend) && state != UnknownEnum.Value_116 && state != UnknownEnum.Value_115 && sprite_index != spr_player_breakdancesuper && sprite_index != spr_player_barrelslipnslide && sprite_index != spr_player_barrelroll && sprite_index != spr_bombpepintro && sprite_index != spr_knightpepthunder && state != UnknownEnum.Value_5 && state != UnknownEnum.Value_59 && state != UnknownEnum.Value_100 && state != UnknownEnum.Value_67 && state != UnknownEnum.Value_68 && state != UnknownEnum.Value_33 && state != UnknownEnum.Value_72 && sprite_index != spr_player_crouchshoot && state != UnknownEnum.Value_99 && state != UnknownEnum.Value_102 && state != UnknownEnum.Value_61 && state != UnknownEnum.Value_65 && state != UnknownEnum.Value_107 && state != UnknownEnum.Value_101 && state != UnknownEnum.Value_30 && state != UnknownEnum.Value_29 && sprite_index != spr_chainsawcrouch)
            mask_index = spr_player_mask;
        else
            mask_index = spr_crouchmask;
    }
    else if (place_meeting(x, y, obj_solid))
    {
        mask_index = spr_crouchmask;
    }
}
else
{
    mask_index = spr_pepperman_mask;
}

if (character == "S" && state == UnknownEnum.Value_51)
    mask_index = spr_player_mask;
else if (character == "S")
    mask_index = spr_crouchmask;

if (state == UnknownEnum.Value_46 || sprite_index == spr_knightpepstart || sprite_index == spr_knightpepthunder || state == UnknownEnum.Value_90 || state == UnknownEnum.Value_61 || state == UnknownEnum.Value_112 || state == UnknownEnum.Value_7 || state == UnknownEnum.Value_98 || state == UnknownEnum.Value_95 || state == UnknownEnum.Value_89 || state == UnknownEnum.Value_186 || state == UnknownEnum.Value_152 || state == UnknownEnum.Value_146)
    cutscene = 1;
else
    cutscene = 0;

if (((place_meeting(x, y, obj_door) && !place_meeting(x, y, obj_doorblocked)) || place_meeting(x, y, obj_taxi) || place_meeting(x, y, obj_dialognpc) || place_meeting(x, y, obj_dresser) || place_meeting(x, y, obj_snick) || place_meeting(x, y, obj_keydoor) || place_meeting(x, y, obj_filedoor) || place_meeting(x, y, obj_optiondoor) || (place_meeting(x, y, obj_exitgate) && global.panic == 1)) && !instance_exists(obj_uparrow) && scr_solid(x, y + 1) && state == UnknownEnum.Value_0 && obj_player1.spotlight == 1)
{
    with (instance_create(x, y, obj_uparrow))
        playerid = other.object_index;
}

if (movespeed >= 16 && !instance_exists(speedlineseffectid))
{
    with (instance_create(x, y, obj_speedlines))
    {
        playerid = other.object_index;
        other.speedlineseffectid = id;
    }
}

scr_collision_destructibles();

if (state != UnknownEnum.Value_17 && state != UnknownEnum.Value_186 && state != UnknownEnum.Value_207 && state != UnknownEnum.Value_18 && state != UnknownEnum.Value_150 && state != UnknownEnum.Value_4 && state != UnknownEnum.Value_112 && state != UnknownEnum.Value_97 && state != UnknownEnum.Value_7 && state != UnknownEnum.Value_95 && state != UnknownEnum.Value_118 && state != UnknownEnum.Value_90 && state != UnknownEnum.Value_98 && state != UnknownEnum.Value_39 && state != UnknownEnum.Value_64 && state != UnknownEnum.Value_46 && state != UnknownEnum.Value_89)
    scr_collide_player();

if (state == UnknownEnum.Value_150 || state == UnknownEnum.Value_186 || state == UnknownEnum.Value_207)
{
    x += hsp;
    y += vsp;
}

if (state == UnknownEnum.Value_118)
    scr_collide_player();
