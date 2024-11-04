function scr_initinput()
{
    var dz, dzv, dzh, dzp, dzs, dzc;
    
    ini_open("saveData.ini");
    global.key_up = ini_read_input("ControlsKeys", "up", [38]);
    global.key_right = ini_read_input("ControlsKeys", "right", [39]);
    global.key_left = ini_read_input("ControlsKeys", "left", [37]);
    global.key_down = ini_read_input("ControlsKeys", "down", [40]);
    global.key_jump = ini_read_input("ControlsKeys", "jump", [90]);
    global.key_slap = ini_read_input("ControlsKeys", "slap", [88]);
    global.key_taunt = ini_read_input("ControlsKeys", "taunt", [67]);
    global.key_shoot = ini_read_input("ControlsKeys", "shoot", [65]);
    global.key_attack = ini_read_input("ControlsKeys", "attack", [16]);
    global.key_start = ini_read_input("ControlsKeys", "start", [27]);
    global.key_chainsaw = ini_read_input("ControlsKeys", "chainsaw", [86]);
    global.key_superjump = ini_read_input("ControlsKeys", "superjump", []);
    global.key_groundpound = ini_read_input("ControlsKeys", "groundpound", []);
    global.key_upC = ini_read_input("ControllerButton", "up", [32781, -3]);
    global.key_rightC = ini_read_input("ControllerButton", "right", [32784, -1]);
    global.key_leftC = ini_read_input("ControllerButton", "left", [32783, -2]);
    global.key_downC = ini_read_input("ControllerButton", "down", [32782, -4]);
    global.key_jumpC = ini_read_input("ControllerButton", "jump", [32769]);
    global.key_slapC = ini_read_input("ControllerButton", "slap", [32771]);
    global.key_tauntC = ini_read_input("ControllerButton", "taunt", [32772]);
    global.key_shootC = ini_read_input("ControllerButton", "shoot", [32770]);
    global.key_attackC = ini_read_input("ControllerButton", "attack", [32774]);
    global.key_startC = ini_read_input("ControllerButton", "start", [32778]);
    global.key_chainsawC = ini_read_input("ControllerButton", "chainsaw", [32773]);
    global.key_superjumpC = ini_read_input("ControllerButton", "superjump", []);
    global.key_groundpoundC = ini_read_input("ControllerButton", "groundpound", []);
    dz = 0.4;
    dzv = 0.1;
    dzh = 0.1;
    dzp = 0.15;
    dzs = 0.85;
    dzc = 0.65;
    global.input_controller_deadzone = ini_read_real("ControlsConfig", "deadzone", dz);
    global.input_controller_deadzone_vertical = ini_read_real("ControlsConfig", "deadzone_vert", dzv);
    global.input_controller_deadzone_horizontal = ini_read_real("ControlsConfig", "deadzone_horiz", dzh);
    global.input_controller_deadzone_press = ini_read_real("ControlsConfig", "deadzonepress", dzp);
    global.gamepad_deadzone_superjump = ini_read_real("ControlsConfig", "deadzonesuperjump", dzs);
    global.gamepad_deadzone_crouch = ini_read_real("ControlsConfig", "deadzonecrouch", dzc);
    global.gamepad_superjump = ini_read_real("ControlsConfig", "superjump", 1);
    global.gamepad_groundpound = ini_read_real("ControlsConfig", "groundpound", 1);
    global.keyboard_superjump = ini_read_real("ControlsConfig", "kb_superjump", 1);
    global.keyboard_groundpound = ini_read_real("ControlsConfig", "kb_groundpound", 1);
    ini_close();
}

function ini_read_input(argument0, argument1, argument2)
{
    var str, arr, i;
    
    str = ini_read_string(argument0, argument1, "UNSET");
    
    if (str == "UNSET")
    {
        return argument2;
    }
    else
    {
        arr = string_split(str, ",", true);
        argument2 = [];
        
        for (i = 0; i < array_length(arr); i++)
            array_push(argument2, real(arr[i]));
        
        return argument2;
    }
}

function ini_write_input(argument0, argument1, argument2)
{
    var str, i;
    
    str = "";
    
    for (i = 0; i < array_length(argument2); i++)
        str += (string(argument2[i]) + ",");
    
    ini_write_string(argument0, argument1, str);
}
