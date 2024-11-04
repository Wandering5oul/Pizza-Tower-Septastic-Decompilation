var n, i;

depth = -500;
DEBUG = 1;
debugkey = (os_type != os_macosx) ? 116 : 53;

if (parameter_count() > 2)
    DEBUG = 1;

if (!DEBUG)
{
    n = parameter_count();
    
    for (i = 0; i < n; i++)
    {
        if (parameter_string(i) == "-debug")
            DEBUG = 1;
    }
}

DEBUG = false;

if (!DEBUG)
    instance_destroy();

if (DEBUG)
{
    active = 0;
    GIVEKEY = new DebugCommand("givekey", "", "", function()
    {
        global.key_inv = 1;
    });
    LOADTEST = new DebugCommand("loadtest", "", "", function()
    {
        with (obj_debugcontroller)
        {
            DoCommand("showcollisions 1");
            DoCommand("player_room rm_testing4 A");
        }
    });
    SETCOMBO = new DebugCommand("set_combo", "Set the combo", "<combo> <combotime:optional>", function(argument0, argument1)
    {
        if (argument0 == undefined)
            exit;
        
        if (argument1 == undefined)
            argument1 = 60;
        
        global.combo = argument0;
        global.combotime = argument1;
        
        with (obj_player)
            supercharge = 10;
    });
    GIVEHEAT = new DebugCommand("giveheat", "Gives heat", "", function()
    {
        global.style += 100;
    });
    ALLTOPPINS = new DebugCommand("alltoppins", "Adds all the toppins", "", function()
    {
        if (!instance_exists(obj_pizzakincheese))
            instance_create(obj_player1.x, obj_player1.y, obj_pizzakincheese);
        
        if (!instance_exists(obj_pizzakintomato))
            instance_create(obj_player1.x, obj_player1.y, obj_pizzakintomato);
        
        if (!instance_exists(obj_pizzakinsausage))
            instance_create(obj_player1.x, obj_player1.y, obj_pizzakinsausage);
        
        if (!instance_exists(obj_pizzakinpineapple))
            instance_create(obj_player1.x, obj_player1.y, obj_pizzakinpineapple);
        
        if (!instance_exists(obj_pizzakinshroom))
            instance_create(obj_player1.x, obj_player1.y, obj_pizzakinshroom);
        
        global.cheesefollow = 1;
        global.tomatofollow = 1;
        global.sausagefollow = 1;
        global.pineapplefollow = 1;
        global.shroomfollow = 1;
    });
    PANIC = new DebugCommand("panic", "Toggles pizza time", "<minutes> <seconds>", function(argument0, argument1)
    {
        if (argument0 != undefined)
        {
            argument0 = get_number_string(argument0);
            global.minutes = argument0;
        }
        
        if (argument1 != undefined)
        {
            argument1 = get_number_string(argument1);
            global.seconds = clamp(argument1, 0, 60);
        }
        
        global.panic = !global.panic;
        
        if (global.panic)
            obj_camera.alarm[1] = 60;
    });
    SHOW_COLLISIONS = new DebugCommand("showcollisions", "Shows the collisions", "<bool>", function(argument0)
    {
        if (argument0 == undefined)
            exit;
        
        argument0 = get_bool(argument0);
        
        if (argument0 != undefined)
        {
            showcollisions = argument0;
            event_perform(ev_other, ev_room_start);
        }
    });
    SHOW_HUD = new DebugCommand("showhud", "Shows the HUD", "<bool>", function(argument0)
    {
        if (argument0 == undefined)
            exit;
        
        argument0 = get_bool(argument0);
        show_debug_message(!argument0);
        
        if (argument0 != undefined)
        {
            showhud = argument0;
            
            with (obj_tv)
            {
                visible = argument0;
                show_debug_message(visible);
            }
            
            with (obj_camera)
            {
                visible = argument0;
                show_debug_message(visible);
            }
            
            with (obj_roomname)
            {
                visible = argument0;
                show_debug_message(visible);
            }
            
            with (obj_pigtotal)
            {
                visible = argument0;
                show_debug_message(visible);
            }
        }
    });
    PLAYER_ROOM = new DebugCommand("player_room", "Go to given room", "<targetRoom> <targetDoor>", function(argument0, argument1)
    {
        if (argument0 == undefined)
            exit;
        
        if (argument1 == undefined)
            exit;
        
        argument0 = asset_get_index(argument0);
        
        if (argument0 == -1)
            exit;
        
        with (obj_player)
        {
            targetRoom = argument0;
            targetDoor = argument1;
        }
        
        instance_create(x, y, obj_fadeout);
    });
    CAMERA_ZOOM = new DebugCommand("camera_zoom", "Zoom", "<targetzoom> <spd>", function(argument0, argument1)
    {
        if (argument0 == undefined)
            exit;
        
        if (argument1 != undefined)
            argument1 = get_number_string(argument1);
        
        with (obj_camera)
        {
            targetzoom = argument0;
            targetzoom = clamp(targetzoom, 0, max_zoom);
            
            if (argument1 != undefined)
                zoomspd = abs(argument1);
        }
    });
    DESTROYICE = new DebugCommand("destroyice", "", "", function()
    {
        instance_destroy(obj_iceblock);
        instance_destroy(obj_iceblockslope);
    });
    HARDMODE = new DebugCommand("hardmode", "Toggles hardmode", "<bool>", function(argument0)
    {
        if (argument0 == undefined)
            exit;
        
        argument0 = get_bool(argument0);
        show_debug_message(!argument0);
        
        if (argument0 != undefined)
        {
            global.hardmode = argument0;
            
            with (obj_hardmode)
                event_perform(ev_other, ev_room_start);
        }
    });
    PLAYER_SET_STATE = new DebugCommand("player_set_state", "Changes the player state", "<states.state>", function(argument0)
    {
        var _spr;
        
        if (argument0 == undefined)
            exit;
        
        argument0 = ds_map_find_value(state_map, argument0);
        
        if (!is_undefined(argument0))
        {
            with (obj_player)
            {
                if (object_index == obj_player1 || global.coop)
                {
                    state = argument0;
                    _spr = sprite_index;
                    
                    switch (argument0)
                    {
                        case UnknownEnum.Value_0:
                            _spr = spr_idle;
                            break;
                        
                        case 24:
                            _spr = spr_cheesepep_idle;
                            break;
                        
                        case 47:
                            _spr = spr_knightpepidle;
                            break;
                        
                        case 10:
                            _spr = spr_firemouth;
                            break;
                        
                        case 191:
                            _spr = spr_player_ratmountidle;
                            break;
                    }
                    
                    sprite_index = _spr;
                    image_index = 0;
                }
            }
        }
    });
    active = 0;
    showcollisions = 1;
    showhud = 1;
    state_map = ds_map_create();
    ds_map_set(state_map, "states.normal", UnknownEnum.Value_0);
    ds_map_set(state_map, "states.cheesepep", 24);
    ds_map_set(state_map, "states.knightpep", 47);
    ds_map_set(state_map, "states.firemouth", 10);
    ds_map_set(state_map, "states.ratmount", 191);
    command_list = ds_list_create();
    ds_list_add(command_list, DESTROYICE, SHOW_HUD, SHOW_COLLISIONS, PLAYER_ROOM, CAMERA_ZOOM, HARDMODE, PLAYER_SET_STATE, PANIC, ALLTOPPINS, GIVEHEAT);
    ds_list_add(command_list, SETCOMBO, GIVEKEY, LOADTEST);
    input_text = "";
    text_list = ds_list_create();
    search_commands = ds_list_create();
    ds_list_clear(search_commands);
    search_w = 0;
    keyboard_string = "";
    
    function FindCommand(argument0)
    {
        var i, b;
        
        for (i = 0; i < ds_list_size(command_list); i++)
        {
            b = ds_list_find_value(command_list, i);
            
            if (b.command_id == argument0)
                return b;
        }
        
        return undefined;
    }
    
    function DoCommand(argument0)
    {
        var commands, c;
        
        commands = string_split(argument0, " ");
        
        if (array_length(commands) > 1)
        {
            c = FindCommand(commands[1]);
            
            if (c != undefined)
            {
                TextList_Add(UnknownEnum.Value_1, argument0);
                array_delete(commands, 0, 2);
                commands.Invoke(c);
                return 1;
            }
            else
            {
                TextList_Add(UnknownEnum.Value_0, argument0);
                TextList_Add(UnknownEnum.Value_3, "Invalid command");
            }
        }
        else
        {
            TextList_Add(UnknownEnum.Value_0, argument0);
            TextList_Add(UnknownEnum.Value_3, "No text typed");
        }
        
        return 0;
    }
    
    function GetDouble(argument0)
    {
        var n;
        
        n = string_digits(argument0);
        
        if (n != undefined && n != "")
        {
            n = real(argument0);
            return n;
        }
        
        return undefined;
    }
    
    function get_bool(argument0)
    {
        if (argument0 == "true")
        {
            argument0 = 1;
            return argument0;
        }
        else if (argument0 == "false")
        {
            argument0 = 0;
            return argument0;
        }
        else if (is_real(real(string_digits(argument0))))
        {
            argument0 = bool(real(string_digits(argument0)));
            return argument0;
        }
        
        return undefined;
    }
    
    function get_number_string(argument0)
    {
        var n;
        
        n = argument0;
        
        if (is_string(argument0))
        {
            n = real(string_digits(argument0));
            
            if (string_char_at(argument0, 1) == "-")
                n = -real(string_digits(argument0));
        }
        
        return n;
    }
}
