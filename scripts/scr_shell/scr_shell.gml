function get_room_list()
{
    var listarr, i;
    
    listarr = [];
    
    for (i = 0; i < room_last; i++)
        array_push(listarr, room_get_name(i));
    
    return listarr;
}

function get_object_list()
{
    var listarr, i;
    
    listarr = [];
    i = 0;
    
    while (object_exists(i))
    {
        i++;
        array_push(listarr, object_get_name(i));
    }
    
    return listarr;
}

function sh_noclip()
{
    with (obj_player1)
        state = UnknownEnum.Value_207;
}

function meta_noclip()
{
    return 
    {
        description: "Allows you to fly through walls"
    };
}

function sh_givekey()
{
    instance_create(obj_player1.x, obj_player1.y, obj_key);
}

function meta_givekey()
{
    return 
    {
        description: "Gives you a key"
    };
}

function sh_alltoppins()
{
    if (!instance_exists(obj_pizzakinshroom))
        instance_create(obj_player1.x, obj_player1.y, obj_pizzakinshroom);
    
    if (!instance_exists(obj_pizzakincheese))
        instance_create(obj_player1.x, obj_player1.y, obj_pizzakincheese);
    
    if (!instance_exists(obj_pizzakintomato))
        instance_create(obj_player1.x, obj_player1.y, obj_pizzakintomato);
    
    if (!instance_exists(obj_pizzakinsausage))
        instance_create(obj_player1.x, obj_player1.y, obj_pizzakinsausage);
    
    if (!instance_exists(obj_pizzakinpineapple))
        instance_create(obj_player1.x, obj_player1.y, obj_pizzakinpineapple);
    
    global.shroomfollow = true;
    global.cheesefollow = true;
    global.tomatofollow = true;
    global.sausagefollow = true;
    global.pineapplefollow = true;
}

function meta_alltoppins()
{
    return 
    {
        description: "Gives all Toppins"
    };
}

function sh_panic(argument0)
{
    if (array_length(argument0) > 1)
    {
        global.panic = bool(argument0[1]);
        argument0[2] = real(argument0[2]) * 60 * 12;
        argument0[3] = real(argument0[3]) * 12;
        global.fill = argument0[2] + argument0[3];
        
        if (global.panic)
            obj_camera.alarm[1] = 60;
    }
    else
    {
        global.panic = !global.panic;
        global.fill = 4000;
        
        if (global.panic)
            obj_camera.alarm[1] = 60;
    }
}

function meta_panic()
{
    return 
    {
        description: "Sets Pizza Time",
        arguments: ["<bool>", "<minutes>", "<seconds>"],
        suggestions: [["true", "false"], [], []]
    };
}

function sh_toggle_collisions(argument0)
{
    argument0[1] = bool(argument0[1]);
    showcollisions = argument0[1];
    event_perform(ev_other, ev_room_start);
}

function meta_toggle_collisions()
{
    return 
    {
        description: "Toggles the visibility of collisions",
        arguments: ["<bool>"],
        suggestions: [["true", "false"]]
    };
}

function sh_room_goto(argument0)
{
    argument0[1] = asset_get_index(argument0[1]);
    
    with (obj_player)
    {
        if (room_exists(argument0[1]))
        {
            targetRoom = argument0[1];
            targetDoor = argument0[2];
            instance_create(x, y, obj_fadeout);
        }
        else
        {
            return "Room does not exist!";
        }
    }
}

function meta_room_goto()
{
    return 
    {
        description: "Warps the player to a given room",
        arguments: ["<room>", "<door>"],
        suggestions: [get_room_list(), ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]]
    };
}

function sh_showhud(argument0)
{
    if (array_length(argument0) > 1)
        showhud = bool(argument0[1]);
    else
        showhud = !showhud;
}

function meta_showhud()
{
    return 
    {
        description: "Toggles hud",
        arguments: ["<bool>"],
        suggestions: [["true", "false"]]
    };
}

function sh_switch_character(argument0)
{
    with (obj_player1)
    {
        switch (argument0[1])
        {
            case "N":
                ispeppino = false;
                character = "P";
                break;
            
            case "PN":
                ispeppino = false;
                character = "N";
                break;
            
            case "V":
                ispeppino = false;
                character = "V";
                break;
            
            default:
                ispeppino = true;
                character = "P";
                break;
        }
        
        scr_characterspr();
    }
}

function meta_switch_character()
{
    return 
    {
        description: "Switches the character",
        arguments: ["<character>"],
        suggestions: [["P", "N", "PN", "V"]]
    };
}
