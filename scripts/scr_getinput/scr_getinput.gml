function scr_getinput()
{
    var _dvc, count, i, in, dz, b, axis_value, inverted_axis;
    
    if (instance_exists(obj_shell) && obj_shell.isOpen)
        exit;
    
    _dvc = -1;
    count = gamepad_get_device_count();
    
    for (i = 0; i < count; i++)
    {
        if (gamepad_is_connected(i))
        {
            _dvc = i;
            break;
        }
    }
    
    gamepad_set_axis_deadzone(_dvc, global.input_controller_deadzone);
    key_up = get_input_keyboard(global.key_up, 0) || get_input_controller(_dvc, global.key_upC, 0);
    key_up2 = get_input_keyboard(global.key_up, 1) || get_input_controller(_dvc, global.key_upC, 1);
    key_right = get_input_keyboard(global.key_right, 0) || get_input_controller(_dvc, global.key_rightC, 0);
    key_right2 = get_input_keyboard(global.key_right, 1) || get_input_controller(_dvc, global.key_rightC, 1);
    key_left = -(get_input_keyboard(global.key_left, 0) || get_input_controller(_dvc, global.key_leftC, 0));
    key_left2 = -(get_input_keyboard(global.key_left, 1) || get_input_controller(_dvc, global.key_leftC, 1));
    key_down = get_input_keyboard(global.key_down, 0) || get_input_controller(_dvc, global.key_downC, 0);
    key_down2 = get_input_keyboard(global.key_down, 1) || get_input_controller(_dvc, global.key_downC, 1);
    key_jump = get_input_keyboard(global.key_jump, 1) || get_input_controller(_dvc, global.key_jumpC, 1);
    key_jump2 = get_input_keyboard(global.key_jump, 0) || get_input_controller(_dvc, global.key_jumpC, 0);
    key_slap = get_input_keyboard(global.key_slap, 0) || get_input_controller(_dvc, global.key_slapC, 0);
    key_slap2 = get_input_keyboard(global.key_slap, 1) || get_input_controller(_dvc, global.key_slapC, 1);
    key_taunt = get_input_keyboard(global.key_taunt, 0) || get_input_controller(_dvc, global.key_tauntC, 0);
    key_taunt2 = get_input_keyboard(global.key_taunt, 1) || get_input_controller(_dvc, global.key_tauntC, 1);
    key_attack = get_input_keyboard(global.key_attack, 0) || get_input_controller(_dvc, global.key_attackC, 0);
    key_attack2 = get_input_keyboard(global.key_attack, 1) || get_input_controller(_dvc, global.key_attackC, 1);
    key_shoot = 0;
    key_shoot2 = 0;
    key_start = get_input_keyboard(global.key_start, 1) || get_input_controller(_dvc, global.key_startC, 1);
    key_escape = keyboard_check_pressed(vk_escape) || gamepad_button_check(_dvc, gp_select);
    key_chainsaw = 0;
    key_chainsaw2 = 0;
    key_superjump = get_input_keyboard(global.key_superjump, 0) || get_input_controller(_dvc, global.key_superjumpC, 0);
    key_groundpound = get_input_keyboard(global.key_groundpound, 1) || get_input_controller(_dvc, global.key_groundpoundC, 1);
    key_groundpound2 = get_input_keyboard(global.key_groundpound, 0) || get_input_controller(_dvc, global.key_groundpoundC, 0);
    
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
    
    if (object_index == obj_player1)
    {
        if (state == UnknownEnum.Value_99 || state == UnknownEnum.Value_100)
        {
            if (state == UnknownEnum.Value_99)
            {
                in = global.key_upC;
                dz = global.gamepad_deadzone_superjump;
            }
            else
            {
                in = global.key_downC;
                dz = global.gamepad_deadzone_crouch;
            }
            
            for (i = 0; i < array_length(in); i++)
            {
                b = in[i];
                
                if (b == -1 || b == -2 || b == -3 || b == -4)
                {
                    axis_value = 0;
                    
                    switch (b)
                    {
                        case -1:
                        case -2:
                            inverted_axis = gamepad_axis_value(_dvc, gp_axislv) + gamepad_axis_value(_dvc, gp_axisrv);
                            axis_value = gamepad_axis_value(_dvc, gp_axislh) + gamepad_axis_value(_dvc, gp_axisrh);
                            break;
                        
                        case -3:
                        case -4:
                            inverted_axis = gamepad_axis_value(_dvc, gp_axislh) + gamepad_axis_value(_dvc, gp_axisrh);
                            axis_value = gamepad_axis_value(_dvc, gp_axislv) + gamepad_axis_value(_dvc, gp_axisrv);
                            break;
                    }
                    
                    if (other.state == UnknownEnum.Value_99)
                    {
                        if (axis_value <= (-0.8 + dz) && (axis_value != 0 || inverted_axis != 0))
                            other.key_up = true;
                    }
                    else if (axis_value >= (0.8 - dz) && (axis_value != 0 || inverted_axis != 0))
                    {
                        other.key_down = true;
                    }
                }
            }
        }
    }
}

