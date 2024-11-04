var moveset, noclip, collisions, bboxes;

if (obj_shell.isOpen)
    exit;

if (keyboard_check_pressed(vk_tab))
    active = !active;

moveset = keyboard_check_pressed(ord("1"));
noclip = keyboard_check_pressed(ord("2"));
collisions = keyboard_check_pressed(ord("3"));
bboxes = keyboard_check_pressed(ord("4"));

if (!active)
    exit;

if (moveset)
    global.option_septmoveset = !global.option_septmoveset;

if (noclip)
{
    with (obj_player)
    {
        if (state != UnknownEnum.Value_207)
            state = UnknownEnum.Value_207;
        else
            state = UnknownEnum.Value_0;
    }
}

if (collisions)
{
    with (obj_shell)
    {
        showcollisions = !showcollisions;
        event_perform(ev_other, ev_room_start);
    }
}
