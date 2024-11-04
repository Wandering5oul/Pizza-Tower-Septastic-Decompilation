var i;

if (visible)
{
    shader_set(global.Pal_Shader);
    pal_swap_set(spr_titlepalette, level, 0);
    draw_sprite_tiled(spr_titlebg, 0, timer * 50, sin(timer) * 50);
    shader_reset();
    draw_sprite(spr_titlepep, 0, playerx, 0);
    
    for (i = -1; i < ceil(960 / textwd); i++)
        draw_sprite(spr_titletext, 0, ((timer % 1) + i) * textwd, textyy);
    
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_middle);
    draw_set_font(global.creditsfont);
    
    for (i = -1; i < ceil(960 / textw); i++)
        draw_text(((timer % (textw / textwd)) * textwd) + (i * textw), texty, text);
    
    draw_set_valign(fa_top);
    draw_sprite(spr_titles, level, 0, titley);
    draw_sprite(toppinspr, (timer * 60 * 0.35) % toppinlen, 846, 342);
    draw_set_alpha(mortalpha);
    draw_sprite(spr_lookmort, 0, 0, 0);
    draw_set_alpha(1);
}

draw_set_alpha(fadealpha);
draw_set_color(c_black);
draw_rectangle(0, 0, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), false);
draw_set_alpha(1);
