var _dvc, count, i, check, check2, button, buttons;

_dvc = -1;
count = gamepad_get_device_count();

for (i = 0; i < count; i++)
{
    if (gamepad_is_connected(i))
        _dvc = i;
}

gamepad_set_axis_deadzone(_dvc, global.input_controller_deadzone);
key_up2 = get_input_keyboard([38], 1) || get_input_controller(_dvc, [32781, -3], 1);
key_right2 = get_input_keyboard([39], 1) || get_input_controller(_dvc, [32784, -1], 1);
key_left2 = -(get_input_keyboard([37], 1) || get_input_controller(_dvc, [32783, -2], 1));
key_down2 = get_input_keyboard([40], 1) || get_input_controller(_dvc, [32782, -4], 1);
key_jump = get_input_keyboard([90], 1) || get_input_controller(_dvc, [32769], 1);
key_taunt2 = get_input_keyboard([67], 1) || get_input_controller(_dvc, [32772], 1);

if (get_input_controller(_dvc, [-1], 1))
    stickpressed_h = 1;
else if (get_input_controller(_dvc, [-1], -1))
    stickpressed_h = 0;

if (get_input_controller(_dvc, [-2], 1))
    stickpressed_h = -1;
else if (get_input_controller(_dvc, [-2], -1))
    stickpressed_h = 0;

if (get_input_controller(_dvc, [-3], 1))
    stickpressed_v = 1;
else if (get_input_controller(_dvc, [-3], -1))
    stickpressed_v = 0;

if (get_input_controller(_dvc, [-4], 1))
    stickpressed_v = -1;
else if (get_input_controller(_dvc, [-4], -1))
    stickpressed_v = 0;

check = key_select;

if (sprite == cur.spr_superjump || sprite == cur.spr_superjumpprep || sprite == cur.spr_superjumpland)
    image += 0.5;
else if (sprite != cur.spr_taunt)
    image += 0.35;

if (image >= sprite_get_number(sprite))
    image -= sprite_get_number(sprite);

if (sprite == cur.spr_taunt)
{
    tauntimg += 0.5;
    
    if (tauntimg >= 10)
    {
        tauntimg = 0;
        image = irandom(sprite_get_number(sprite) - 1);
    }
}

if (floor(image) >= (sprite_get_number(sprite) - 1))
{
    switch (sprite)
    {
        case cur.spr_jump:
            image = 0;
            sprite = cur.spr_fall;
            break;
        
        case cur.spr_land:
            image = 0;
            sprite = cur.spr_jump;
            vsp = -11;
            break;
        
        case cur.spr_bodyslamstart:
            image = 0;
            sprite = cur.spr_bodyslamfall;
            break;
        
        case cur.spr_bodyslamland:
            image = 0;
            sprite = cur.spr_bodyslamstart;
            grounded = 0;
            yy = -200;
            vsp = -5;
            break;
        
        case cur.spr_superjumpprep:
            image = 0;
            sprite = cur.spr_superjump;
            vsp = -12;
            break;
        
        case cur.spr_lookdoor:
            image = 0;
            sprite = cur.spr_walkfront;
            break;
        
        case cur.spr_walkfront:
            image = 0;
            sprite = cur.spr_lookdoor;
            break;
    }
}

if (sprite == cur.spr_superjumpland && floor(image) >= 6)
{
    image = 0;
    sprite = cur.spr_machfreefall;
}
else if (sprite == cur.spr_superjump)
{
    vsp = -12;
    
    if (yy < -200)
    {
        vsp = 0;
        sprite = cur.spr_superjumpland;
        image = 0;
    }
}
else if (sprite == cur.spr_superjumpland)
{
    vsp = 0;
}
else if (sprite == cur.spr_fall && grounded)
{
    sprite = cur.spr_land;
    image = 0;
}
else if (sprite == cur.spr_bodyslamfall || sprite == cur.spr_bodyslamstart)
{
    if (vsp >= 2)
        vsp += 0.5;
    
    if (grounded)
    {
        sprite = cur.spr_bodyslamland;
        image = 0;
    }
}
else if (sprite == cur.spr_machfreefall && grounded)
{
    sprite = cur.spr_superjumpprep;
    image = 0;
}

