var playerid, _state, idlespr, spr, tauntstate, taunting, i, data, prevdata, change_pos, spd;

playerid = (obj_player1.spotlight == 1) ? 245 : 244;

if (global.combotime > 0 && global.combo > 0)
    visualcombo = global.combo;

combo_posX = Wave(-5, 5, 2, 20);

if (global.combotime > 0 && global.combo != 0)
{
    switch (combo_state)
    {
        case 0:
            combo_posY += combo_vsp;
            combo_vsp += 0.5;
            
            if (combo_posY > 20)
                combo_state++;
            
            break;
        
        case 1:
            combo_posY = lerp(combo_posY, 0, 0.05);
            
            if (combo_posY < 1)
            {
                combo_posY = 0;
                combo_vsp = 0;
                combo_state++;
            }
            
            break;
        
        case 2:
            if (global.combotime < 30)
            {
                combo_posY += combo_vsp;
                
                if (combo_vsp < 20)
                    combo_vsp += 0.5;
                
                if (combo_posY > 0)
                {
                    combo_posY = 0;
                    combo_vsp = -1;
                    
                    if (global.combotime < 15)
                        combo_vsp = -2;
                }
            }
            else
            {
                combo_posY = Approach(combo_posY, 0, 10);
            }
            
            break;
    }
}
else
{
    combo_posY = Approach(combo_posY, -500, 5);
    combo_vsp = 0;
    combo_state = 0;
}

combofill_index += 0.35;

if (combofill_index > (sprite_get_number(spr_tv_combobubblefill) - 1))
    combofill_index = frac(combofill_index);

if (room == Realtitlescreen || room == rank_room || room == rm_levelselect || room == timesuproom || room == boss_room1 || room == characterselect || room == rm_mainmenu)
{
    visible = false;
    sprite_index = spr_tv_off;
}
else
{
    visible = true;
}

if ((instance_exists(obj_shell) && !obj_shell.showhud) || !global.option_hud)
    visible = false;

image_speed = 0.35;

if (targetgolf != -4 && !instance_exists(targetgolf))
    targetgolf = -4;

if (targetgolf != -4 && !view_visible[1])
{
    view_visible[1] = true;
    view_enabled = true;
}

//if (bubblespr != -4 && bubblespr != 1486)
if (bubblespr != -4 && bubblespr != spr_tv_bubbleclosed)
{
    if (prompt != -4)
        prompt_buffer = 2;
    
    bubbleindex += image_speed;
    
    if (floor(bubbleindex) == sprite_get_number(bubblespr))
    {
        bubbleindex = 0;
        
        switch (bubblespr)
        {
            case spr_tv_bubbleopen://594:
                bubblespr = spr_tv_bubble;
                break;
            
            case spr_tv_bubbleclose://575:
                bubblespr = spr_tv_bubbleclosed;
                
                if (prompt == -4 || prompt == "")
                    bubblespr = -4;
                
                break;
        }
    }
}