function scr_check_superjump()
{
    var sj;
    
    sj = global.gamepad_superjump;
    
    if (!global.controllering)
        sj = global.keyboard_superjump;
    
    return (sj && key_up) || key_superjump;
}

function scr_check_groundpound()
{
    var gp;
    
    gp = global.gamepad_groundpound;
    
    if (!global.controllering)
        gp = global.keyboard_groundpound;
    
    return (gp && key_down2) || key_groundpound;
}

function scr_mach_check_dive()
{
    if (grounded && vsp > 0)
        return key_down;
    
    return scr_check_dive();
}

function scr_check_dive()
{
    if (!ispeppino)
        return scr_check_groundpound2();
    
    return key_down;
}

function scr_check_groundpound2()
{
    var gp;
    
    gp = global.gamepad_groundpound;
    
    if (!global.controllering)
        gp = global.keyboard_groundpound;
    
    return (gp && key_down) || key_groundpound2;
}

function get_input_keyboard(argument0, argument1)
{
    var oldcont, i;
    
    oldcont = global.controllering;
    global.controllering = 0;
    
    for (i = 0; i < array_length(argument0); i++)
    {
        if (argument1 ? keyboard_check_pressed(argument0[i]) : (-argument1 ? keyboard_check_released(argument0[i]) : keyboard_check(argument0[i])))
            return true;
    }
    
    global.controllering = oldcont;
    return false;
}

function get_input_controller(argument0, argument1, argument2)
{
    var oldcont, i;
    
    if (argument0 < 0)
        return false;
    
    oldcont = global.controllering;
    global.controllering = 1;
    
    for (i = 0; i < array_length(argument1); i++)
    {
        if (argument1[i] > -1)
        {
            if (argument2 ? gamepad_button_check_pressed(argument0, argument1[i]) : (-argument2 ? gamepad_button_check_released(argument0, argument1[i]) : gamepad_button_check(argument0, argument1[i])))
                return true;
        }
        else
        {
            switch (argument1[i])
            {
                case -1:
                    if (gamepad_axis_value(argument0, gp_axislh) > global.input_controller_deadzone_horizontal || gamepad_axis_value(argument0, gp_axisrh) > global.input_controller_deadzone_horizontal)
                    {
                        if (argument2 && !stickpressed_h && (gamepad_axis_value(argument0, gp_axislh) > global.input_controller_deadzone_press || gamepad_axis_value(argument0, gp_axisrh) > global.input_controller_deadzone_press))
                            return true;
                        
                        if (argument2 == 0)
                            return true;
                    }
                    else if (-argument2 && stickpressed_h)
                    {
                        return true;
                    }
                    
                    break;
                
                case -2:
                    if (gamepad_axis_value(argument0, gp_axislh) < -global.input_controller_deadzone_horizontal || gamepad_axis_value(argument0, gp_axisrh) < -global.input_controller_deadzone_horizontal)
                    {
                        if (argument2 && !-stickpressed_h && (gamepad_axis_value(argument0, gp_axislh) < -global.input_controller_deadzone_press || gamepad_axis_value(argument0, gp_axisrh) < -global.input_controller_deadzone_press))
                            return true;
                        
                        if (argument2 == 0)
                            return true;
                    }
                    else if (-argument2 && -stickpressed_h)
                    {
                        return true;
                    }
                    
                    break;
                
                case -3:
                    if (gamepad_axis_value(argument0, gp_axislv) < -global.input_controller_deadzone_vertical || gamepad_axis_value(argument0, gp_axisrv) < -global.input_controller_deadzone_vertical)
                    {
                        if (argument2 && !stickpressed_v && (gamepad_axis_value(argument0, gp_axislv) < -global.input_controller_deadzone_press || gamepad_axis_value(argument0, gp_axisrv) < -global.input_controller_deadzone_press))
                            return true;
                        
                        if (argument2 == 0)
                            return true;
                    }
                    else if (-argument2 && stickpressed_v)
                    {
                        return true;
                    }
                    
                    break;
                
                case -4:
                    if (gamepad_axis_value(argument0, gp_axislv) > global.input_controller_deadzone_vertical || gamepad_axis_value(argument0, gp_axisrv) > global.input_controller_deadzone_vertical)
                    {
                        if (argument2 && !-stickpressed_v && (gamepad_axis_value(argument0, gp_axislv) > global.input_controller_deadzone_press || gamepad_axis_value(argument0, gp_axisrv) > global.input_controller_deadzone_press))
                            return true;
                        
                        if (argument2 == 0)
                            return true;
                    }
                    else if (-argument2 && -stickpressed_v)
                    {
                        return true;
                    }
                    
                    break;
            }
        }
    }
    
    global.controllering = oldcont;
    return false;
}