yy += ((vsp > 0) ? floor(vsp) : ceil(vsp));

if (yy > 0)
{
    yy = 0;
    vsp = 0;
}

if (vsp < 20)
    vsp += 0.5;

if (yy > -1)
    grounded = 1;
else
    grounded = 0;

if (selecting == -1)
{
    if (((key_up2 && key_down2 != key_up2) || keyboard_check_pressed(vk_up)) && key_select > -1)
    {
        key_select -= 1;
        scr_soundeffect(69);
    }
    
    if (((key_down2 && key_up2 != key_down2) || keyboard_check_pressed(vk_down)) && key_select < 10)
    {
        key_select += 1;
        scr_soundeffect(69);
    }
}

check2 = player;

if (selecting == -1)
{
    if (player == 0 && ((key_right2 && key_right2 != -key_left2) || keyboard_check_pressed(vk_right)))
        player += 1;
    
    if (player == 1 && ((-key_left2 && -key_left2 != key_right2) || keyboard_check_pressed(vk_left)))
        player -= 1;
}

if (check != key_select || check2 != player)
{
    cur = player ? noise : pep;
    sprite = cur.spr_idle;
    image = 0;
    tauntimg = 0;
    yy = 0;
    vsp = 0;
    grounded = 1;
    
    switch (key_select)
    {
        case 0:
            sprite = cur.spr_lookdoor;
            break;
        
        case 1:
            sprite = cur.spr_crouch;
            break;
        
        case 2:
        case 3:
            sprite = cur.spr_move;
            break;
        
        case 4:
            sprite = cur.spr_jump;
            vsp = -11;
            break;
        
        case 5:
            sprite = cur.spr_suplexdash;
            break;
        
        case 6:
            sprite = cur.spr_mach;
            break;
        
        case 7:
            sprite = cur.spr_taunt;
            image = irandom(sprite_get_number(sprite) - 1);
            break;
        
        case 8:
            sprite = cur.spr_superjumpprep;
            break;
        
        case 9:
            sprite = cur.spr_bodyslamstart;
            yy = -200;
            vsp = -5;
            break;
        
        case 10:
            sprite = cur.spr_Timesup;
            break;
    }
}

