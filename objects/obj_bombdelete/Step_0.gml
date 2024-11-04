sprite_index = !collide ? spr_bomb : -4;

if (instance_exists(obj_bomb))
    collide = 0;

if (obj_player1.state != UnknownEnum.Value_183)
    collide = 0;
