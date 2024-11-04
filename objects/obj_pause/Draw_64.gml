var pad, xx, yy, i, text_width, c, character;

if (alpha > 0)
{
    draw_set_alpha(1);
    pad = 48;
    
    if (pause_screenshot != -4)
        draw_sprite_ext(pause_screenshot, 0, 0, 0, 0.5, 0.5, 0, c_white, 1);
    
    draw_set_alpha(alpha);
    draw_sprite_tiled(spr_pause_bg, 0, scroll, scroll);
    draw_set_halign(fa_right);
    draw_set_valign(fa_top);
    xx = 840;
    yy = 200;
    
    for (i = 0; i < array_length(pause_menu); i++)
    {
        text_width = string_width(pause_menu[i] + "AA");
        c = 8421504;
        yy = 200 + (pad * i);
        
        if (selected == i)
        {
            c = c_white;
            draw_sprite(spr_cursor, cursor_index, xx - text_width, yy + (cursor_sprite_height / 2));
        }
        
        draw_text_color(xx, yy, pause_menu[i], c, c, c, c, alpha);
    }
    
    draw_sprite(spr_pause_border, 0, border_x, border_y);
    draw_sprite(spr_pause_text, 0, 0, text_y);
    pause_draw_eyes(true);
    shader_set(global.Pal_Shader);
    pal_swap_set(spr_palette, paletteselect, 0);
    character = spr_pause_pep;
    
    if (!ispeppino)
        character = spr_pause_noise;
    
    draw_sprite(character, 0, 0, 0);
    shader_reset();
    pause_draw_eyes(false);
    draw_sprite_ext(spr_pause_shroom, 0, 0, 0, 1, 1, 0, global.shroomfollow ? c_white : c_black, alpha);
    draw_sprite_ext(spr_pause_cheese, 0, 0, 0, 1, 1, 0, global.cheesefollow ? c_white : c_black, alpha);
    draw_sprite_ext(spr_pause_tomat, 0, 0, 0, 1, 1, 0, global.tomatofollow ? c_white : c_black, alpha);
    draw_sprite_ext(spr_pause_sausage, 0, 0, 0, 1, 1, 0, global.sausagefollow ? c_white : c_black, alpha);
    draw_sprite_ext(spr_pause_pinea, 0, 0, 0, 1, 1, 0, global.pineapplefollow ? c_white : c_black, alpha);
    draw_set_alpha(1);
}
