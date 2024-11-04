function scr_getinput2()
{
    var _dvc, count, i, in, dz, b, axis_value, inverted_axis;
    
    if (instance_exists(obj_debugcontroller) && obj_debugcontroller.active)
        exit;
    
    if (instance_exists(obj_shell) && obj_shell.isOpen)
        exit;
    
    _dvc = -1;
    count = gamepad_get_device_count();
    
    for (i = 0; i < count; i++)
    {
        if (gamepad_is_connected(i))
            _dvc = i;
    }
    
    gamepad_set_axis_deadzone(_dvc, global.input_controller_deadzone);
    key_up = get_input_keyboard(global.key_upN, 0) || get_input_controller(_dvc, global.key_upCN, 0);
    key_up2 = get_input_keyboard(global.key_upN, 1) || get_input_controller(_dvc, global.key_upCN, 1);
    key_right = get_input_keyboard(global.key_rightN, 0) || get_input_controller(_dvc, global.key_rightCN, 0);
    key_right2 = get_input_keyboard(global.key_rightN, 1) || get_input_controller(_dvc, global.key_rightCN, 1);
    key_left = -(get_input_keyboard(global.key_leftN, 0) || get_input_controller(_dvc, global.key_leftCN, 0));
    key_left2 = -(get_input_keyboard(global.key_leftN, 1) || get_input_controller(_dvc, global.key_leftCN, 1));
    key_down = get_input_keyboard(global.key_downN, 0) || get_input_controller(_dvc, global.key_downCN, 0);
    key_down2 = get_input_keyboard(global.key_downN, 1) || get_input_controller(_dvc, global.key_downCN, 1);
    key_jump = get_input_keyboard(global.key_jumpN, 1) || get_input_controller(_dvc, global.key_jumpCN, 1);
    key_jump2 = get_input_keyboard(global.key_jumpN, 0) || get_input_controller(_dvc, global.key_jumpCN, 0);
    key_slap = get_input_keyboard(global.key_slapN, 0) || get_input_controller(_dvc, global.key_slapCN, 0);
    key_slap2 = get_input_keyboard(global.key_slapN, 1) || get_input_controller(_dvc, global.key_slapCN, 1);
    key_taunt = get_input_keyboard(global.key_tauntN, 0) || get_input_controller(_dvc, global.key_tauntCN, 0);
    key_taunt2 = get_input_keyboard(global.key_tauntN, 1) || get_input_controller(_dvc, global.key_tauntCN, 1);
    key_attack = get_input_keyboard(global.key_attackN, 0) || get_input_controller(_dvc, global.key_attackCN, 0);
    key_attack2 = get_input_keyboard(global.key_attackN, 1) || get_input_controller(_dvc, global.key_attackCN, 1);
    key_shoot = 0;
    key_shoot2 = 0;
    key_start = get_input_keyboard(global.key_startN, 1) || get_input_controller(_dvc, global.key_startCN, 1);
    key_escape = keyboard_check_pressed(vk_escape) || gamepad_button_check(_dvc, gp_select);
    key_chainsaw = 0;
    key_chainsaw2 = 0;
    key_superjump = get_input_keyboard(global.key_superjumpN, 0) || get_input_controller(_dvc, global.key_superjumpCN, 0);
    key_groundpound = get_input_keyboard(global.key_groundpoundN, 1) || get_input_controller(_dvc, global.key_groundpoundCN, 1);
    key_groundpound2 = get_input_keyboard(global.key_groundpoundN, 0) || get_input_controller(_dvc, global.key_groundpoundCN, 0);
    
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
    
    if (object_index == obj_player2)
    {
        if (state == UnknownEnum.Value_99 || state == UnknownEnum.Value_100)
        {
            if (state == UnknownEnum.Value_99)
            {
                in = global.key_upCN;
                dz = global.gamepad_deadzone_superjump;
            }
            else
            {
                in = global.key_downCN;
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
