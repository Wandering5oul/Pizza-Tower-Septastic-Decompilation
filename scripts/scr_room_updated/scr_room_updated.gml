function scr_room_updated(argument0)
{
    with (obj_player)
    {
        hallway = savedhallway;
        hallwaydirection = savedhallwaydirection;
        vhallwaydirection = savedvhallwaydirection;
        verticalhallway = savedverticalhallway;
    }
    
    room_goto_live(argument0);
}
