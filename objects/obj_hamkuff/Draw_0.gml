var dis, w, len, dir, xx, yy, i;

if (state == UnknownEnum.Value_205)
{
    dis = point_distance(x, y, obj_player1.x, obj_player1.y);
    w = 24;
    len = dis div w;
    dir = point_direction(x, y + 32, playerid.x, playerid.y + 16);
    xx = lengthdir_x(w, dir);
    yy = lengthdir_y(w, dir);
    
    for (i = 0; i < len; i++)
        draw_sprite_ext(spr_hamkuff_sausage, -1, x + (xx * i), y + 32 + (yy * i), 1, 1, dir, c_white, 1);
}
