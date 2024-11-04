event_inherited();
ds_map_set(player_hurtstates, 42, 30);
ds_map_set(player_hurtstates, 41, 50);
ds_map_set(player_hurtstates, 104, 20);
ds_map_set(player_hurtstates, 121, 30);
ds_map_set(player_hurtstates, 47, 60);
ds_map_set(boss_hurtstates, 240, 60);
ds_map_set(boss_hurtstates, 241, 50);
ds_map_set(boss_hurtstates, 242, 50);
ds_map_set(boss_hurtstates, 244, 50);
ds_map_set(boss_hurtstates, 245, 50);
hitlist = ds_list_create();
image_speed = 0.35;
max_hp = 3600;
hp = max_hp;
shot = 0;
phase = 0;
has_attacked = 0;
floatdir = 1;
attackbuffermax = 180;
attackbuffer = attackbuffermax;
phase1attacks = [222, 224, 223, 225];
lostattacks = array_length(phase1attacks);
parrycount = 0;
transitionstate = 0;
bombtimer = 0;
hasbomb = 0;
bombgrabID = -4;
knightbuffer = 0;
spawnpool = [391, 358];
hitplayer = 0;

function player_hurt(argument0, argument1)
{
    var _prevstate;
    
    _prevstate = state;
    
    if (phase < 2)
    {
        SUPER_player_hurt(argument0, argument1);
    }
    else if ((argument1.state != UnknownEnum.Value_84 || argument1.parry_inst == -4) && argument1.state != UnknownEnum.Value_147 && ds_list_find_index(hitlist, argument1) == -1)
    {
        ds_list_add(hitlist, argument1);
        SUPER_player_hurt(argument0, argument1);
        state = _prevstate;
        hitplayer = 1;
    }
}

function boss_hurt(argument0, argument1)
{
    var _removehp;
    
    if (phase == 0)
    {
        SUPER_boss_hurt(argument0, argument1);
    }
    else
    {
        _removehp = 1;
        
        with (argument1)
        {
            if (state != UnknownEnum.Value_43 && state != UnknownEnum.Value_47)
            {
                scr_pummel();
            }
            else if (state == UnknownEnum.Value_47 && vsp > 0 && y < (other.y - 30))
            {
                sprite_index = spr_knightpep_doublejump;
                image_index = 0;
                vsp = -11;
                movespeed = 6;
            }
            else if (state != UnknownEnum.Value_43 && state != UnknownEnum.Value_147)
            {
                _removehp = 0;
            }
            
            if (state == UnknownEnum.Value_43)
                movespeed = 4;
        }
        
        if (_removehp)
        {
            hp -= argument0;
            scr_soundeffect(54);
        }
    }
}

function boss_hurt_noplayer(argument0)
{
    if (inv_timer <= 0)
    {
        hp -= argument0;
        inv_timer = 10;
    }
}
