event_inherited();
portrait = 2332;
dialog[0] = dialog_create("[wave]Hi Peppino[/], [shake]how the fuck are ya[/]");
dialog[1] = dialog_create("{P}please kill me i have bugs in my skin");

if (!obj_player1.ispeppino)
    instance_destroy();
