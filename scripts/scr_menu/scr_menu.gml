function menu_goto(argument0)
{
    var i, b;
    
    menu = 0;
    
    for (i = 0; i < array_length(menus); i++)
    {
        b = menus[i];
        
        if (b.menu_id == argument0)
        {
            menu = i;
            break;
        }
    }
    
    optionselected = 0;
}

function create_menu_fixed(argument0, argument1, argument2, argument3, argument4 = UnknownEnum.Value_0)
{
    return 
    {
        menu_id: argument0,
        type: UnknownEnum.Value_0,
        anchor: argument1,
        xpad: argument2,
        ypad: argument3,
        backmenu: argument4,
        options: []
    };
}

function add_option_press(argument0, argument1, argument2, argument3)
{
    var b;
    
    b = 
    {
        option_id: argument1,
        type: UnknownEnum.Value_2,
        func: argument3,
        name: argument2,
        localization: true
    };
    array_push(argument0.options, b);
    return b;
}

function add_option_toggle(argument0, argument1, argument2, argument3 = -4)
{
    var b;
    
    b = 
    {
        option_id: argument1,
        type: UnknownEnum.Value_0,
        value: false,
        name: argument2,
        on_changed: argument3
    };
    array_push(argument0.options, b);
    return b;
}

function add_option_multiple(argument0, argument1, argument2, argument3, argument4 = -4)
{
    var b;
    
    b = 
    {
        option_id: argument1,
        type: UnknownEnum.Value_1,
        values: argument3,
        value: 0,
        name: argument2,
        on_changed: argument4
    };
    array_push(argument0.options, b);
    return b;
}

function create_option_value(argument0, argument1, argument2 = true)
{
    return 
    {
        name: argument0,
        value: argument1,
        localization: argument2
    };
}

function add_option_slide(argument0, argument1, argument2, argument3 = -4, argument4 = -4, argument5 = -4)
{
    var b;
    
    b = 
    {
        option_id: argument1,
        type: UnknownEnum.Value_3,
        value: 100,
        moved: false,
        name: argument2,
        on_changed: argument4,
        on_move: argument3,
        slidecount: 0,
        moving: false,
        sound: -4
    };
    
    if (argument5 != -4)
        b.sound = fmod_event_create_instance(argument5);
    
    array_push(argument0.options, b);
    return b;
}
