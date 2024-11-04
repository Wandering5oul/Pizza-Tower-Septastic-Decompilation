key_select = 0;
selecting = -1;
player = 0;
depth = -100;
stickpressed_h = 0;
stickpressed_v = 0;
keys = ["key_up", "key_down", "key_right", "key_left", "key_jump", "key_slap", "key_attack", "key_taunt", "key_superjump", "key_groundpound", "key_start"];
pep = 
{
    spr_idle: spr_player_idle,
    spr_move: spr_player_move,
    spr_jump: spr_player_jump,
    spr_fall: spr_player_fall,
    spr_land: spr_player_land,
    spr_crouch: spr_player_crouch,
    spr_lookdoor: spr_player_lookdoor,
    spr_walkfront: spr_player_walkfront,
    spr_superjumpprep: spr_player_superjumpprep,
    spr_superjump: spr_player_superjump,
    spr_superjumpland: spr_player_superjumpland,
    spr_machfreefall: spr_player_machfreefall,
    spr_bodyslamstart: spr_player_bodyslamstart,
    spr_bodyslamfall: spr_player_bodyslamfall,
    spr_bodyslamland: spr_player_bodyslamland,
    spr_mach: spr_player_mach,
    spr_suplexdash: spr_player_suplexdash,
    spr_taunt: spr_player_taunt,
    spr_Timesup: spr_player_timesup,
    spr_palette: spr_peppalette
};
noise = 
{
    spr_idle: spr_playerN_idle,
    spr_move: spr_playerN_move,
    spr_jump: spr_playerN_jump,
    spr_fall: spr_playerN_fall,
    spr_land: spr_playerN_land,
    spr_crouch: spr_playerN_crouch,
    spr_lookdoor: spr_playerN_lookdoor,
    spr_walkfront: spr_playerN_walkfront,
    spr_superjumpprep: spr_playerN_Sjumpstart,
    spr_superjump: spr_playerN_Sjump,
    spr_superjumpland: spr_playerN_Sjumpland,
    spr_machfreefall: spr_playerN_rockethitwall,
    spr_bodyslamstart: spr_playerN_bodyslamstart,
    spr_bodyslamfall: spr_playerN_bodyslam,
    spr_bodyslamland: spr_playerN_bodyslamland,
    spr_mach: spr_playerN_mach,
    spr_suplexdash: spr_playerN_suplexgrab,
    spr_taunt: spr_playerN_taunt,
    spr_Timesup: spr_playerN_timesup,
    spr_palette: spr_noisepalette
};
cur = pep;
sprite = spr_player_lookdoor;
image = 0;
tauntimg = 0;
yy = 0;
vsp = 0;
grounded = true;
controller = false;
buffer = 0;
