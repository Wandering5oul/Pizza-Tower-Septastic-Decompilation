var r;

if (global.leveltosave == "forest" || global.leveltosave == "street")
    stick = true;
else if (irandom(100) <= 15)
    stick = true;

if (obj_player1.ispeppino)
{
    r = string_letters(room_get_name(room));
    
    if (sprite_index != spr_gustavo_exitsign)
        stick = false;
}

if (stick)
    ystart -= 6;
