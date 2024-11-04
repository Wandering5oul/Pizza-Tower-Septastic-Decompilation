var i, name;

draw_rectangle_color(0, 0, 960, 540, c_black, c_black, c_black, c_black, 0);

if (player)
    draw_text_colour(280, 25, "PLAYER 2", c_white, c_white, c_white, c_white, 1);

if (key_select == -1)
    draw_text_colour(280, 0, "BACK", c_white, c_white, c_white, c_white, 1);
else
    draw_text_colour(280, 0, "BACK", c_white, c_white, c_white, c_white, 0.5);

for (i = 0; i < array_length(keys); i++)
{
    draw_set_halign(fa_right);
    name = string_upper(string_delete(keys[i], 1, 4));
    
    if (key_select == i)
        draw_text_colour(420, i * 50, name, c_white, c_white, c_white, c_white, 1);
    else
        draw_text_colour(420, i * 50, name, c_white, c_white, c_white, c_white, 0.5);
    
    draw_set_halign(fa_left);
    
    if (controller)
        draw_text(480, i * 50, scr_keyname(variable_global_get(player ? (keys[i] + "CN") : (keys[i] + "C"))));
    else
        draw_text(480, i * 50, scr_keyname(variable_global_get(player ? (keys[i] + "N") : keys[i])));
}

if (sprite == cur.spr_taunt && tauntimg < sprite_get_number(spr_taunteffect))
    draw_sprite(spr_taunteffect, tauntimg, 200, 270 + yy);

shader_set(global.Pal_Shader);
pal_swap_set(cur.spr_palette, 1, 0);

if (key_select == 3)
    draw_sprite_ext(sprite, image, 200, 270 + yy, -1, 1, 0, c_white, 1);
else
    draw_sprite(sprite, image, 200, 270 + yy);

shader_reset();
