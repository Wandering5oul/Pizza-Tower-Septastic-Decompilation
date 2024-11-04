var _vinst, bbox_size, i, _inst;

savedhallwaydirection = hallwaydirection;
savedhallway = hallway;
savedvhallwaydirection = vhallwaydirection;
savedverticalhallway = verticalhallway;

with (obj_secretportal)
{
    if (secret)
    {
        instance_create_unique(0, 0, 261);
        
        if (!instance_exists(obj_ghostcollectibles))
        {
            instance_create(0, 0, obj_ghostcollectibles);
            trace(instance_number(obj_ghostcollectibles));
        }
    }
}

if (global.levelreset)
{
    scr_playerreset();
    global.levelreset = 0;
    instance_destroy(obj_comboend);
    instance_destroy(obj_combotitle);
    global.combodropped = false;
}

if (global.levelcomplete)
{
    x = backtohubstartx;
    y = backtohubstarty;
    roomstartx = x;
    roomstarty = y;
    exit;
}

if (state == UnknownEnum.Value_95 && global.coop == 1 && !place_meeting(x, y, obj_exitgate))
{
    if (object_index == obj_player1 && obj_player1.spotlight == 0)
        visible = false;
    
    if (object_index == obj_player2 && obj_player1.spotlight == 1)
        visible = false;
}

if (global.coop == 1)
{
    scr_changetoppings();
    
    if (!instance_exists(obj_cooppointer))
        instance_create(x, y, obj_cooppointer);
    
    if (!instance_exists(obj_coopflag))
        instance_create(x, y, obj_coopflag);
}

if (state == UnknownEnum.Value_79)
    state = UnknownEnum.Value_0;

if (place_meeting(x, y, obj_boxofpizza) || place_meeting(x, y - 1, obj_boxofpizza))
{
    box = 1;
    hallway = 0;
    state = UnknownEnum.Value_100;
}

if (object_index != obj_player2 || global.coop == 1)
{
    if (targetDoor != "S" && targetDoor != "LAP" && targetDoor != "HUB" && targetDoor != "none")
        player_door_goto();
}

if (verticalhallway)
{
    verticalbuffer = 2;
    _vinst = -4;
    
    with (obj_verticalhallway)
    {
        event_perform(ev_step, ev_step_normal);
        
        if (targetDoor == other.targetDoor)
            _vinst = id;
    }
    
    if (_vinst != -4)
    {
        x = _vinst.x + (_vinst.sprite_width * vertical_x);
        bbox_size = abs(bbox_right - bbox_left);
        x = clamp(x, _vinst.x + bbox_size, _vinst.bbox_right - bbox_size);
        trace(x, _vinst.x);
        
        if (vhallwaydirection > 0)
            y = _vinst.bbox_bottom + 32;
        else
            y = _vinst.bbox_top - 78;
        
        if (state == UnknownEnum.Value_37)
        {
            x = round(x);
            i = 0;
            
            while (!place_meeting(x + xscale, y, obj_solid))
            {
                x += xscale;
                i++;
                
                if (i > room_width)
                    break;
                else
                    continue;
            }
        }
        
        y += verticalhall_vsp;
        vsp = verticalhall_vsp;
    }
    
    y += (vhallwaydirection * 20);
    y = floor(y);
}

if (character == "M" && place_meeting(x, y, obj_boxofpizza))
{
    while (place_meeting(x, y, obj_boxofpizza))
    {
        _inst = instance_place(x, y, obj_boxofpizza);
        y -= _inst.image_yscale;
    }
}

hallway = false;
verticalhallway = false;
box = false;

if (place_meeting(x, y, obj_exitgate))
{
    global.prank_cankillenemy = true;
    
    with (instance_place(x, y, obj_exitgate))
        other.x = x;
}

x = floor(x);
y = floor(y);
roomstartx = x;
roomstarty = y;
