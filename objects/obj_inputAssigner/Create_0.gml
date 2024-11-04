player_input_device[0] = -2;
player_input_device[1] = -2;
device_selected[0] = 0;
device_selected[1] = 0;
press_start = false;
deactivated = false;
player_index = 0;
device_to_reconnect = 0;
prevstate[0] = UnknownEnum.Value_18;
prevstate[1] = UnknownEnum.Value_18;
vibration = [[0, 0, 0], [0, 0, 0]];

function setVibration(argument0, argument1, argument2, argument3)
{
    vibration[argument0][0] = argument1;
    vibration[argument0][1] = argument2;
    
    if (argument3 != -4)
        vibration[argument0][2] = argument3;
}

function CheckUsedIndex(argument0)
{
    var _x;
    
    for (_x = 0; _x < 2; _x++)
    {
        if (player_input_device[_x] == argument0)
            return 1;
    }
    
    return 0;
}
