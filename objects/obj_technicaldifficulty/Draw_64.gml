var c, cx, cy;

if (use_static)
{
    draw_sprite(spr_tvstatic, static_index, 0, 0);
}
else
{
    c = make_color_rgb(216, 104, 160);
    draw_rectangle_color(0, 0, 960, 540, c, c, c, c, false);
    cx = 0;
    cy = 0;
    draw_sprite(spr_technicaldifficulty_bg, bg_index, cx, cy);
    shader_set(global.Pal_Shader);
    pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, false);
    draw_sprite(sprite, player_index, cx + 300, cy + 352);
    shader_reset();
}