if ((key_jump || keyboard_check_pressed(vk_enter)) && selecting == -1 && key_select == -1)
{
    scr_soundeffect(48);
    ini_open("saveData.ini");
    
    if (controller)
    {
        ini_write_input("ControllerButton", "up", global.key_upC);
        ini_write_input("ControllerButton", "right", global.key_rightC);
        ini_write_input("ControllerButton", "left", global.key_leftC);
        ini_write_input("ControllerButton", "down", global.key_downC);
        ini_write_input("ControllerButton", "jump", global.key_jumpC);
        ini_write_input("ControllerButton", "slap", global.key_slapC);
        ini_write_input("ControllerButton", "attack", global.key_attackC);
        ini_write_input("ControllerButton", "taunt", global.key_tauntC);
        ini_write_input("ControllerButton", "start", global.key_startC);
        ini_write_input("ControllerButton", "superjump", global.key_superjumpC);
        ini_write_input("ControllerButton", "groundpound", global.key_groundpoundC);
        ini_write_input("ControllerButton2", "up", global.key_upCN);
        ini_write_input("ControllerButton2", "right", global.key_rightCN);
        ini_write_input("ControllerButton2", "left", global.key_leftCN);
        ini_write_input("ControllerButton2", "down", global.key_downCN);
        ini_write_input("ControllerButton2", "jump", global.key_jumpCN);
        ini_write_input("ControllerButton2", "slap", global.key_slapCN);
        ini_write_input("ControllerButton2", "taunt", global.key_tauntCN);
        ini_write_input("ControllerButton2", "start", global.key_startCN);
        ini_write_input("ControllerButton2", "superjump", global.key_superjumpCN);
        ini_write_input("ControllerButton2", "groundpound", global.key_groundpoundCN);
    }
    else
    {
        ini_write_input("ControlsKeys", "up", global.key_up);
        ini_write_input("ControlsKeys", "right", global.key_right);
        ini_write_input("ControlsKeys", "left", global.key_left);
        ini_write_input("ControlsKeys", "down", global.key_down);
        ini_write_input("ControlsKeys", "jump", global.key_jump);
        ini_write_input("ControlsKeys", "slap", global.key_slap);
        ini_write_input("ControlsKeys", "attack", global.key_attack);
        ini_write_input("ControlsKeys", "taunt", global.key_taunt);
        ini_write_input("ControlsKeys", "start", global.key_start);
        ini_write_input("ControlsKeys", "superjump", global.key_superjump);
        ini_write_input("ControlsKeys", "groundpound", global.key_groundpound);
        ini_write_input("ControlsKeys2", "up", global.key_upN);
        ini_write_input("ControlsKeys2", "right", global.key_rightN);
        ini_write_input("ControlsKeys2", "left", global.key_leftN);
        ini_write_input("ControlsKeys2", "down", global.key_downN);
        ini_write_input("ControlsKeys2", "jump", global.key_jumpN);
        ini_write_input("ControlsKeys2", "slap", global.key_slapN);
        ini_write_input("ControlsKeys2", "taunt", global.key_tauntN);
        ini_write_input("ControlsKeys2", "start", global.key_startN);
        ini_write_input("ControlsKeys2", "superjump", global.key_superjumpN);
        ini_write_input("ControlsKeys2", "groundpound", global.key_groundpoundN);
    }
    
    ini_close();
    
    if (instance_exists(obj_option))
        obj_option.visible = true;
    
    instance_destroy();
}

scr_getinput();

if (selecting != -1 && !controller && keyboard_check_pressed(vk_anykey))
{
    array_push(variable_global_get(player ? (keys[selecting] + "N") : keys[selecting]), keyboard_key);
    selecting = -1;
}

if (selecting != -1 && controller && _dvc >= 0)
{
    button = undefined;
    buttons = [32769, 32770, 32771, 32772, 32778, 32777, 32779, 32780, 32781, 32784, 32783, 32782, 32773, 32774, 32775, 32776];
    
    for (i = 0; i < array_length(buttons); i++)
    {
        if (gamepad_button_check(_dvc, buttons[i]))
        {
            button = buttons[i];
            break;
        }
    }
    
    if (button == undefined)
    {
        if (get_input_controller(_dvc, [-1], 0))
            button = -1;
        else if (get_input_controller(_dvc, [-2], 0))
            button = -2;
        else if (get_input_controller(_dvc, [-3], 0))
            button = -3;
        else if (get_input_controller(_dvc, [-4], 0))
            button = -4;
    }
    
    if (button != undefined)
    {
        if (!buffer)
        {
            array_push(variable_global_get(player ? (keys[selecting] + "CN") : (keys[selecting] + "C")), button);
            selecting = -1;
        }
    }
    else
    {
        buffer = 0;
    }
}

if (key_select != -1 && (key_jump || keyboard_check_pressed(vk_enter)) && selecting == -1 && (!controller || _dvc >= 0))
{
    selecting = key_select;
    
    if (controller)
        buffer = 1;
}

if (key_select != -1 && (key_taunt2 || keyboard_check_pressed(vk_backspace)) && selecting == -1 && !controller)
    variable_global_set(player ? (keys[key_select] + "N") : keys[key_select], []);

if (key_select != -1 && (key_taunt2 || keyboard_check_pressed(vk_backspace)) && selecting == -1 && controller)
    variable_global_set(player ? (keys[key_select] + "CN") : (keys[key_select] + "C"), []);
