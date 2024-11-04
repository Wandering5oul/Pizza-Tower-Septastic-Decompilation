image_xscale = playerid.xscale;

if (playerid.state != UnknownEnum.Value_184 && playerid.state != UnknownEnum.Value_121 && playerid.state != UnknownEnum.Value_102 && playerid.state != UnknownEnum.Value_153)
    instance_destroy();

x = playerid.x + (((playerid.character == "M") ? 18 : 0) * playerid.xscale);
y = playerid.y - ((playerid.character == "M") ? 10 : 0);
visible = !(room == rank_room);