switch (tv_state)
{
    case UnknownEnum.Value_0:
        if (floor(image_index) == (image_number - 1) && sprite_index == spr_tv_off)
            sprite_index = spr_tv_open;
        
        if (floor(image_index) == (image_number - 1) && sprite_index == spr_tv_open)
        {
            tv_state = UnknownEnum.Value_1;
            sprite_index = spr_tv_idle;
        }
        
        break;
    
    case UnknownEnum.Value_1:
        _state = obj_player1.state;
        expression_priority = 5;
        expression_spr = -1;
        expression_time = 0;
        idlespr = spr_tv_idle;
        
        if (global.panic)
            idlespr = spr_tv_exprpanic;
        else if (global.combo >= 3 && global.combo < 50 && !obj_player.isgustavo)
            idlespr = spr_tv_exprcombo;
        else if (global.combo >= 50 && !obj_player.isgustavo)
            idlespr = spr_tv_exprheat;
        
        if (instance_exists(obj_ghostcollectibles))
            idlespr = spr_tv_exprsecret;
        
        if (!obj_player1.ispeppino)
        {
            spr = sprite_get_name(idlespr);
            spr = asset_get_index(concat(spr, "N"));
            
            if (spr > -1)
                idlespr = spr;
        }
        
        switch (sprite_index)
        {
            case spr_tv_idle:
            case spr_tv_idleN:
                if (idleanim > 0)
                    idleanim--;
                
                if (sprite_index != idlespr)
                    sprite_index = idlespr;
                
                if (idleanim <= 0 && floor(image_index) == (image_number - 1))
                {
                    sprite_index = choose(spr_tv_idleanim1, spr_tv_idleanim2);
                    
                    if (!obj_player1.ispeppino)
                    {
                        if (sprite_index == spr_tv_idleanim1)
                            sprite_index = spr_tv_idleanim1N;
                        
                        if (sprite_index == spr_tv_idleanim2)
                            sprite_index = spr_tv_idleanim2N;
                    }
                    
                    image_index = 0;
                }
                
                break;
            
            case spr_tv_idleanim1:
            case spr_tv_idleanim2:
            case spr_tv_idleanim1N:
            case spr_tv_idleanim2N:
                if (floor(image_index) == (image_number - 1))
                {
                    sprite_index = idlespr;
                    idleanim = 240 + (60 * irandom_range(-1, 2));
                }
                
                //if (idlespr != 2727 && idlespr != 959)
				if (idlespr != spr_tv_idle && idlespr != spr_tv_idleN)
                    sprite_index = idlespr;
                
                break;
            
            default:
                sprite_index = idlespr;
        }
        
        if (_state == UnknownEnum.Value_121)
        {
            if (obj_player1.mach4mode)
				tv_add_expression(spr_tv_exprmach4, 150, 100);
				//tv_add_expression(101, 150, 100);
            else
				tv_add_expression(spr_tv_exprmach3, 150, 100);
                //tv_add_expression(1293, 150, 100);
        }
        
        break;
    
    case UnknownEnum.Value_2:
        whitenoise_index += 0.35;
        
        if (whitenoise_index < sprite_get_number(spr_tv_whitenoise))
            exit;
        
        tv_state = whitenoise_state;
        whitenoise_index = 0;
        break;
    
    case UnknownEnum.Value_3:
        sprite_index = expression_spr;
        _state = obj_player1.state;
        tauntstate = obj_player1.tauntstoredstate;
        taunting = _state == UnknownEnum.Value_84 || _state == UnknownEnum.Value_61;
        
        switch (expression_spr)
        {
            case spr_tv_exprmach3://1293:
            case spr_tv_exprmach3N://5:
                if ((!taunting && _state == UnknownEnum.Value_121) || (taunting && tauntstate == UnknownEnum.Value_121))
                {
                    if (obj_player1.mach4mode)
						tv_add_expression(spr_tv_exprmach4, 150, 100);
                        //tv_add_expression(101, 150, 100);
                }
                
                if ((!taunting && _state != UnknownEnum.Value_121 && _state != UnknownEnum.Value_37) || (taunting && tauntstate != UnknownEnum.Value_121 && tauntstate != UnknownEnum.Value_37))
                    tv_add_whitenoise(UnknownEnum.Value_1);
                
                break;
            
            case spr_tv_exprmach4://101:
            case spr_tv_exprmach4N://22:
                if ((!taunting && _state != UnknownEnum.Value_121 && _state != UnknownEnum.Value_37) || (taunting && tauntstate != UnknownEnum.Value_121 && tauntstate != UnknownEnum.Value_37))
                    tv_add_whitenoise(UnknownEnum.Value_1);
                
                break;
            
            default:
                expression_time--;
                
                if (expression_time == 0)
                    tv_add_whitenoise(UnknownEnum.Value_1);
                
                break;
        }
        
        break;
    
    case UnknownEnum.Value_8:
        if (sprite_index == spr_tv_open && floor(image_index) == (image_number - 1))
            sprite_index = tvsprite;
        
        if (sprite_index == tvsprite)
        {
            if (prompt_buffer > 0)
            {
                prompt_buffer--;
            }
            else
            {
                promptx = promptxstart;
                ds_list_delete(tvprompts_list, 0);
                state = UnknownEnum.Value_0;
            }
        }
        
        break;
}

for (i = 0; i < ds_list_size(tv_queue); i++)
{
    data = ds_list_find_value(tv_queue, i);
    prevdata = ds_list_find_value(tv_queue, i - 1);
    
    if (is_struct(data) && sprite_exists(data.sprite) && expression_spr != data.sprite && expression_priority <= data.priority)
    {
        expression_spr = data.sprite;
        expression_time = data.time;
        expression_priority = data.priority;
        ds_list_delete(tv_queue, i);
        tv_add_whitenoise(UnknownEnum.Value_3);
    }
}

change_pos = 0;

if (obj_player.x > (room_width - 224) && obj_player.y < 187)
    change_pos = 1;

if (bubblespr != -4 && obj_player.x > 316 && obj_player.y < 101)
    change_pos = 1;

spd = 15;

if (change_pos)
    hud_posY = Approach(hud_posY, -300, spd);
else
    hud_posY = Approach(hud_posY, 0, spd);
