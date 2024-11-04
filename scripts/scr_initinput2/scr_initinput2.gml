function scr_initinput2()
{
    ini_open("saveData.ini");
    global.key_upN = ini_read_input("ControlsKeys2", "up", [73]);
    global.key_rightN = ini_read_input("ControlsKeys2", "right", [76]);
    global.key_leftN = ini_read_input("ControlsKeys2", "left", [74]);
    global.key_downN = ini_read_input("ControlsKeys2", "down", [75]);
    global.key_jumpN = ini_read_input("ControlsKeys2", "jump", [83]);
    global.key_slapN = ini_read_input("ControlsKeys2", "slap", [68]);
    global.key_tauntN = ini_read_input("ControlsKeys2", "taunt", [70]);
    global.key_shootN = ini_read_input("ControlsKeys2", "shoot", [81]);
    global.key_attackN = ini_read_input("ControlsKeys2", "attack", [65]);
    global.key_startN = ini_read_input("ControlsKeys2", "start", [80]);
    global.key_chainsawN = ini_read_input("ControlsKeys", "chainsaw", [71]);
    global.key_superjumpN = ini_read_input("ControlsKeys2", "superjump", []);
    global.key_groundpoundN = ini_read_input("ControlsKeys2", "groundpound", []);
    global.key_upCN = ini_read_input("ControllerButton2", "up", [32781, -3]);
    global.key_rightCN = ini_read_input("ControllerButton2", "right", [32784, -1]);
    global.key_leftCN = ini_read_input("ControllerButton2", "left", [32783, -2]);
    global.key_downCN = ini_read_input("ControllerButton2", "down", [32782, -4]);
    global.key_jumpCN = ini_read_input("ControllerButton2", "jump", [32769]);
    global.key_slapCN = ini_read_input("ControllerButton2", "slap", [32771]);
    global.key_tauntCN = ini_read_input("ControllerButton2", "taunt", [32772]);
    global.key_shootCN = ini_read_input("ControllerButton2", "shoot", [32770]);
    global.key_attackCN = ini_read_input("ControllerButton2", "attack", [32774]);
    global.key_startCN = ini_read_input("ControllerButton2", "start", [32778]);
    global.key_chainsawCN = ini_read_input("ControlsKeys", "chainsaw", [32773]);
    global.key_superjumpCN = ini_read_input("ControllerButton2", "superjump", []);
    global.key_groundpoundCN = ini_read_input("ControllerButton2", "groundpound", []);
    ini_close();
}
